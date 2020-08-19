<?php
$active_tab = 'prime';
require_once('header.php');
require_once('menu.php');
$data = $QueryFire->getAllData('pageandcontents','id=9')[0];
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
            <span>Try Prime Membership</span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<?php if($_SESSION['user']['user_type'] == 'regular'){ ?>
	<div class="container text-center">
		<a href="<?= base_url.'razorpay/pay/prime'?>" class="btn btn-secondary" >Try Prime Membership</a>
	</div>
<?php } ?>
<div class="about-us-area pt-50 pb-50" id="section-about-area">
  <div class="container">
    <?= html_entity_decode($data['text'])?>
  </div>
</div>
<?php require_once('footer.php');?>
