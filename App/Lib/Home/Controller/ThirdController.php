<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Auth as Auth;
use Think\Session as Session;

class ThirdController extends Controller
{
	public function index()
	{
		$model = M('ThirdCategory');
		$condition['hidden'] = 1;
		$page = $_GET['page'] ? $_GET['page'] : 1;
		$listRow = 3;

		$datas = $model->where($condition)->page($page, $listRow)->select();
		$this->assign('datas', $datas);

		$pager = $model->where($condition)->pager($page, $listRow);
		$this->assign('pager', $pager);

		$this->display();
	}

	public function view()
	{
		if(isset($_GET['aid']))
		{
			$condition['third_category_id'] = $_GET['aid'];
		}
		else {
			echo '没有输入aid, 404!';
			exit();
		}

		$model = M('Third');
		$condition['hidden'] = 1;
		$page = $_GET['page'] ? $_GET['page'] : 1;
		$listRow = 4;


		$datas = $model->where($condition)->page($page, $listRow)->select();
		$this->assign('datas', $datas);

		$pager = $model->where($condition)->pager($page, $listRow);
		$this->assign('pager', $pager);

		$father = M('ThirdCategory')->find($condition['third_category_id']);;
		$this->assign('father', $father);

		$this->display();
	}
}