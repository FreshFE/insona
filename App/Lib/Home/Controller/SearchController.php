<?php

use Think\Controller as Controller;
use Think\Config as Config;

class SearchController extends Controller
{
	public function index()
	{
		Config::set('TOKEN_ON', false);

		$keyword = $_GET['q'];

		$condition['title'] = array("like", array('%'.$keyword.'%'));
		$condition['content'] = array("like", array('%'.$keyword.'%'));
		$condition['_logic'] = 'or';

		// 产品
		$product = M('Product')->where($condition)->select();
		$driver = M('Driver')->where($condition)->select();
		$third = M('Third')->where($condition)->select();

		// 输出
		$this->assign('product',$product);
		$this->assign('driver',$driver);
		$this->assign('third',$third);

		// 检查是否没有搜索结果
		if(is_null($product) && is_null($driver) && is_null($third))
		{
			$this->assign('data_empty', 1);
		}

		$this->display();
	}
}