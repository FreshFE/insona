<?php

use Think\Controller as Controller;
use Think\Config as Config;

class SearchController extends Controller
{
	public function index()
	{
		Config::set('TOKEN_ON', false);

		$keyword = $_GET['q'];

		$page = $_GET['page'] ? $_GET['page'] : 1;
		$listRow = 5;

		$condition['title'] = array("like", array('%'.$keyword.'%'));
		$condition['content'] = array("like", array('%'.$keyword.'%'));
		$condition['_logic'] = 'or';

		// 产品
		$product = M('Product')->where($condition)->page($page, $listRow)->select();
		// $driver = M('Driver')->where($condition)->select();
		// $third = M('Third')->where($condition)->select();

		// 输出
		$this->assign('product',$product);
		// $this->assign('driver',$driver);
		// $this->assign('third',$third);

		$pager = M('Product')->where($condition)->pager($page, $listRow);
		$this->assign('pager', $pager);

		// 检查是否没有搜索结果
		if(is_null($product) /*&& is_null($driver) && is_null($third)*/)
		{
			$this->assign('data_empty', 1);
		}

		$this->display();
	}
}