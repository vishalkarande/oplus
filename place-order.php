<?php
$active_tab = 'place order';
require_once('header.php');
require_once('menu.php');
if(!isset($_SESSION['user_pincode'])) { 
    echo "<script>alert('Items are not deliver on current pincode. Please change your location.');window.location.href='".base_url."cart';</script>";
}   
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
}
if(!isset($products) || empty($products)) {
  echo "<script> window.location.href='".base_url."products';</script>";
}
//edit address
if(isset($_POST['Edit'])) {
    unset($_POST['Edit']);
    if($QueryFire->upDateTable('user_addresses','id='.$_POST['id'],$_POST))
    {
        $success = 'Address changed successfully.';
    }
    else
    {
        $error = " Unable to change address at this moment.";
    }
}
if(isset($_POST['coupon_code']) && !empty($_POST['coupon_code']) && $_POST['coupon_code'] !== true ) {
    $pin = $QueryFire->getAllData('coupons',' is_active=1 and is_deleted=0 and code="'.$_POST['coupon_code'].'"');
    if(!empty($pin)) {
        $_SESSION['coupon_code'] = $pin[0]['discount'];
        $msg='<h5 class="text-success">Coupon applied successfully.</h5>';
    } else {
        unset($_SESSION['coupon_code']);
        $msg='<h5 class="text-danger">Invalid coupon</h5>';
    }
}
//get user's different address for shipping
$addresses = $QueryFire->getAllData('user_addresses', ' is_deleted=0 and user_id='.$_SESSION['user']['id']);
//now check the user field data and redirect it to thanks page
if(isset($_POST['pay'])) {
    $valid = true;
    // address id if is 0 then it means address is home address
    if($_POST['ship_add']==0) {
        $address = $_SESSION['user']['address'];
        if($_SESSION['user_pincode'] != $_SESSION['user']['pincode'])
            $valid = false;
    } else {
        $ad = $addresses[array_search($cat['address_id'], array_column($addresses, 'id'))];
        $address = $ad['name'].', <br>'.$ad['mobile_no'].', <br>'.$ad['address'].', '.$ad['street'].',<br>'.$ad['city'].' - '.$ad['pincode'].',<br>'.$ad['state'].', India';
        if($_SESSION['user_pincode'] != $ad['pincode'])
            $valid = false;
    }
    if($valid) {
        $cat = array();
        $cat['address_id'] = $_POST['ship_add'];
        $cat['delivery_charge'] = $_POST['delivery_charge'];
        $cat['delivery_date'] = '';
        $cat['status'] = 'in-process';
        $cat['user_id'] = $_SESSION['user']['id'];
        $prrr = "<table class='order_stat'><tr> <td colspan='7' style='
    text-align: center;'> <h3> Item Details </h3></td></tr><tr><th> Image</th><th>Item Code</th><th>Item Name</th><th>Price</th><th>Quantity</th><th>Discount</th><th>Sub Total</th></tr>";
        $cat['discount'] = 0;
        $scpnd = 0;
        if(isset($_SESSION['coupon_code'])) {
            $cat['discount'] = $_SESSION['coupon_code'];
            unset($_SESSION['coupon_code']);
        }
        $QueryFire->insertData('orders',$cat);
        $cat = array();
        $cat['order_id'] = $QueryFire->getLastInsertId();
        foreach($products as $key=>$value) {
            $cat['qty'] = $_SESSION['cartitems'][$value['id']]['quantity'];
            $cat['discount'] = $value['discount'];
            $cat['product_id'] = $value['id'];
            $cat['price'] = $value['price'];
            $itemFilters = '';
            if(!empty($filters)) {
                $itemFilters = '<ul class="list-unstyled mb-0" style="padding:0;">';
                foreach($filters as $key=> $filter) {
                    $pval = explode(',', $value['param_value_id']);
                    $is_present = false;
                    foreach($pval as $pv) {
                        if(in_array($pv, array_column($filter, 'id'))) {
                            $is_present = true;
                            break;
                        }
                    }
                    if($is_present === true) {
                        $itemFilters .= '<li style="margin-left:0;list-style-type:none;"><span>'.ucwords($key).':</span>';
                        foreach ($filter as $fil) {
                          if(in_array($fil['id'], $pval)) {
                            $itemFilters .= '<span class="filter-param" > '.$value['param_value'].' '.$fil['param_value'].'</span>';
                          }
                        }
                        $itemFilters .= "</li>";
                    }
                }
                $itemFilters .='</ul>';
            }
            //now insert into table
            $QueryFire->insertData('order_has_products',$cat);
            //after inserting update the quantity of item
            $QueryFire->upDateTable('products','id='.$value['id'],array('qty'=> ($value['qty']-$cat['qty'])));
            $total+=($value['price']*$_SESSION['cartitems'][$value['id']]['quantity']);
            $prrr .='<tr>
                        <td>
                            <a href="'.base_url.'product/'.$value['slug'].'" target="_blank" >
                                <img src="'.base_url.'images/products/'.$value['image_name'].'" alt="'.ucwords($value['name']).'" title="'.ucwords($value['name']).'" width="110" heigh="90" class="img-thumbnail" >
                            </a>
                        </td>
                        <td>'.$value['id'].'</td>
                        <td>'.ucwords($value['name']).$itemFilters.'</td>
                        <td>RS '.$value['price'].'</td>
                        <td>'.$_SESSION['cartitems'][$value['id']]['quantity'].'</td>
                        <td>'.$value['discount'].'</td>
                        <td>RS '.($_SESSION['cartitems'][$value['id']]['quantity']*$value['price']).'</td>
                    </tr>';
        }
        $prrr .="
                <tr>
                    <th colspan='6' style='text-align:right;'>Delivery Charge :</th>
                    <td><b>RS ".$_POST['delivery_charge']."</b></td>
                </tr>
                <tr>
                    <th colspan='6' style='text-align:right;'>Coupon Discount :</th>
                    <td><b>RS ".$_POST['discount_amount']."</b></td>
                </tr>
                <tr>
                    <th colspan='6' style='text-align:right;'>Grand Total :</th>
                    <td><b>RS ".$_POST['amount']."</b></td>
                </tr>
            </table>";
        unset($_SESSION['cartitems']);
        //send mail to both user and admin
        $to = "info@granostore.com";
        $subject = ' New Order Request FROM '.$_SESSION['user']['name'];
        $htmlContent ="
        <html>
            <head>
                <title>Order Details</title>
                <style>
                    tr,td,th{
                        border:1px solid gray;
                        padding:10px;
                    }
                    th{
                        text-align:right;
                    }
                    td{
                        text-align:center;
                    }
                </style>
            </head>
            <body>
                <div width='100%' style='text-align:center;'>
                    <img src='".base_url."images/logo.png' style='margin:auto;text-align:center;margin-bottom:5px;' /> 
                </div>
                <h3> Order Details </h3>
                <p>Shipping Details:<br>
                    <address>".$address."</address>
                </p>
                    ".$prrr."
            </body>
        </html>";
        // Set content-type header for sending HTML email
        $headers= "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
        // Additional headers
        $headers .= 'From: '.$_SESSION['user']['name'].'<'.trim($_SESSION['user']['email']).'>' . "\r\n";
        $headers .= 'Bcc: lathe.nilesh@gmail.com' . "\r\n";
        mail($to,$subject,$htmlContent ,$headers);
        //auto responder
        $to = $_SESSION['user']['email'];
        $subject = 'Order Details';
        // Set content-type header for sending HTML email
        $headers= "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
        // Additional headers
        $headers .= 'From: Customer Support <info@granostore.com>' . "\r\n";
        //send invoice through mail
        //add payment link to it
        //$prrr .= '<p style="margin-top:20px;font-size:16px;">If you have not paid amount then <a href="'.base_url.'razorpay/pay/'.$cat['order_id'].'">click here</a> to pay.</p>';
        $template = file_get_contents('invoice.php');
        $template = str_replace('%username%', $_SESSION['user']['name'], $template);
        $template = str_replace('%data%', $prrr, $template);
        $template = str_replace('%shippingaddr%', $address, $template);
        mail($to,$subject,$template ,$headers);
        //now send this to thanks page
        echo "<script> alert('Order placed successfully');window.location.href='".base_url."';</script>";
        //echo "<script> window.location.href='".base_url.'razorpay/pay/'.$cat['order_id']."';</script>";
        exit;
    } else {
        $error = 'Please select deliverable address';
    }
}
$place_option = '';
if($_SESSION['user_pincode']==$_SESSION['user']['pincode']){
    $place_option = 'found';
} else if(!empty($addresses)) {
    $key = array_search($_SESSION['user_pincode'],array_column($addresses,'pincode'));
    if($addresses[$key]['pincode'] == $_SESSION['user_pincode']) {
        $place_option = 'found';
    }
}
?>
<style>
    input[type=radio] {
        height:12px;
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
            <span>Place Order</span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<div class="cart-main-area pt-40 pb-50">
  <div class="container">
    <?= isset($success)?'<h4 class="text-center text-primary">'.$success.'</h4>':(isset($error)?'<h4 class="text-center text-danger">'.$error.'</h4>':'')?>
  	<?php if(!empty($products)) {?> 
     <form action="" class="form-cart" method="post">
      <div class="form-group">
          <label>Choose Shipping Address:</label>
      </div>
      <div class="row">
          <div class="col-md-4">
              <div class="form-group">
                  <input type="radio" name="ship_add" value="0" checked=""> Home Address
                  <p><i class="fa fa-map-marker"></i> <?= ucwords($_SESSION['user']['address']).'-'.$_SESSION['user']['pincode']?></p>
              </div>
          </div>
          <?php $j=0; if(!empty($addresses)){
              foreach($addresses as $address){?>
              <div class="col-md-4">
                  <input type="radio" name="ship_add" value="<?= $address['id']?>"> Another Address <?= ++$j;?>
                  <p>
                      <a href="#" class="btn-primary btn-sm edit_btn " data-id="<?= $address['id']?>"> Edit</a>
                      <i class="fa fa-map-marker"></i> 
                      <?= ucwords($address['name'].', '.$address['address'].', '.$address['street'].', '.$address['city'].' - '.$address['pincode'].', '.$address['state'].', Mobile No. '.$address['mobile_no']) ?>
                  </p>
              </div>
          <?php } } ?>
      </div>
       <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="table-content table-responsive">
               <table>
                  <thead>
                     <tr>
                        <th class="pro-thumbnail">Image</th>
                        <th class="pro-title">Product</th>
                        <th class="pro-price">Price</th>
                        <th class="pro-quantity">Quantity</th>
                        <th class="pro-subtotal">Total</th>
                     </tr>
                  </thead>
                  <tbody>
                  	<?php $total=0;
                    foreach($products as $key=>$value){ ?>
  	                   <tr>
  	                      <td class="product-thumbnail">
  	                         <a href="<?= base_url.'product/'.$value['slug']?>"><img src="<?= base_url.'images/products/'.$value['image_name']?>" alt="<?= $value['name']?>"></a>
  	                      </td>
  	                      <td class="product-name">                  
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
                      <th class="text-right" colspan="4">Delivery Charge</th>
                      <th class="">
                        <i class="fa fa-inr"></i> <span id="total_price"><?= $charge = $_SESSION['delivery_charge'] ?></span>
                      </th>
                    </tr>
                    <tr>
                      <th class="text-right" colspan="4">Coupon Discount</th>
                      <th class="">
                        <i class="fa fa-inr"></i> <span id="total_price"><?php 
                        $total = $total + $charge;
                        echo $discount = isset($_SESSION['coupon_code'])? ($total * $_SESSION['coupon_code'] / 100) :0 ;
                        
                        ?></span>
                      </th>
                    </tr>
                    <tr>
                      <th class="text-right" colspan="4">Grand Total</th>
                      <th class="">
                        <i class="fa fa-inr"></i> <span id="total_price"><?= $total = $total - $discount ?></span>
                      </th>
                    </tr>
                  </tfoot>
               </table>
            </div>
            <input type="hidden" class="totalonly" value="<?=$ty?>">
            <input type="hidden" name="delivery_charge" value="<?= $charge ?>">
            <input type="hidden" name="amount" value="<?= $total ?>">
            <input type="hidden" name="discount_amount" value="<?= $discount ?>">
            <div class="row">
               <div class="col-lg-12">
                  <div class="cart-shiping-update-wrapper">
                     <div class="cart-shiping-update">
                        <a class="theme-default-button" href="<?= base_url?>products">Continue Shopping</a>
                     </div>
                     
                     <?php if($place_option == 'found') { ?>
                         <div class="cart-clear">
                            <button type="submit" name="pay" title="Proceed for place" class="action checkout btn btn-primary" >
                                <span>Place Order</span>
                            </button>
                         </div>
                     <?php } else { ?>
                        <div class="cart-clear">
                            <p>To place order on <strong><?= $_SESSION['user_pincode']?></strong> pincode, you must have address of this pincode.</p>
                         </div>
                     <?php } ?>
                     </form>
                     <div class="col-12 col-md-6 col-sm-6 col-lg-6 col-xl-6">
                        <?= isset($msg)?$msg:(isset($_SESSION['coupon_code'])?'Coupon code applied.':'')?>
                        <form action="" class="validatepin" method="post">
                            <div class="input-group mb-3">
                              <input type="text" class="form-control coupon_code" style="height:37px;" required placeholder="Coupon code" aria-label="coupon_code" name="coupon_code" aria-describedby="button-addon2">
                              <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Apply</button>
                              </div>
                            </div>
                        </form>
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
<!-- Edit Address -->
<div id="edit_add" class="modal fade" role="dialog" style="margin-top: 6%;">
  <div class="modal-dialog">
    <form method="post" action="" id="address_book1">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Edit Address Details</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <div class="form-group">
                <input type="text" name="name" class="form-control a_name" placeholder="Enter Name">
            </div>
            <div class="form-group">
                <input type="text" name="pincode" class="form-control a_pincode"  onkeypress="return isNumberKey(event);"  placeholder="Pincode">
            </div>
            <div class="form-group">
                <input type="text" name="mobile_no" class="form-control a_mobile_no" placeholder="Enter Mobile No"  onkeypress="return isNumberKey(event);"  >
            </div>
            <div class="form-group">
                <input type="text" name="address" class="form-control a_address" placeholder="Enter Flat / House / Floor / Building ">
            </div>
            <div class="form-group">
                <input type="text" name="street" class="form-control a_street" placeholder="Enter Street / Colony / Locality">
            </div>
            <div class="form-group">
                <input type="text" name="city" class="form-control a_city" placeholder="Enter City">
            </div>
            <div class="form-group">
                <input type="text" name="state" class="form-control a_state" placeholder="Enter State">
                <input type="hidden" name="id" class="form-control a_id">
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" name="Edit" class="btn btn-primary">Update</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
    </form>
  </div>
</div>
<?php require_once 'footer.php';?>
<script type="text/javascript">
    $(function(){
        $(document).on('click','.edit_btn',function(){
            //ajax call
            var id = $(this).data('id');
            $.ajax({
                url:'myajax',
                type:'post',
                data:{id:id,action:'useraddress'},
                success:function(result){
                    var r = $.parseJSON(result);
                    if(r.status)
                    {
                        $.each(r.data,function(i,val){
                            $('.a_address').val(val.address);
                            $('.a_name').val(val.name);
                            $('.a_city').val(val.city);
                            $('.a_mobile_no').val(val.mobile_no);
                            $('.a_pincode').val(val.pincode);
                            $('.a_street').val(val.street);
                            $('.a_state').val(val.state);
                            $('.a_id').val(val.id);
                        });
                    }
                    else
                    {
                        alert('Sorry! Unable to process. Please try after sometime.');
                    }
                },
                error:function(error){
                    alert('Something went wrong!');
                }
            })
          $('#edit_add').modal('show');
        });
    });
</script>