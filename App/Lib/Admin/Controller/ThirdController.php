<?php

use Smartadmin\Controller\Content as Controller;
use Think\Library\Upload\Upload as Upload;
use Think\Response as Response;

class ThirdController extends Controller
{
	protected $model_name = 'ThirdCategory';

	protected $image_thumb_name = 'thumb';

	protected $cover_thumb_name = '166x60';

	protected $category_id = 3;

	public function coverlogo()
	{
		// 上传图片
		$info = Upload::image($_FILES['uploadify_file'], '250x44');

		// 建立数据表
		$this->model->where(array('id' => $_POST['id']))->save(array('cover_logo' => $info['name']));

		// 输出JSON
		Response::json($info);
	}
}