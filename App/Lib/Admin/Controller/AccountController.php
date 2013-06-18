<?php

use Think\Controller;
use Think\Redirect;
use Think\Url;
use Think\Session;

class AccountController extends Controller
{
	public function get_login()
	{
		$this->display();
	}

	public function post_login()
	{
		$username = $_POST['username'];
		$password = $_POST['password'];

		if($username === 'admin' && $password === '123456') {
			// 登录成功
			$this->createAuthSession();
			Redirect::success('登录成功', Url::make('index/index'));
		} else {
			// 账号密码错误
			Redirect::error('账号密码不匹配');
		}
	}

	public function logout()
	{
		$this->clearAuthSession();
		Redirect::success('退出成功', Url::make('account/login'));
	}

	protected function createAuthSession()
	{
		Session::set('admin_auth', 'admin');
	}

	protected function clearAuthSession()
	{
		Session::set('admin_auth', null);
	}
}