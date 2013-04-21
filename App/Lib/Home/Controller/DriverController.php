<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;

class DriverController extends Controller
{
	public function index()
	{
		$model = M('DriverCategory');
		$condition['hidden'] = 1;
		$page = $_GET['page'] ? $_GET['page'] : 1;
		$listRow = 3;

		$datas = $model->where($condition)->page($page, $listRow)->select();
		foreach ($datas as $key => &$data) {
			$data['views'] = M('Driver')->where(array('driver_category_id' => $data['id']))->select();
		}
		$this->assign('datas', $datas);

		$pager = $model->where($condition)->pager($page, $listRow);
		$this->assign('pager', $pager);

		$this->display();
	}
}