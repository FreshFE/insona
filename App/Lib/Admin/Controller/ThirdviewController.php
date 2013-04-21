<?php

use Smartadmin\Controller\Content as Controller;

class ThirdviewController extends Controller
{
	protected $model_name = 'Third';

	protected $image_thumb_name = 'thumb';

	protected $cover_thumb_name = '208x193';

	protected $category_model = 'ThirdCategory';

	protected $category_fk_name = 'third_category_id';

	protected $category_query_name = 'aid';

	protected $category_id_auto_set = true;
}