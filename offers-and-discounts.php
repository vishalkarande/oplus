<?php
$active_tab = 'Offers and discounts';
require_once('header.php');
require_once('menu.php');
$data = $QueryFire->getAllData('pageandcontents','id=3')[0];
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
            <span>Offers & Discounts</span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<div class="about-us-area pt-50 pb-50" id="section-about-area">
  <div class="container">
    <?= html_entity_decode($data['text'])?>
  </div>
</div>
<?php require_once('footer.php');?>