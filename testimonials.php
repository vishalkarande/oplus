<?php
$active_tab = 'Testimonials';
require_once('header.php');
require_once('menu.php');
$testimonials = $QueryFire->getAllData('testimonials','is_show=1');
?>
<style type="text/css">
  .testimonial-content {
    max-height: 271px;
    overflow: hidden;
    padding-right: 3px;
    text-align:justify;
  }
  .testimonial-content:hover{
    overflow: auto;
  }
  .testimonial {
    border: 1px solid rgba(180,180,180,0.5);
    padding: 10px 5px;
    margin-top:20px;
  }
  .img-thumbnail {
    max-height: 235px;
    width:100%;
  }
  .testimonial:hover{
    box-shadow: 3px 9px 20px rgba(167, 171, 172, 0.5);
    transform:scale(1.05);
  }
  .testimonial h4{
    font-size: 16px;
    text-align: center;
    margin-top: 5px;
    font-weight: 600;
  }
</style>

<div class=" pt-50 pb-50" >
  <div class="container">
    <?php if(!empty($testimonials)) { ?>
      <div class="row">
        <?php foreach($testimonials as $testimonial) { ?>
          <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="testimonial fadeOutLeft">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <img src="<?php echo base_url.'/images/testimonials/'.$testimonial['image_name']?>" alt="<?php echo $testimonial['name']?>" class="img-responsive img-thumbnail" />
                  <h4><?php echo ucwords(strtolower($testimonial['name']))?></h4>
                  <div class="text-center"><strong><?php echo $testimonial['title']?></strong></div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <p class="testimonial-content">
                    <?= $testimonial['opinion']?>
                  </p>
                </div>
              </div>
            </div>
          </div>
        <?php } ?>
      </div>
    <?php } ?>
  </div>
</div>
<?php require_once('footer.php');?>
