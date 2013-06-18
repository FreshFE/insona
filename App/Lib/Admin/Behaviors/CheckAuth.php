<?php
namespace App\Admin\Behaviors;

use Think\Behavior;
use Think\Session;
use Think\Redirect;
use Think\Url;

class CheckAuth extends Behavior
{
	public function run(&$param)
	{
		if(ACTION_NAME === 'login') {
			
			if($this->check()) {
				// echo '403';
				Redirect::success('登录成功', Url::make('index/index'));
			}

		} else {
			
			if(!$this->check()) {
				// echo '401';
				Redirect::error('请先登录账号', Url::make('account/login'));
			}

		}
	}

	protected function check()
	{
		if(Session::check('admin_auth')) {
			return true;
		} else {
			return false;
		}
	}
}