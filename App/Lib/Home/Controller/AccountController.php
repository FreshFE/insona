<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Exception as Exception;
use Think\Debug as Debug;
use Think\Redirect as Redirect;
use Think\Session as Session;
use Think\Url as Url;
use Think\Import as Import;

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

	public function get_forget()
	{
		$this->display();
	}

	public function post_forget()
	{
		$_POST['email'] = trim($_POST['email']);

		// 查找是否存在该用户
		$data = M('CompanyMember')->where(array('email' => $_POST['email']))->find();

		if($data)
		{
			// 存在的话，检查code是否存在近期的
			$forget = M('Forget')->where(array('email' => $_POST['email']))->find();



			if($forget)
			{
				M('Forget')->where(array('id' => $forget['id']))->save(array('createline' => time()));
				$id = $forget['id'];
			}
			else {
				$id = M('Forget')->add(array(
					'code' => uniqid(),
					'email' => $_POST['email'],
					'createline' => time()
				));
			}

			$forget = M('Forget')->find($id);

			// 检查是否存在 HTTP_ORIGIN
			// if(!$_SERVER['HTTP_ORIGIN']) {
			// 	$http_host = 'http://insona.cc/';
			// }
			// else {
			// 	$http_host = $_SERVER['HTTP_ORIGIN'];
			// }

			$http_host = 'http://insona.cc';

			// $link
			$link = $http_host . __URL__ . '/findpassword?code=' . $forget['code'];

			// 发送Email
			$title = "inSona 找回密码";
			$send = '点击以下链接找回您的密码，两小时内有效<br/><a href="'.$link.'">'.$link.'</a>';
			$tosend = $forget['email'];

			$this->sendMail($title, $send, $tosend);

			Redirect::success('找回邮件已经发送到您的邮箱，请及时查收，两小时内有效');
		}
		else {
			// 不存在的话返回
			Redirect::error('该邮箱地址未注册过inSona，检查一下是否拼写错误');
		}
	}

	public function get_findpassword()
	{
		$this->display();
	}

	public function post_findpassword()
	{
		$model = M('Forget');

		if($_POST['password'] != $_POST['repassword'])
		{
			Redirect::error('两次密码不相同');
		}
		
		if(isset($_POST['code']))
		{
			$code = $model->where(array('code' => $_POST['code']))->find();

			if($code)
			{
				$data = M('CompanyMember')->where(array('email' => $code['email']))->find();
				if($data)
				{
					$user_id = M('CompanyMember')->where(array('id' => $data['id']))->save(array('password' => sha1($_POST['password'])));
					M('Forget')->where(array('code' => $_POST['code']))->delete();
					Redirect::success('密码重置成功，请重新登录', Url::make('account/login'));
				}
				else {
					Redirect::error('不存在您重置密码的账户，请重新在找回密码页面中输入您的电子邮箱');
				}
			}
			else {
				Redirect::error('您使用的重置密码页面已经超过两个小时，请重新在找回密码页面中输入您的电子邮箱');
			}
		}
		else {
			Redirect::error('您使用的重置密码页面操作无效，请重新在找回密码页面中输入您的电子邮箱');
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

	/**
	 * 用于发送邮件的类
	 *
	 * @param string $title 邮件标题
	 * @param string $send 邮件内容
	 * @param string $sendto 收件人的邮件地址，可以使用","来写入多个电子邮件地址
	 */
	protected function sendMail($title, $send, $sendto) {
	    
	    //标题防止乱码
	    $title = iconv("utf-8", "gbk", $title);
	    $title = "=?GB2312?B?" . base64_encode($title) . "?=";

	    // 实例化
	    Import::load(CORE_PATH . 'Library/Phpmailer/Phpmailer.class.php');
	    $phpmailer = new PhpMailer();

	    // 配置
	    $phpmailer->IsSMTP();
	    $phpmailer->SMTPAuth 	= true;
	    $phpmailer->Host 		= 'smtp.insona.cc';
	    $phpmailer->Port 		= 25;
	    $phpmailer->Username 	= 'service@insona.cc';
	    $phpmailer->Password 	= 'Control4inSona';
	    $phpmailer->From 		= 'service@insona.cc';
	    $phpmailer->FromName 	= 'inSona';
	    $phpmailer->CharSet 	= "utf-8";
	    // $phpmailer->SMTPDebug 	= true;
	    //$phpmailer->AddReplyTo($this->site['smtp_user'],$this->site['sitename']);

	    // 遍历发件人
	    $mails = explode(',', $sendto);

	    foreach ($mails as $key => $val) {
	        $phpmailer->AddAddress($val);
	    }

	    // 设置发送信息
	    $phpmailer->Subject 	= $title;
	    $phpmailer->WordWrap 	= 80;
	    $phpmailer->MsgHTML($send);
	    $phpmailer->IsHTML(true);

	    $isSend = $phpmailer->Send();

	    // 发送
	    if(!$isSend) {
	    	Redirect::error('邮件发送错误，请重试');
	    }
	}
}