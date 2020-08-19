<?php
$active_tab = 'Cart';
require_once('header.php');
require_once('menu.php');
if(isset($_SESSION['cartitems']) && !empty($_SESSION['cartitems'])) {
    $p_ids = array_keys($_SESSION['cartitems']);
    $products = $QueryFire->getAllData('products','qty > 0 and id in ('.implode(',',$p_ids).')');
    $filters = $params = array();
    if(!empty($products)) {
    	$filters = array_values(array_unique(array_column($products, 'param_value_id')));
    	$params = $QueryFire->getAllData('','',"SELECT pv.*,php.name FROM product_params_values as pv LEFT JOIN product_has_params as php ON php.id=pv.param_id WHERE pv.id in (".implode(',', $filters).")");
    	$filters = array();
    	foreach($params as $param) {
    	  $filters[strtolower($param['name'])][]= $param;
    	}
    }
} else {
    $products = array();
}
if(isset($_POST['user_pincode']) && !empty($_POST['user_pincode']) && $_POST['user_pincode'] !== true ) {
    if(is_numeric($_POST['user_pincode'])) {
        $pin = $QueryFire->getAllData('pincodes',' is_show=1 and pincode="'.$_POST['user_pincode'].'"');
        if(!empty($pin)) {
            $_SESSION['user_pincode'] = $pin[0]['pincode'];
            $_SESSION['delivery_charge'] = $pin[0]['delivery_charge'];
            $msg='<h5 class="text-success">Items are deliverable on this '.$_POST['user_pincode'].' pincode.</h5>';
        } else {
            unset($_SESSION['user_pincode']);
            unset($_SESSION['delivery_charge']);
            $msg='<h5 class="text-danger">Items can not be delivered on '.$_POST['user_pincode'].'.</h5>';
        }
    } else{
        $msg='<h5 class="text-danger">Invalid pincode value</h5>';
    }
}
?>
<style>
    .product-quantity input {
        border: 1px solid #eceff8;
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
          <li>
            <span>My Cart</span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<div class="cart-main-area pt-40 pb-50">
  <div class="container">
  	<?php if(!empty($products)) {?> 
     <h3 class="page-title">Your cart items</h3>
     <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
          <div class="table-content table-responsive">
             <table>
                <thead>
                   <tr>
                      <th class="pro-title">Product</th>
                      <th class="pro-quantity">Quantity</th>
                   </tr>
                </thead>
                <tbody>
                	<?php $total=0;
                  foreach($products as $key=>$value){ ?>
	                   <tr>
	                      <td >
	                          <div class="row">
	                              <div class="col-md-3 col-5 col-sm-3" style="margin:auto;">
	                                  <a  href="<?= base_url.'product/'.$value['slug']?>"><img src="<?= base_url.'images/products/'.$value['image_name']?>" class="product-thumbnail img-responsive" alt="<?= $value['name']?>"></a>
	                              </div>
	                              <div class="col-md-9 col-7 col-sm-9 text-left" style="margin:auto;">
	                                  <div class="row mt-1 p-1">
	                                      <div class="col-md-12 col-xs-12 col-sm-12">
	                                        <a href="<?= base_url.'product/'.$value['slug']?>"><?= $value['name']?></a>
	                                        <?php if(!empty($filters)) { ?>
                                                <ul class="list-unstyled mb-0">
                                                    <?php foreach($filters as $key=> $filter) {
                                                        $pval = explode(',', $value['param_value_id']);
                                                        $is_present = false;
                                                        foreach($pval as $pv) {
                                                            if(in_array($pv, array_column($filter, 'id'))) {
                                                                $is_present = true;
                                                                break;
                                                            }
                                                        }
                                                        if($is_present === true) {
                                                            echo '<li><span>'.ucwords($key).':</span>';
                                                            foreach ($filter as $fil) {
                                                              if(in_array($fil['id'], $pval)) {
                                                                echo '<span class="filter-param" > '.$value['param_value'].' '.$fil['param_value'].'</span>';
                                                              }
                                                            }
                                                            echo "</li>";
                                                        }
                                                    } ?>
                                                </ul>
                                            <?php } ?>
	                                       </div>
	                                  </div>
	                                  <div class="row mt-1 p-1">
	                                      <div class="col-md-12 col-xs-12 col-sm-12">
	                                        1 X <span class="product-price-cart6"><span class="amount"><i class="fa fa-inr"></i><span class="money pro_price"><?= $value['price'] - ($value['price']*$value['discount']/100)?></span></span></span>
	                                       </div>
	                                  </div>
	                                  <div class="row mt-1 p-1">
	                                      <div class="col-md-12 col-xs-12 col-sm-12">
	                                        <a href="javascript:void(0);" class="action-remove" data-id="<?= $value['id']?>" >Remove</a>
	                                       </div>
	                                  </div>
	                              </div>
	                          </div>
	                      </td>
	                      <td class="product-quantity">
	                          <div class="">
                                   <div class="product-quantity-action quantity-selector cart-plus-minus"><div class="dec qtybutton">-</div>
                                      <input type="text" value="<?=$_SESSION['cartitems'][$value['id']]['quantity']?>" id="qty1" name="qty1" max="<?= $value['qty']>10?10:$value['qty']?>" data-max="<?= $value['qty']>10?10:$value['qty']?>" min="1" data-min="1" data-id="<?= $value['id']?>" class="input-qty">
                                   <div class="inc qtybutton">+</div></div>
                                </div>
                                <?php
                                 $ty= ($value['price']-($value['price']*$value['discount']/100))*$_SESSION['cartitems'][$value['id']]['quantity'];
                                $total += $ty;?>
                                <input type="hidden" class="totalonly" value="<?=$ty?>">
                          </td>
	                   </tr>
	               <?php } ?>
                </tbody>
                <tfoot>
                  <tr>
                    <th class="text-right">Grand Total</th>
                    <th class="text-left">
                      <i class="fa fa-inr"></i> <span id="total_price"><?= $total?></span>
                    </th>
                  </tr>
                </tfoot>
             </table>
          </div>
          <div class="row">
             <div class="col-lg-12">
                <div class="cart-shiping-update-wrapper">
                   <div class="cart-shiping-update mt-2">
                      <a class="theme-default-button" href="<?= base_url?>products">Continue Shopping</a>
                   </div>
                   <div class="col-12 col-md-6 col-sm-6 col-lg-6 col-xl-6">
                        <?= isset($msg)?$msg:(isset($_SESSION['user_pincode'])?'Items are deliverable on below pincode':'Check availability of items on your pincode')?>
                        <form action="" class="validatepin" method="post">
                            <div class="input-group mb-3">
                              <input type="text" class="form-control user_pincode" style="height:37px;" required placeholder="Pincode" value="<?= isset($_SESSION['user_pincode'])?$_SESSION['user_pincode']:''?>" aria-label="user_pincode" name="user_pincode" aria-describedby="button-addon2">
                              <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Check</button>
                              </div>
                            </div>
                        </form>
                    </div>
                    <?php if(isset($_SESSION['user_pincode'])) { ?>
                       <div class="cart-clear  mt-2">
                          <a href="<?= base_url?>place-order">Proceed to Checkout</a>
                       </div>
                    <?php } ?>
                </div>
             </div>
          </div>
        </div>
     </div>
 	<?php } else { ?>
 		<div class="row">
 		   <div class="col-lg-12 col-12">
 		      <div class="empty-cart-page">
 		         <h2>Shopping Cart</h2>
 		         <h3>Your cart is currently empty.</h3>
 		         <p>Continue shopping <a href="<?= base_url?>products">here</a></p>
 		      </div>
 		   </div>
 		</div>
 	<?php } ?>
  </div>
</div>
<?php require_once 'footer.php';?>
<script type="text/javascript">
    $(function(){
        /*$('.qtybutton').click(function(event){
            event.preventDefault();
            if($('.input-qty').data('max')<$('.input-qty').val() && $('.input-qty').data('min')>$('.input-qty').val()) {
                $('.input-qty').val($('.input-qty').data('max')).focus().trigger('change');
                $('#modalAddToCartError .error_message').html('Quantity can not be more than '+$('.input-qty').data('max'));
                $('.input-qty').val($('.input-qty').data('max'));
                $('#modalAddToCartError').modal('show');
            } else {
              $('.input-qty').trigger('change');
            }
        });*/
        $('.qtybutton').click(function(event){
        event.preventDefault();
        var This = $(this).parent(".product-quantity-action").find('.input-qty');
        if($(This).data('max') >= $(This).val() && $(This).val()> 0 ) {
            $(This).trigger('change');
            var id = $(This).data('id');
            var quantity = $(This).val();
            var url = '<?=base_url?>addtocart';
            $.ajax({
                url:url,
                data:{id:id,action:'quantity',quantity:quantity},
                type:'post',
                success:function(result){
                  var s =$.parseJSON(result);
                  $('.bigcounter').html(s.count);
                },
                error:function(error){
                  console.log('Error occured');
                }
            });
        } else {
            $('#modalAddToCartError .error_message').html('Quantity can not be more than '+$(This).data('max'));
            $('.input-qty').val($(This).data('max'));
            $('#modalAddToCartError').modal('show');
            return 0;
        }
    });
        $('.user_pincode').on('enter',function(event){
            event.preventDefault();
            if($(this).val().length == 6 ) {
                $('.validatepin').submit();
            }
        });
    });
</script>