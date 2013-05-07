<?php

use Smartadmin\Controller\Content as Controller;
use Think\Redirect as Redirect;

class BannerController extends Controller
{
	protected $model_name = 'Banner';

	protected $cover_thumb_name = '1680x445';

	protected $category_id = 5;

	/**
	 * Update model hidden
	 * 编辑model的hidden字段
	 *
	 * @return void
	 */
	public function enable()
	{
		if($this->pk_id) {

			$this->model->find($this->pk_id);

			if($this->model->hidden == 0)
			{
				$count = $this->model->where(array('hidden' => 1))->count();
				if($count >= 4)
				{
					Redirect::success('仅能公开4张图片');
				}
			}

			$this->model->hidden = !$this->model->hidden;
			$this->model->save();

			Redirect::success('状态发布成功');
		}
	}
}