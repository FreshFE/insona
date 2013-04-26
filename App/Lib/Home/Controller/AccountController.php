<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Exception as Exception;
use Think\Debug as Debug;
use Think\Redirect as Redirect;
use Think\Session as Session;
use Think\Url as Url;

use Think\Library\Upload\Upload as Upload;

/**
 * 账户管理类
 * 控制用户注册、登录、退出等功能
 */
class AccountController extends Controller
{
	/**
	 * 空方法名执行empty
	 * empty分析后执行到post或get方法上
	 */
	public function _empty()
	{
		$method = (Request::is('post') ? 'post_' : 'get_') . ACTION_NAME;
		$this->$method();
	}

	/**
	 * 注册的get方法
	 */
	public function get_register()
	{
		$this->check_auth();
		$this->set_url_session();
		$this->display();
	}

	/**
	 * 注册的post方法
	 */
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
			Redirect::error($error->getMessage());
		}
	}

	/**
	 * 登录的get方法
	 */
	public function get_login()
	{
		$this->check_auth();
		$this->set_url_session();
		$this->display();
	}

	/**
	 * 登录的post方法
	 */
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
			Redirect::error($error->getMessage());
		}
	}

	/**
	 * 检查用户是否登录，如果已经登录无法操作
	 */
	protected function check_auth()
	{
		if(Session::get('com_auth_key'))
		{
			Redirect::success('登录inSona', Url::make('index/index'));
		}
	}

	/**
	 * 设置来访页面的url，将该url存在session内
	 */
	protected function set_url_session()
	{
		if(strpos($_SERVER['HTTP_REFERER'], 'account') === false)
		{
			Session::set('account_last_url', empty($_SERVER["HTTP_REFERER"]) ? __GROUP__ : $_SERVER["HTTP_REFERER"]);
		}
		else {
			Session::set('account_last_url', __GROUP__);
		}
	}

	/**
	 * 保存登录信息
	 */
	protected function set_auth($user_id)
	{
		Session::set('com_auth_key', $user_id);
		Redirect::success('登录成功', Session::get('account_last_url'));
	}

	/**
	 * 退出账户
	 */
	public function logout()
	{
		Session::set('com_auth_key', null);
		Redirect::success('退出成功');
	}

	/**
	 * 返回登录
	 */
	public function loginback()
	{
		Redirect::success('登录返回', Session::get('account_last_url'));
	}

	public function checkregister()
	{
		$model = D('CompanyMember');

		if($data = $model->create())
		{
			$this->json(array('success' => 1));
		}
		else {
			$this->json(array('success' => 0, 'error_msg' => $model->getError()));
		}
	}
}