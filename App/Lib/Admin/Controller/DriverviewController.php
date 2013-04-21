<?php

use Smartadmin\Controller\Content as Controller;

class DriverviewController extends Controller
{
	protected $model_name = 'Driver';

	// protected $image_thumb_name = 'thumb';

	// protected $cover_thumb_name = '215x100';

	protected $category_model = 'DriverCategory';

	protected $category_fk_name = 'driver_category_id';

	protected $category_query_name = 'aid';

	protected $category_id_auto_set = true;
}