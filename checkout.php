<?php
$active_tab = 'Checkout';
require_once('header.php');
require_once('menu.php');
if(isset($_SESSION['cartitems']) && !empty($_SESSION['cartitems'])) {
  $p_ids = array_keys($_SESSION['cartitems']);
  $products = $QueryFire->getAllData('products','qty > 0 and id in ('.implode(',',$p_ids).')');
}
if(!isset($products) || empty($products)) {
  echo "<script> window.location.href='".base_url."products';</script>";
}
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
            <a href="<?= base_url?>cart" >Cart</a>
          </li>
          <li>
            <span>Check Out</span>
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
          <div class="">
             <table class="table table-bordered table-hover">
                <thead>
                   <tr>
                      <th class="pro-title">Product</th>
                      <th class="pro-price">Price</th>
                      <th class="pro-quantity">Quantity</th>
                      <th class="pro-subtotal" width="120">Total</th>
                   </tr>
                </thead>
                <tbody>
                	<?php $total=0;
                  foreach($products as $key=>$value){ ?>
	                   <tr>
	                      <td class="product-name">                  
	                         <a href="<?= base_url.'product/'.$value['slug']?>"><?= $value['name']?></a>
	                      </td>
	                      <td class="product-price-cart"><span class="amount"><i class="fa fa-inr"></i><span class="money pro_price"><?= $value['price'] - ($value['price']*$value['discount']/100)?></span></span></td>
	                      <td class="product-quantity">
	                         <?=$_SESSION['cartitems'][$value['id']]['quantity']?>
	                      </td>
	                      <td class="product-subtotal">
                          <span class="money"><i class="fa fa-inr"></i> 
                            <?php
                              echo $ty= ($value['price']-($value['price']*$value['discount']/100))*$_SESSION['cartitems'][$value['id']]['quantity'];
                              $total += $ty;?>
                          </span>
                        </td>
	                   </tr>
	               <?php } ?>
                </tbody>
                <tfoot>
                  <tr>
                    <th class="text-right" colspan="3">Grand Total</th>
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
                   <div class="cart-shiping-update">
                      <a class="theme-default-button" href="<?= base_url?>products">Continue Shopping</a>
                   </div>
                   <div class="cart-clear">
                      <a href="<?= base_url?>place-order">Place My Order</a>
                   </div>
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