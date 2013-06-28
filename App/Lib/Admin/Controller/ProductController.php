<?php

use Smartadmin\Controller\Content as Controller;
use Think\Library\Upload\Upload as Upload;
use Think\Response as Response;

class ProductController extends Controller
{
	protected $model_name = 'ProductCategory';

	protected $image_thumb_name = 'thumb';

	protected $cover_thumb_name = '392x422';

	protected $category_id = 1;

	public function coverlogo()
	{
		// 上传图片
		$info = Upload::image($_FILES['uploadify_file'], '121x38');

		// 建立数据表
		$this->model->where(array('id' => $_POST['id']))->save(array('cover_logo' => $info['name']));

		// 输出JSON
		Response::json($info);
	}
}