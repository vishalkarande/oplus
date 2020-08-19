  </main>
  <div class="footer-area black-bg-2 pt-50">
    <div class="footer-top-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="footer-about mb-20">
              <div class="footer-logo">
                <a href="<?= base_url?>"><img src="<?= base_url?>images/logo.png" alt="Oplus" /></a>
              </div>            
              <p>Oplus is an emerging market leader in complete range of organic, Healthy and natural products and services.</p>
            </div>
          </div>
          <div class="col-lg-2 col-md-6 col-sm-6">
            <div class="footer-widget mb-40">
              <div class="footer-title mb-22">
                <h4>Support</h4>
              </div>
              <div class="footer-content">
                <ul>
                  <li><a href="<?= base_url?>privacy-policy">Privacy Policy</a></li>
                  <li><a href="<?= base_url?>terms-and-conditions">Terms & Conditions</a></li>
                  <li><a href="<?= base_url?>offers-and-discounts">Offers & Discounts</a></li>
                </ul>
              </div>
            </div>
          </div>          
          <div class="col-lg-2 col-md-6 col-sm-6">
            <div class="footer-widget mb-20">
              <div class="footer-title mb-22">
                <h4>Information</h4>
              </div>
              <div class="footer-content">
                <ul>
                  <li><a href="<?= base_url?>my-account">My Account</a></li>              
                  <li><a href="<?= base_url?>wishlist">Wish List</a></li> 
                  <li><a href="<?= base_url?>cart">Cart</a></li> 
                </ul>
              </div>
            </div>
          </div>          
          <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="footer-widget mb-20 border-bottom-0">
              <div class="footer-title mb-22">
                <h4>Get In Touch</h4>
              </div>
              <div class="footer-contact">
                <ul>
                  <li>Address: Gandhi Peth,Chinchwad,Pune,Maharashtra, India</li>                  
                  <li>Call Us:  <a href="callto:+917798669977">+91 7798669977</a>, <a href="callto:+917028001265"> +91 7028001265</a></li>                  
                  <li>Email:<a href="mailto:info@oplus.co.in"> info@oplus.co.in</a> </li>
                </ul>
              </div>
           </div>
         </div>
       </div>
     </div>
    </div>
    <div class="footer-bottom-area border-top-4">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 col-md-9 col-sm-9">
            <div class="copyright">
              <p>Copyright &copy; <?= date('Y')?> <a href="<?= base_url?>" title="Oplus">Oplus</a> . All Right Reserved. Designed & developed by <a href="https://www.weras.in" target="_blank">WE33RAS IT.Pvt.Ltd</a></p>
            </div>
          </div>
          <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="footer-social">
              <ul>
               <li><a href="https://www.facebook.com/Oplus-Shop-for-Healthy-Life-101868721436238/"><i class="ion-social-facebook"></i></a></li>
               <li><a href="https://instagram.com/oplusnaturals"><i class="ion-social-instagram"></i></a></li>
               <li><a href="#"><i class="ion-social-twitter"></i></a></li> 
               <li><a href="https://api.whatsapp.com/send?phone=919404252037"><i class="ion-social-whatsapp"></i></a></li>
             </ul>
           </div>
         </div>
       </div>
     </div>
    </div>
  </div>
  <!-- modalAddToCart -->
  <div class="modal fade ajax-popup" id="modalAddToCart" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog white-modal modal-md">
      <div class="modal-content">
        <div class="modal-body">
          <div class="modal-content-text">
            <span class="success-message"></span>        
          </div>
          <div class="modal-button">
            <a href="<?= base_url?>cart" class="">View Cart</a>
          </div>
          <div class="modal-close">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- /modalAddToCart -->
  <!-- modalAddToCart Error -->
  <div class="modal fade ajax-popup error-ajax-popup" id="modalAddToCartError" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog white-modal modal-md">
      <div class="modal-content ">
        <div class="modal-body">
          <div class="modal-content-text">
            <div class="error_message">Something went wrong.</div>
          </div>
          <div class="modal-close">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- JS -->
  <script src="<?= base_url?>js/modernizr-2.8.3.min3774.js"></script>
  <script src="<?= base_url?>js/jquery-1.12.0.min1853.js"></script>
  <script src="<?= base_url?>js/popper97a2.js"></script>
  <script src="<?= base_url?>js/bootstrap.min9c20.js"></script>
  <script src="<?= base_url?>js/owl.carousel.min29bc.js"></script>
  <script src="<?= base_url?>js/plugins9ffc.js"></script>
  <script src="<?= base_url?>js/themeaa64.js"></script>
  <script src="<?= base_url?>js/fastclick.min1125.js" type="text/javascript"></script>
  <script src="<?= base_url?>js/timber6083.js" type="text/javascript"></script>
  <script src="<?= base_url?>js/custom.js" type="text/javascript"></script>
  <script type="text/javascript">
    $('.input-qty').on('change',function(){
        var total = 0;
        var newPrice = parseFloat($(this).parents('tr').find('.pro_price').html())*$(this).val();
        $(this).parents('tr').find('.totalonly1').html(newPrice);
        $(this).parents('tr').find('.totalonly').val(newPrice);
        $('.totalonly').each(function(i,val){
            total+=parseFloat(val.value);
        });
        var id = $(this).data('id');
        var quantity = $(this).val();
        var url = '<?= base_url?>addtocart';
        //for changing quantity
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
        $('#total_price').html(total);
    });
    $('.btn-cart').click(function(){
        var id = $(this).data('id');
        var quantity = 1;
        var act9ve = $(this);
        var url = '<?= base_url?>addtocart';
        $.ajax({
            url:url,
            data:{action:'add',id:id,'quantity':quantity},
            type:'post',
            success:function(result){
              var s =$.parseJSON(result);
              $('.success-message').html(s.message);
              $('#modalAddToCart').modal('show');
              act9ve.attr('disabled',true);
              $('.bigcounter').html(s.count);
            },
            error:function(error){
                console.log('Error');
            }
        });
    });
    $('.action-remove').click(function(){
        var id = $(this).data('id');
        var act9ve = $(this);
        var url = '<?= base_url?>addtocart';
        $.ajax({
            url:url,
            data:{action:'remove',id:id},
            type:'post',
            success:function(result){
                var s =$.parseJSON(result);
                if(s.status) {
                  alert(s.message);
                  window.location.reload();
                }
                $('.bigcounter').html(s.count);
            },
            error:function(error){
                console.log('Error');
            }
        });
    });
    $('.action-remove1').click(function(){
        var id = $(this).data('id');
        var act9ve = $(this);
        var url = '<?= base_url?>addtocart';
        $.ajax({
            url:url,
            data:{action:'remove1',id:id},
            type:'post',
            success:function(result){
                var s =$.parseJSON(result);
                if(s.status)
                {
                    window.location.reload();
                }
                $('.bigcounter').html(s.count);
            },
            error:function(error){
                console.log('Error');
            }
        });
    });
    $('.btn-wishlist').click(function(){
        var id = $(this).data('id');
        var act9ve = $(this);
        var url = '<?= base_url?>addtocart';
        $.ajax({
            url:url,
            data:{action:'add_wish_list',id:id},
            type:'post',
            success:function(result){
                var s = $.parseJSON(result);
                act9ve.attr('disabled',true);
                alert(s.message);
            },
            error:function(error){
                console.log('Error');
            }
        });
    });
  </script>
</body>
</html>
