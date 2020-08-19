<?php


	//session_start();


$_SESSION['prime']=499;


?>



<form method="post" id="Contact_" accept-charset="UTF-8" class="contact-form"><div id="one-time-newsletter" class="popup_wrapper shopify_newsletter_class" >

  <div class="newsletter_popup_inner"style="background-color:#a6db69">
    <span class="popup_off">x</span>
    <div class="subscribe_area" >
      <h2 class="">BE A PRIME MEMBER AND GET EXCITING OFFERS</h2>
      <h3 class="">JUST AT RS 499/-</h3>
<div style="padding-left:30%" id="mc_embed_signup_scroll" class="mc-form">
       
     <a href="prime.php">   <input type="button" value="Get Now" style="width:200px" name="commit" id="subscribe" class="button"></a>
      </div>
    </div>

  </div>
</div></form>








<script type="text/javascript">
  setTimeout(function() {
    $('.popup_wrapper').css({"opacity": "1", "visibility": "visible"});
    $('.popup_off').click(function(){
      $(".popup_wrapper").fadeOut(200);
    })
  }, 1800);	 
</script>
