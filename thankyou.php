<?php
$active_tab = 'Thank you';
require_once('header.php');
require_once('menu.php');
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
            <span>Order Placed</span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<div class="about-us-area pt-100 pb-100" id="section-about-area">
  <div class="container">
    <h2 class="text-success">Order placed successfully.</h2>
  </div>
</div>
<?php require_once('footer.php');?>
