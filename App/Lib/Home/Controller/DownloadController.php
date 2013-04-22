<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;

class DownloadController extends Controller
{
	public function index()
	{
		$this->parse_is_vip('novip', 0);

		$this->parse_is_vip('vip', 1);

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
		return $Pager->output($count, $listRow);
	}
}