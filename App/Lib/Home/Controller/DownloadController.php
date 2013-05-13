<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;
use Think\Redirect as Redirect;

class DownloadController extends Controller
{
	public function index()
	{
		$this->parse_is_vip('novip', 0);

		$this->parse_is_vip('vip', 1);

		// 检查用户是否登录
		if(Session::get('com_auth_key'))
		{
			$this->assign('user_id', Session::get('com_auth_key'));

			$member = M('CompanyMember')->where(array('id' => Session::get('com_auth_key'), 'hidden' => 1))->find();
			
			if($member)
			{
				$this->assign('member', true);
			}
		}

		// 介绍信息
		$intro = M('Introduction')->find(6);
		$this->assign('intro', $intro);

		$this->display();
	}

	protected function parse_is_vip($var = 'novip', $is_vip = 0)
	{
		$model = M('Download');
		$condition['hidden'] = 1;
		$condition['is_vip'] = $is_vip;

		$varPage = $var;
		$page = $_GET[$varPage] ? $_GET[$varPage] : 1;
		$listRow = 3;

		$datas = $model->where($condition)->page($page, $listRow)->select();
		$this->assign($var . 's', $datas);

		$count = $model->where($condition)->count();
		$this->assign($var . 's_pager', $this->pager($count, $listRow, $varPage));
	}

	protected function pager($count, $listRow, $varPage)
	{
		$Pager = new \Think\Library\Pager();
		$Pager->varPage = $varPage;
		$Pager->rollPage = 3;
		return $Pager->output($count, $listRow);
	}

	public function noload()
	{
		Redirect::error('请先注册登录后，才可下载该内容');
	}

	public function noauth()
	{
		Redirect::error('您已注册，但您的账号未激活');
	}
}