<?php
$active_tab = 'Contact Us';
require_once('header.php');
require_once('menu.php');
if(isset($_POST['name'])) {
  $data = array();
  $data['name'] = strip_tags($_POST['name']);
  $data['email'] = strip_tags($_POST['email']);
  $data['mobile_no'] = strip_tags($_POST['mobile_no']);
  $data['subject'] = strip_tags($_POST['mobile_no']);
  //$data['subject'] = 'Contact Us request from Contact Page';
  $data['message'] = strip_tags($_POST['message']);
  $to = "info@oplus.co.in";
  $subject = trim($data['name']). ' has requested for contact ';
  $txt = "
  <html>
  <head>
  </head>
  <body>
      <table>
          <tr>
              <th>Name : </th>
              <td>".$data['name']."</td>
          </tr>
          <tr>
              <th>Email : </th>
              <td>".$data['email']."</td>
          </tr>
          <tr>
              <th>Mobile :</th>
              <td>".$data['mobile_no']."</td>
          </tr>
          <tr>
              <th>Subject : </th>
              <td>".$data['subject']."</td>
          </tr>
          <tr>
              <th>Message : </th>
              <td>".$data['message']."</td>
          </tr>
          <tr>
              <th>Requested from : </th>
              <td>".base_url."</td>
          </tr>
      </table>
  </body>
  </html>";
  $headers= "MIME-Version: 1.0" . "\r\n";
  $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
  $headers .= "From:" .trim($data['email']);
  if(mail($to,$subject,$txt,$headers)) {
    $success = ' Thank for contacting with us. We will contact you soon.';
    $QueryFire->insertData('contact_enquiry',$data);
  } else {
    $error = "Sorry we are unable to help you at this moment. Please try after sometime.";
  }
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
            <span>Contact Us</span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<div class="contact-area pt-50" id="section-contact-info">
  <div class="container">
    <?= isset($success) ? '<h3 class="text-center text-primary">'.$success.'</h3>' : (isset($error)?'<h3 class="text-center text-danger">'.$error.'</h3>':'')?>
    <div class="row">
      <div class="col-lg-4 col-md-6 col-12">
        <div class="contact-info-wrapper text-center mb-30">
          <div class="contact-info-icon">
            <i class="ion-ios-location-outline"></i>
          </div>
          <div class="contact-info-content">
            <h4>Our Location</h4>            
            <p>Gandhi Peth,Chinchwad,Pune,Maharashtra, India</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-12">
        <div class="contact-info-wrapper text-center mb-30">
          <div class="contact-info-icon">
            <i class="ion-ios-telephone-outline"></i>
          </div>
          <div class="contact-info-content">
            <h4>Contact us Anytime</h4>
            <p><a href="callto:+917028001265">+917028001265</a> / <a href="callto:+917798669977">+917798669977</a></p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-12">
        <div class="contact-info-wrapper text-center mb-30">
          <div class="contact-info-icon">
            <i class="ion-ios-email-outline"></i>
          </div>
          <div class="contact-info-content">
            <h4>Write Some Words</h4>
            <p><a href="mailto:info@oplus.co.in">info@oplus.co.in</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div >
  <form method="post" action="" id="contact_form" accept-charset="UTF-8" class="contact-form">
    <div class="contact-area">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="contact-message-wrapper">
              <h4 class="contact-title">GET IN TOUCH</h4>
              <div class="contact-message">
                <div class="row">
                  <div class="col-lg-6">
                    <div class="contact-form-style mb-20">
                      <input type="text" placeholder="Full Name" required class="" name="name" />
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="contact-form-style mb-20">
                      <input type="email" placeholder="Email Address" required class="" name="email">
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="contact-form-style mb-20">
                      <input type="text" name="subject" placeholder="Subject" required />
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="contact-form-style mb-20">
                      <input type="text" name="mobile_no" placeholder="Mobile No." required />
                    </div>
                  </div>
                  <div class="col-lg-12">
                    <div class="contact-form-style">
                      <textarea rows="3" placeholder="Message" required class="custom-textarea" name="message"></textarea>
                      <button class="submit btn-style" name="send" type="submit">Send Message</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>
<?php require_once('footer.php');?>
