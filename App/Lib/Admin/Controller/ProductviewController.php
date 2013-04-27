<?php

use Smartadmin\Controller\Content as Controller;
use Think\Response as Response;
use Think\Library\Upload\Upload as Upload;

class ProductviewController extends Controller
{
	protected $model_name = 'Product';

	protected $image_thumb_name = 'thumb';

	protected $cover_thumb_name = '215x100,470x350';

	protected $category_model = 'ProductDriver';

	protected $category_fk_name = 'product_driver_id';

	protected $category_query_name = 'aid';

	protected $category_id_auto_set = true;

	public function coverrequirement()
	{
		// 上传图片
		$info = Upload::image($_FILES['uploadify_file'], '680width');

		// 建立数据表
		$this->model->where(array('id' => $_POST['id']))->save(array('cover_requirement' => $info['name']));

		// 输出JSON
		Response::json($info);
	}
}