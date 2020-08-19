<?php
$active_tab = 'products';
require_once('header.php');
require_once('menu.php');
$slug = '';
$breadcrumb = array();
$where = " is_show=1 and is_deleted=0 and qty>0 ";
if(isset($_POST['search'])) {
    $where .= ' and ( name like "%'. trim($_POST['search']) .'%" OR details like "%'. trim($_POST['search']) .'%" ) ';
}
if(isset($_REQUEST['cslug2'])) {
  $cat_details = $allcategories[array_search($_REQUEST['cslug'], array_column($allcategories, 'slug'))];
  $level1cat = $allcategories[array_search($_REQUEST['cslug2'], array_column($allcategories, 'slug'))];
  $slug = $cat_details['slug'];
  $where .= ' and cat_id ='.$level1cat['id'];
  $breadcrumb[1] = array('url'=> base_url.'products','name'=>'products');
  $breadcrumb[2] = array('url'=> base_url.'category/'.$_REQUEST['cslug'],'name'=>$cat_details['name']);
  $breadcrumb[3] = array('url'=> base_url.'category/'.$_REQUEST['cslug'].'/'.$_REQUEST['cslug2'],'name'=>$level1cat['name']);
} else if(isset($_REQUEST['cslug'])) {
  $slug = $_REQUEST['cslug'];
  $cat_details = $categories[array_search($_REQUEST['cslug'], array_column($categories, 'slug'))];
  if(!empty($cat_details['subcategory'])) {
    $where .= ' and cat_id in ('.implode(',', array_column($cat_details['subcategory'], 'id')).')';
  } else {
    $where .= ' and cat_id='.$cat_details['id'];
  }
  $breadcrumb[1] = array('url'=> base_url.'category/'.$_REQUEST['cslug'],'name'=>$cat_details['name']);
} else {
  $breadcrumb[1] = array('url'=> base_url.'products','name'=>'Products');
}
$startPage = 1;
if(isset($_REQUEST['page'])) {
  $startPage = $_REQUEST['page'];
  $cwhere = $where;
  $where = $where.' order by id asc limit '.(($startPage-1)*10).',9 ';
} else {
  $cwhere = $where;
  $where = $where.' order by id asc limit '.($startPage-1).',9';
}
$products = $QueryFire->getAllData('products',$where);
$params = $QueryFire->getAllData('products','',"SELECT pv.*,php.name FROM product_params_values as pv LEFT JOIN product_has_params as php ON php.id=pv.param_id WHERE pv.is_deleted=0 and php.is_deleted=0");
$count = $QueryFire->getAllCount('products WHERE '.$cwhere);
$count = ceil($count/10);
?>
<style>
    .search {
        cursor:pointer;
    }
</style>
<div class="breadcrumb-area gray-bg">
  <div class="container">
    <div class="breadcrumb-content">      
      <nav class="" role="navigation" aria-label="breadcrumbs">
        <ul>
          <li>
            <a href="<?= base_url?>" title="Back to the home page">Home</a>
          </li>
          <?php
              $count1 = count($breadcrumb);
              for($i=1;$i<=$count1;$i++) {
                  if($i === $count1)
                      echo '<li class="active"><span>'.ucwords(strtolower($breadcrumb[$i]['name'])).'</span></li>';
                  else
                      echo '<li><a href="'.$breadcrumb[$i]['url'].'">'.ucwords(strtolower($breadcrumb[$i]['name'])).'</a></li>';
              } 
          ?>
        </ul>
      </nav>
    </div>
  </div>
</div>
<div class="shop-page-area mt-40 pb-50">
   <div class="container">
      <div class="row flex-row-reverse">
          <div class="col-lg-3 col-md-12 mb-10 hidden-xs">
            <div class="shop-sidebar-wrapper gray-bg-7 shop-sidebar-mrg">
               <div class="shop-widget">
                  <h4 class="shop-sidebar-title">Categories</h4>
                  <div class="shop-catigory">
                     <ul id="faq">
                      <?php if(!empty($categories)) {
                        foreach($categories as $cat) {
                          if(empty($cat['subcategory'])) { ?>
                            <li <?= $cat['slug']==$slug?'class="active"':''?> ><a href="<?= base_url.'category/'.$cat['slug']?>"><?= $cat['name']?></a></li>
                          <?php } else { ?>
                            <li <?= $cat['slug']==$slug?'class="active"':''?> >
                               <a data-toggle="collapse" data-parent="#faq" href="#dev-<?= $cat['id']?>">
                                <?= $cat['name']?><i class="ion-ios-arrow-down"></i></a> 
                               <ul id="dev-<?= $cat['id']?>" class="panel-collapse collapse <?= $cat['slug']==$slug?'show':''?>">
                                <?php foreach($cat['subcategory'] as $sub) { ?>
                                  <li><a href="<?= base_url.'category/'.$cat['slug'].'/'.$sub['slug']?>"><?= $sub['name']?> </a></li>
                                <?php } ?>
                               </ul>
                            </li>
                          <?php }
                        } } ?>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-lg-9 col-12">
            <div class="banner-area pb-30">
                <form action="" name="search_product" method="post">
                    <div class="input-group">
                        <input type='text' required class="form-control search_input" name="search" minlength='3' placeholder="Search for products" value="<?= isset($_POST['search'])?$_POST['search']:'' ?>" />
                        <span class="input-group-addon search"><i class="fa fa-search"></i></span>
                    </div>
                </form>
            </div>
          <?php if(!empty($products)) { ?>
            <div class="row">
              <?php foreach($products as $product) { ?>
                <div class="product-width col-xl-4 col-lg-4 col-md-4 col-sm-6 col-4  mb-30">
                   <div class="product-wrapper">
                      <div class="product-img">
                          <a href="<?= base_url.'product/'.$product['slug']?>">
                            <img src="<?= base_url.'images/products/'.$product['image_name']?>" alt="Product Image" />
                          </a>
                          <!--<?php if($product['discount']>0){ ?>
                            <div class="onsale">
                              <span><?= $product['discount']?>%</span>
                            </div>
                          <?php } ?>-->
                         <div class="product-action1">
                            <div class="pro-action-right text-center">
                                <a data-id="<?= $product['id']?>" class="btn-cart action_cart_item" href="javascript:void(0);">
                               <i class="ion-android-cart"></i> 
                              </a>
                              <a data-id="<?= $product['id']?>" class="btn-wishlist wishlist" href="javascript:void(0);" title="Wishlist">
                               <span><i class="ion-ios-heart-outline"></i></span>
                              </a>
                              <a class="action-plus" target="_blank" title="Quick View" href="<?= base_url.'product/'.$product['slug']?>">
                               <i class="ion-android-open"></i>
                              </a>
                            </div>
                         </div>
                      </div>
                      <div class="product-content">
                         <h4>
                            <a href="<?= base_url.'product/'.$product['slug']?>"><?= $product['name']?></a>
                         </h4>
                         <div class="product-price-wrapper">
                            <span><span class=money><i class="fa fa-inr"></i> <?= $product['price'] - ($product['discount']*$product['price']/100)?> </span></span>
                            <?php if($product['discount']>0){ ?>
                              <span class="product-price-old"><span class=money><i class="fa fa-inr"></i> <?= $product['price']?></span></span>
                            <?php } ?>
                         </div>
                         <div>
                           <?php if(!empty($product['param_value'])) {
                               echo '<span>'.$product['param_value'].' '. ( $params[array_search($product['param_value_id'],array_column($params,'id'))]['param_value'] ) .'</span>';
                           } else {
                               $param = explode(',',$product['param_value_id']);
                               $rec = array();
                               foreach($param as $par) {
                                   $key = array_search($par,array_column($params,'id'));
                                   $rec[$params[$key]['param_id']][] = array('name'=>$params[$key]['name'],'value'=>$params[$key]['param_value']);
                               }
                               foreach($rec as $re) {
                                   echo '<span>'.$re[0]['name'].': '.implode(' ',array_column($re,'value')).'</span>';
                               }
                               unset($rec);
                               unset($param);
                           } ?>
                        </div>
                      </div>
                   </div>
                </div>
              <?php } ?>
            </div>
          <?php if($count>1) {?>
            <div class="row">
                <div class="col-md-12 col-xs-12 col-12 col-lg-12">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination justify-content-end">
                        <?php for( $i=1; $i<= $count; $i++) { ?>
                            <li class="page-item <?= $startPage==$i?'active':''?>" >
                                <a class="page-link" href="<?= $breadcrumb[$count1]['url'].'/page/'.$i ?>"><?= $i?></a>
                            </li>
                        <?php } ?>
                      </ul>
                    </nav>
                </div>
            </div>
          <?php } } else { ?>
            <h4 class="error text-danger"> Sorry, No products available</h4>
          <?php } ?>
         </div>
      </div>
   </div>
</div>
<?php require_once('footer.php');?>
<script>
    jQuery('.search').on('click',function() {
        if(jQuery('.search_input').val().length > 2)
            document.search_product.submit();
        jQuery('.search_input').focus();
    })
</script>
