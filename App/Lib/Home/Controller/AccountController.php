<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Exception as Exception;
use Think\Debug as Debug;
use Think\Redirect as Redirect;
use Think\Session as Session;
use Think\Url as Url;

use Think\Library\Upload\Upload as Upload;

class AccountController extends Controller
{
	public function _empty()
	{
		$method = (Request::is('post') ? 'post_' : 'get_') . ACTION_NAME;
		$this->$method();
	}

	public function get_register()
	{
		$this->check_auth();
		$this->set_url_session();
		$this->display();
	}

	public function post_register()
	{
		try {
			$model = D('CompanyMember');

			if($data = $model->create())
			{
				// 添加到数据库
				$id = $model->add($data);

				if($id) {
					// 上传图片
					$info = Upload::image($_FILES['license_upload']);

					// 建立数据表
					$model->where(array('id' => $id))->save(array('license_cover' => $info['name']));

					// 成功注册，现在登录
					$this->set_auth($id);
				}
				else {
					throw new Exception("注册失败，请重试");
				}
			}
			else {
				throw new Exception($model->getError());
			}
		} catch(Exception $error)
		{
			Debug::output($error);
		}
	}

	public function get_login()
	{
		$this->check_auth();
		$this->set_url_session();
		$this->display();
	}

	public function post_login()
	{
		$model = M('CompanyMember');

		try {
			if($data = $model->create())
			{
				$data['password'] = sha1($data['password']);
				$validate = $model->where($data)->find();

				if($validate)
				{
					// 可以执行登录了
					$this->set_auth($validate['id']);
				}
				else {
					// 未登录
					throw new Exception("账号密码错误");
				}
			}
			else {
				throw new Exception($model->getError());
			}
		} catch(Exception $error)
		{
			Debug::output($error);
		}
	}

	protected function check_auth()
	{
		if(Session::get('com_auth_key'))
		{
			Redirect::success('登录inSona', Url::make('index/index'));
		}
	}

	protected function set_url_session()
	{
		Session::set('account_last_url', empty($_SERVER["HTTP_REFERER"]) ? __GROUP__ : $_SERVER["HTTP_REFERER"]);
	}

	protected function set_auth($user_id)
	{
		Session::set('com_auth_key', $user_id);
		Redirect::success('登录成功', Session::get('account_last_url'));
	}

	public function logout()
	{
		Session::set('com_auth_key', null);
		Redirect::success('退出成功');
	}
}