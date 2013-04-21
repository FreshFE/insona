<?php

use Smartadmin\Controller\Content as Controller;

class ProductviewController extends Controller
{
	protected $model_name = 'Product';

	protected $image_thumb_name = 'thumb';

	protected $cover_thumb_name = '215x100';

	protected $category_model = 'ProductDriver';

	protected $category_fk_name = 'product_driver_id';

	protected $category_query_name = 'aid';

	protected $category_id_auto_set = true;

	protected $category_id_require = true;
}