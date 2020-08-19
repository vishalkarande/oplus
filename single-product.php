<?php
$active_tab = 'Products';
require_once('header.php');
require_once('menu.php');
$related_products = $QueryFire->getAllData('products','is_deleted=0 and cat_id="'.$product['cat_id'].'" and id !='.$product['id'].' limit 10');
$product_images = $QueryFire->getAllData('products_has_images','product_id="'.$product['id'].'"');
if(isset($_POST['star'])) {
	if(isset($_SESSION['user'])) {
    $dummy = $QueryFire->getAllData('product_reviews','product_id="'.$product['id'].'" and user_id='.$_SESSION['user']['id']);
    if(empty($dummy)) {
      $_POST['product_id'] = $product['id'];
      $_POST['user_id'] = $_SESSION['user']['id'];
      if($QueryFire->insertData('product_reviews',$_POST)) {
        $success = 'Your review is under checking. Review will be shown after admin approval.';
      } else {
        $error = " Sorry! System is busy. Try after some time.";
      }
    } else {
      $error = "You have already given review to this product.";
    }
  } else {
    $error = "You must login first to review this product.";
  }
}
$product_reviews = $QueryFire->getAllData('','','SELECT u.*, r.review, r.star, r.heading FROM  product_reviews r JOIN users u ON u.id = r.user_id WHERE r.is_approved=1 and r.product_id='.$product['id']);
array_push($product_images, array('image_name'=>$product['image_name']));
//get products params
$params = $QueryFire->getAllData('','','SELECT pr.*,p.name FROM  product_params_values pr JOIN product_has_params p ON p.id = pr.param_id WHERE pr.is_deleted=0 and pr.id in ('.$product['param_value_id'].')');
?>
<div class="breadcrumb-area gray-bg">
  <div class="container">
    <div class="breadcrumb-content">      
      <nav class="" role="navigation" aria-label="breadcrumbs">
        <ul>
          <li>
            <a href="<?= base_url?>" title="Back to the home page">Home</a>
          </li>
          <li>
            <a href="<?= base_url?>products">Products</a>
          </li>
          <li>
            <span><?= ucfirst(strtolower($product['name']))?></span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<?= isset($success)?'<h3 class="text-center text-primary">'.$success.'</h3>': (isset($error)?'<h3 class="text-center text-warning">'.$error.'</h3>':'')?>
<style>
    .img-thumbnail, #ProductPhoto {
        border:1px solid rgb(242, 242, 242) !important;
    }
    .featured-image img{
        max-height:300px;
    }
</style>
<div class="product-details pt-30 pb-40">
  <div class="container">
     <div class="row">
        <div class="col-md-6 col-lg-6 col-md-12 col-12">
            
           <div class="product-details-img">
              <div class="row">
                <div class="col-md-12 col-lg-12 col-md-12 col-12">
                    <div class="featured-image">
                         <div class="" id="ProductPhoto"><img src="<?= base_url.'images/products/'.$product['image_name']?>" alt="<?= $product['name']?>" id="ProductPhotoImg">
                         </div>
                      </div>
                </div>
                <div class="col-md-12 col-lg-12 col-md-12 col-12">
                    <div id="ProductThumbs" class="product-dec-slider" >
                      	<?php foreach($product_images as $image) {?>
        		            <a class="product-single__thumbnail " href="<?= base_url.'images/products/'.$image['image_name']?>">
        		             	<img src="<?= base_url.'images/products/'.$image['image_name']?>" class="img-thumbnail" alt="">
        		            </a>
        		        <?php } ?>
                      </div>
                </div>
            </div>
              
              <?php if($product['discount']>0){ ?>
                <div class="onsale">
                  <span><?= $product['discount']?>%</span>
                </div>
              <?php } ?>
           </div>
        </div>
        <div class="col-md-6 col-lg-6 col-md-12 col-12">
           <form action="" method="post" enctype="multipart/form-data" id="add-item-form">
              <div class="product-details-content">
                 <h4><?= $product['name']?></h4>
                 <div class="product-ratting rating-review">
                    <div class="pro-dec-rating">
                    	<?php 
                    	$rating = count($product_reviews)>0?ceil(array_sum(array_column($product_reviews, 'star'))):0;
                    	for($i=1;$i<=5;$i++){
                    		echo '<span class="fa fa-star'.($rating>=$i?'':'-o').'"></span>';
                    	} ?>
                       <span class="spr-badge-caption"><?= count($product_reviews)>0?count($product_reviews):'No'?> reviews</span>
                       <a href="#" class="action add" data-toggle="modal" data-target="#myModal">
	                        <i class="fa fa-pencil-square-o"></i>write a review
	                    </a>
                    </div>
                 </div>
                 
                 <div class="row">
                     <div class="col-md-6 col-sm-6 col-6">
                        <div class="product-price">
                            <span id="ProductPrice"><span class=money><i class="fa fa-inr"></i> <?= $product['price'] - ($product['discount']*$product['price']/100)?></span></span>
                            <?php if($product['discount']>0){ ?><del><span id="ComparePrice"><span class=money><i class="fa fa-inr"></i> <?= $product['price']?></span></span></del><?php } ?>
                         </div>
                     </div>
                     <div class="col-md-6 col-sm-6 col-6">
                         <div class="pro-details-cart-wrap">
                            <div class="shop-list-cart-wishlist">
                               <div class="product-cart-action">
                                  <button type="button" data-id="<?= $product['id']?>" class="btn-cart action_cart_item" id="AddToCart">
                                  	<span class="cart-text" id="AddToCartText"><i class="ion-android-cart"></i></span>
                                  </button>
                               </div>
                               <div class="wishlist-action">
                                  <a data-id="<?= $product['id']?>" class="btn-wishlist wishlist" href="javascript:void(0);" title="Wishlist">
        	                         <span><i class="ion-ios-heart-outline"></i></span>
        	                       </a>
                               </div>
                            </div>
                            <div class="product-quantity">
                               <div class="product-quantity-action quantity-selector cart-plus-minus">
                                  <input type="text" value='<?= isset($_SESSION['cartitems'][$product['id']]['quantity'])?$_SESSION['cartitems'][$product['id']]['quantity']:"1"?>' id="qty1" name="qty1"  max="<?= $product['qty']?>" data-max="<?= $product['qty']?>"  min="1" data-id="<?= $product['id']?>" class="input-qty" name="quantity">
                               </div>
                            </div>
                         </div>
                     </div>
                 </div>
                 <?php if(!empty($product['param_value'])) {?>
                  <div class="pro-dec-categories">
                    <span class="categories-title"><?= ucfirst($params[0]['name'])?>: <?= $product['param_value']?></span>
                    <ul>
                     <li><a href="javascript:void(0)"><?= implode('</a></li><li><a href="javascript:void(0);">', array_column($params, 'param_value'));?></a></li>
                    </ul>
                  </div>
                <?php } else if(empty($product['param_value']) && !empty($params)) {?>
                   <div class="swatch clearfix Material" data-option-index="2">
                     <div class="header"><?= ucfirst($params[0]['name'])?> : </div>
                     <?php foreach($params as $param) { ?>
                       <div data-value="<?= ucfirst($param['param_value'])?>" class="swatch-element <?= $param['param_value'] ?> available">
                         <label for="swatch-2-cotton">
                           <?= ucfirst($param['param_value'])?>
                         </label>
                       </div>
                     <?php } ?>
                   </div>
                 <?php } ?>
                 <!-- Share -->
                 <div class="pro-dec-social">
                    <ul>
                       <li>
                          <a class="tweet" target="_blank" href="http://twitter.com/share?text=<?= $product['name']?>&url=<?= base_url.'product/'.$product['slug']?>" title="Share on Twitter" tabindex="0"><i class="ion-social-twitter"></i></a>
                       </li>
                       <li>
                          <a class="share" target="_blank" href="http://www.facebook.com/sharer.php?u=<?= base_url.'product/'.$product['slug']?>" title="Share on Facebook" tabindex="0"><i class="ion-social-facebook"></i></a>
                       </li>
                       <li>
                          <a class="google" target="_blank" href="http://plus.google.com/share?url=<?= base_url.'product/'.$product['slug']?>" title="Share on Google+" tabindex="0"><i class="ion-social-googleplus-outline"></i></a>
                       </li>
                       <li>
                          <a class="pinterest" target="_blank" href="http://pinterest.com/pin/create/button/?url=<?= base_url.'product/'.$product['slug']?>&amp;media=<?= base_url.'images/products/'.$product['image_name']?>&amp;description=<?= $product['name']?>" title="Share on Pinterest" tabindex="0"><i class="ion-social-pinterest"></i></a>
                       </li>
                       <li>
                          <a class="whatsapp" target="_blank" href="https://api.whatsapp.com/send?text=<?= base_url.'product/'.$product['slug']?>" title="Share on Whatsapp" tabindex="0">
                              <i class="fa fa-whatsapp" aria-hidden="true"></i> </a>
                       </li>
                    </ul>
                 </div>
              </div>
           </form>
        </div>
     </div>
  </div>
</div>
<div class="description-review-area pb-50">
  <div class="container">
     <div class="description-review-wrapper">
        <div class="description-review-topbar nav text-center" role=tablist>
           <a class="active" href="#pro-dec" data-toggle="tab" role="tab" aria-selected="true">
           Description
           </a>
           <a href="#pro-review" data-toggle="tab" role="tab" aria-selected="false">
           Reviews
           </a>
        </div>
        <div class="description-review-text tab-content description-review-bottom">
           <div class="tab-pane active" id="pro-dec" role="tabpanel">
              <?= html_entity_decode($product['details'])?>
           </div>
           <div class="tab-pane" id="pro-review" role="tabpanel">
              <?php
              if(!empty($product_reviews)) {
                foreach($product_reviews as $review){?>
                  <div class="row review_tab">
                      <div class="col-md-12 col-xs-12 col-sm-12">
                          <h5 class="text-primary revH"><?=$review['heading']?></h5>
                          <p class="text-justify">
                              <small> - <?= $review['name']?></small><br>
                              <?= $review['review']?>
                          </p>
                      </div>
                  </div>
              <?php } } else{ echo "No review";}?>
           </div>
        </div>
     </div>
  </div>
</div>
<?php if(!empty($related_products)) { ?>
	<div class="product-area pb-50">
	  <div class="container">
	     <div class="product-top-bar section-border mb-25">
	        <div class="section-title-wrap">
	           <h3 class="section-title section-bg-white">Related Product</h3>
	        </div>
	     </div>
	     <div class="related-product-active owl-carousel product-nav">
	     	<?php foreach($related_products as $rproduct) { ?>
		        <div class="product-wrapper">
		           <div class="product-img">
		              	<a href="<?= base_url.'product/'.$rproduct['slug']?>">
							<img src="<?= base_url.'images/products/'.$rproduct['image_name']?>" alt="Product Image" />
						</a>
		              <?php if($rproduct['discount']>0){ ?>
		                <div class="onsale">
		                  <span><?= $rproduct['discount']?>%</span>
		                </div>
		              <?php } ?>
		              <div class="product-action1">
		                 <div class="pro-action-left">
		                    <a data-id="<?= $rproduct['id']?>" class="btn-cart action_cart_item" href="javascript:void(0);">
	                           <i class="ion-android-cart"></i> 
	                        </a>
		                 </div>
		                 <div class="pro-action-right">
		                    <a data-id="<?= $rproduct['id']?>" class="btn-wishlist wishlist" href="javascript:void(0);" title="Wishlist">
		                     <span><i class="ion-ios-heart-outline"></i></span>
		                    </a>
		                    <a class="action-plus" target="_blank" title="Quick View" href="<?= base_url.'product/'.$rproduct['slug']?>">
		                     <i class="ion-android-open"></i>
		                    </a>
		                 </div>
		              </div>
		           </div>
		           <div class="product-content">
		              <h4>
		                <a href="<?= base_url.'product/'.$rproduct['slug']?>"><?= $rproduct['name']?></a>
		              </h4>
		              <div class="product-price-wrapper">
		                <span><span class=money><i class="fa fa-inr"></i> <?= $rproduct['price'] - ($rproduct['discount']*$rproduct['price']/100)?> </span></span>
                    <?php if($rproduct['discount']>0){ ?>
	                    <span class="product-price-old"><span class=money><i class="fa fa-inr"></i> <?= $rproduct['price']?></span></span>
                    <?php } ?>
		              </div>
		           </div>
		        </div>
		    <?php } ?>
	     </div>
	  </div>
	</div>
<?php } ?>
<!-- Review Modal -->
<div id="myModal" class="modal fade" role="dialog" style="margin-top: 3%;">
  <div class="modal-dialog">
    <form action="" method="post" class="reView" >
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Give Review to "<?= ucfirst(strtolower($product['name']))?>"</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
          	<?php if(isset($_SESSION['user'])) { ?>
		        <div class="form-group">
		            <label for="name">Heading For Review : </label>
		            <input type="text" name="heading" class="form-control" placeholder="Enter Heading For Review " />
		        </div>
		        <div class="form-group">
		            <label for="name">Review : </label>
		            <textarea name="review" class="form-control" placeholder="Enter Review"></textarea>
		        </div>
		        <div class="form-group">
		            <label for="name">Ratings : </label>
		            <i class="fa fa-star-o ratings" data-id="1"></i>
		            <i class="fa fa-star-o ratings" data-id="2"></i>
		            <i class="fa fa-star-o ratings" data-id="3"></i>
		            <i class="fa fa-star-o ratings" data-id="4"></i>
		            <i class="fa fa-star-o ratings" data-id="5"></i>
		            <input type="hidden" name="star" class="rat">
		        </div>
		    <?php } else {
		    	echo " <h5>To give review you must be logged in. To log in <a href='".base_url."login?url=".base_url."product/".$product['slug']."'>click here</a>.</h5>";
		    } ?>
          </div>
          <div class="modal-footer">
          	<?php if(isset($_SESSION['user'])) { ?>
            	<button type="button" class="btn btn-primary rv"> Review</button>
            <?php } ?>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
          </div>
        </div>
    </form>
  </div>
</div>
<?php require_once('footer.php');?>
<script type="text/javascript">
    $(function(){
        $('.qtybutton').click(function(event){
        	event.preventDefault();
            if($('.input-qty').data('max')<$('.input-qty').val()) {
                $('.input-qty').val($('.input-qty').data('max')).focus().trigger('change');
                $('#modalAddToCartError .error_message').html('Quantity can not be more than '+$('.input-qty').data('max'));
                $('.input-qty').val($('.input-qty').data('max'));
                $('#modalAddToCartError').modal('show');
            } else {
            	$('.input-qty').trigger('change');
            }
        });
        $('.ratings').mouseenter(function(){
            var count = $(this).data('id');
            $('.rat').val(count);
            $('.ratings').each(function(i,val){
                if(i<count)
                {
                    $(this).removeClass('fa-star-o').addClass('fa-star');
                }
                else
                {
                    $(this).removeClass('fa-star').addClass('fa-star-o');
                }
            });            
        });
        $('.rv').click(function(){
            if($('.ratings').hasClass('fa-star'))
                $(this).attr('type','submit');
            else
                alert('Give rating first to submit your review');
        });
    });
</script>