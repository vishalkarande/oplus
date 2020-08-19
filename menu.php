  <header class="header-area" >
    <div class="header-middle">
      <div class="container">
        <div class="row hidden-xs">
          <div class="col-lg-3 col-md-4 col-12 col-sm-4"><a href="<?= base_url?>" class="logo">
            <img src="<?= base_url?>images/logo.png" alt="Oplus Logo">
          </a></div>
          <div class="col-lg-9 col-md-8 col-12 col-sm-8">
            <div class="header-middle-right f-right">
              <div class="header-login">
                <?php if(!isset($_SESSION['user'])) { ?>
                  <a href="<?= base_url?>login">
                    <div class="header-icon-style">
                      <i class="icon-user icons"></i>
                    </div>
                  </a>
                <?php } else {?>
                  <a href="<?= base_url?>my-account">
                    <div class="header-icon-style">
                      <i class="icon-user icons"></i>
                    </div>
                  </a>
                <?php } ?>
              </div>
              <div class="header-wishlist">
                <a href="<?= base_url?>wishlist">
                  <div class="header-icon-style">
                    <i class="icon-heart icons"></i>
                  </div>
                </a>
              </div>
              <div class="header-cart">
                <a href="<?= base_url?>cart">
                  <div class="header-icon-style">
                    <i class="icon-handbag icons"></i>
                    <span class="bigcounter count-style"><?=isset($_SESSION['cartitems'])?count($_SESSION['cartitems']):'0'?></span>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="header-bottom transparent-bar black-bg" >
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-12">
            <div class="main-menu">
              <nav>
                <ul>
                  <li><a href="<?= base_url?>">Home </a>   </li>
                  <li><a href="<?= base_url?>about-us">About Us</a></li>
                  <li class="top-hover">
                    <a href="<?= base_url?>products">Product<i class="ion-chevron-down"></i> </a>
                    <ul class="common-class ">
                      <?php if(!empty($categories)) {
                        foreach($categories as $cat) {
                          echo '<li class="dropdown-add-class "><a href="'.base_url.'category/'.$cat['slug'].'">'.$cat['name'].'</a></li>';
                        }
                      } ?>
                    </ul>
                  </li>
                  <li><a href="<?= base_url?>offers-and-discounts">Offers & Discounts</a></li>
                  <li><a href="<?= base_url?>contact-us">Contact Us</a></li>
                  <li><a href="<?= base_url?>testimonials">Testimonials</a></li>
                  <?php if(isset($_SESSION['user'])) { ?>
                    <li><a href="<?= base_url?>logout">Logout</a></li>
                  <?php } ?>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- mobile-menu-area-start -->
    <div class="mobile-menu-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="mobile-menu">
              <nav id="mobile-menu-active">
                <ul class="menu-overflow" id="nav">
                  <li><a href="<?= base_url?>">Home</a></li>
                  <li><a href="<?= base_url?>about-us">About Us</a></li>
                  
                  <li><a href="<?= base_url?>products">Product</a>
                    <ul class="common-class ">
                      <?php if(!empty($categories)) {
                        foreach($categories as $cat) {?>
                            <li class="">
                               <a href="<?= base_url.'category/'.$cat['slug'] ?>"><?= $cat['name'] ?> </a>
                               <?php if(!empty($cat['subcategory'])) { ?>
                                <ul class="common-class ">
                                   <?php
                                   foreach($cat['subcategory'] as $subcat) {
                                       echo '<li><a href="'.base_url.'category/'.$cat['slug'].'/'.$subcat['slug'].'">'.$subcat['name'].'</a></li>';
                                   } ?>
                                </ul>
                               <?php } ?>
                            </li>
                        <?php }
                      } ?>
                    </ul>
                  </li>
                  <li><a href="<?= base_url?>offers-and-discounts">Offers & Discounts</a></li>
                  <li><a href="<?= base_url?>contact-us">Contact US</a></li>
                  <li><a href="<?= base_url?>testimonials">Testimonials</a></li>
                  <?php if(!isset($_SESSION['user'])) {?>
                    <li><a href="<?= base_url?>login">Login</a></li>
                  <?php } else { ?>
                    <li>
                      <a href="<?= base_url?>my-account">My Account</a>
                      <ul class="common-class ">
                        <li class=""><a href="<?= base_url?>my-account">Account</a></li>
                        <li class=""><a href="<?= base_url?>logout">Logout</a></li>
                      </ul>
                    </li>
                  <?php } ?>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- mobile-menu-area-end --> 
  </header>
<main role="main">