<?php 
session_start();
require_once('admin/query.php');
$loggedPages = array('my account','place order','prime');
if(in_array(strtolower($active_tab), $loggedPages) && !isset($_SESSION['user'])) {
  $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
  header('Location:'.base_url.'login?url='.urlencode($actual_link));
}
$categories = $QueryFire->getAllData('categories',' is_show=1 and is_deleted=0 order by reference');
$allcategories = $categories;
if(!empty($categories)) {
  $cat = array_filter($categories,function($a) {
    return $a['level'] ==1;
  });
  foreach($cat as $key=> $maincat) {
    $cat[$key]['subcategory'] = array_filter($categories,function($a) use ($maincat) {
      return ($a['level'] == 2 && $a['parent_id'] == $maincat['id']);
    });
  }
  $categories = array_values($cat);
  unset($cat);
}
if(isset($_REQUEST['slug'])) {
  $product = $QueryFire->getAllData('products',' slug="'.$_REQUEST['slug'].'"');
  $product = $product[0];
  $seo = array();
  $seo['title'] = empty($product['meta_title'])?$product['name']:$product['meta_title'];;
  $seo['description'] = $product['meta_description'];
} else {
  $seo = $QueryFire->getAllData('seo',' page_name = "'.strtolower($active_tab).'"');
  if(!empty($seo)) {
    $seo = $seo[0];
  }
}
?>
<!DOCTYPE html>
<!--[if IE 9]> <html class="ie9 no-js supports-no-cookies" lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html class="no-js supports-no-cookies" lang="en"> <!--<![endif]-->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta name="theme-color" content="#00a215">
  <meta name="description" content="<?= !empty($seo['description'])? $seo['description'] :''?>">
  <?php if(isset($_REQUEST['slug'])) { ?>
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@Oplus">
    <meta name="twitter:title" content="<?= !empty($seo['title'])? $seo['title'] :((isset($active_tab)?ucwords($active_tab):'Home').' | Oplus')?>">
    <meta name="twitter:description" content="<?= !empty($seo['description'])? $seo['description'] :''?>">
    <meta name="twitter:creator" content="@OPlus.co.in">
    <meta name="twitter:image" content="<?= base_url.'images/products/'.$product['image_name']?>">
    <meta name="twitter:domain" content="<?= base_url?>">
    <meta property="og:title" content="<?= $product['title']?>"/>
<meta property="og:type" content="product"/>
<meta property="og:url" content="<?= base_url.'product/'.$product['slug']?>"/>
<meta property="og:image" content="<?= base_url.'images/products/'.$product['image_name']?>"/>
<meta property="og:site_name" content="Oplus"/>
<meta property="fb:admins" content="USER_ID"/>
<meta property="og:description"
      content="<?= !empty($seo['description'])? $seo['description'] :''?>"/>
  <?php } ?>
  <title><?= !empty($seo['title'])? $seo['title'] :((isset($active_tab)?ucwords($active_tab):'Home').' | Oplus')?></title>

  <!-- Site Icons -->
  <link rel="shortcut icon" href="<?= base_url?>images/favicon.ico" type="image/icon">
  <link rel="apple-touch-icon" href="<?= base_url?>images/favicon.ico">

  <!-- CSS -->
  <link href="<?= base_url?>css/timber.scss7e75.css?v=1921998572322491167" rel="stylesheet" type="text/css" media="all" />

  <link href="<?= base_url?>css/theme-default7df0.css?v=5449263524995795159" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/bootstrap.minc79f.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/animate2117.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/owl.carousel.min22a5.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/slick6c6a.css" rel="stylesheet" type="text/css" media="all" />
  <!-- <link href="<?= base_url?>css/chosen.minfb6a.css" rel="stylesheet" type="text/css" media="all" /> -->
  <link href="<?= base_url?>css/font-awesome.mina741.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/simple-line-icons4c0d.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/ionicons.minb771.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/meanmenu.min6fa0.css" rel="stylesheet" type="text/css" media="all" />

  <link href="<?= base_url?>css/stylee112.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/responsivec6a0.css" rel="stylesheet" type="text/css" media="all" />

  <link href="<?= base_url?>css/custom2c58.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/theme-responsive1a37.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/skin-theme4339.css" rel="stylesheet" type="text/css" media="all" />
  <link href="<?= base_url?>css/theme-colorfe66.css" rel="stylesheet" type="text/css" media="all" />
	
	
	
	
	
	
  <link rel="stylesheet" media="screen" href="<?= base_url?>css/custom.css">
  <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-173529049-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
    
      gtag('config', 'UA-173529049-1');
    </script>

</head>
<body>
    <!-- LOADER -->
    <div id="background">
        <div class="loading">
            <?php if(isset($active_tab) && strtolower($active_tab)=='home') { ?>
                <img src="<?= base_url?>images/loader.gif" />
            <?php } else { ?>
                <h3>Loading...</h3>
                <div class="loader10"></div>
            <?php } ?>
        </div>
    </div>
