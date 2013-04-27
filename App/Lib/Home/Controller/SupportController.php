<?php

use Think\Controller as Controller;
use Think\Request as Request;
use Think\Debug as Debug;
use Think\Exception as Exception;
use Think\Redirect as Redirect;

class SupportController extends Controller
{
	public function _empty()
	{
		$method = (Request::is('post') ? 'post_' : 'get_') . ACTION_NAME;
		$this->$method();
	}

	public function get_index()
	{
		$datas = M('Product')->select();
		$this->assign('datas', $datas);

		// 联系信息
		$intro = M('Introduction')->find(7);
		$this->assign('intro', $intro);

		$this->display();
	}

	public function post_index()
	{
		try {
			$model = D('Support');

			if($data = $model->create())
			{
				$model->add($data);
				Redirect::success('提交成功，Thanks');
			}
			else {
				throw new Exception($model->getError());
			}
		}
		catch(Exception $error) {
			// Debug::output($error);
			Redirect::error($error->getMessage());
		}
	}
}