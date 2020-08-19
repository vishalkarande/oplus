<?php
$active_tab = 'Change Password';
require_once('header.php');
require_once('menu.php');
if(!isset($_REQUEST['token'])) {
    echo "<script> window.location.href='".base_url."';</script>";
    exit;
}
if(isset($_REQUEST['pass'])) {
  if($_POST['pass'] == $_POST['repass']) {
    $data = $QueryFire->getAllData('users',' access_token="'.trim(strip_tags($_REQUEST['token'])).'"');
    if(!empty($data)) {
      $data = $data[0];
      if($QueryFire->upDateTable("users",' access_token="'.trim(strip_tags($_REQUEST['token'])).'"', array('password'=>md5(trim(strip_tags($_REQUEST['pass']))),'access_token'=>''))) {
        $success= 'Password reset successfully.';
        $subject = ' Password Change ';
        $htmlContent ="
        <html>
            <head>
                <title>Password Changed</title>
            </head>
            <body>
                Hi <b>".$data['name']."</b>,<br>
                You have changed your account password on <a href=". base_url .">oplus.co.in</a> <br>. For any help kindly contact us at info@olus.co.in
            </body>
        </html>";
        // Set content-type header for sending HTML email
        $headers= "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
        // Additional headers
        $headers .= 'From:admin <info@oplus.co.in>' . "\r\n";
        mail($data['email'],$subject,$htmlContent ,$headers);
      }
    } else {
      $error= " Sorry, we are unable to reset your password. We request you to click the link sent on your registered email.";
    }
  }
  else {
    $error= "Password and Re-enter password does not match.";
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
            <span>Change Password</span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<?= isset($success)?'<h3 class="text-center text-primary">'.$success.'</h3>': (isset($error)?'<h3 class="text-center text-warning">'.$error.'</h3>':'')?>
<div class="customer-page theme-default-margin">
   <div class="container">
      <div class="row">
         <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2">
            <div class="login">
               <div id="CustomerLoginForm">
                  <form method="post" action="" accept-charset="UTF-8">
                     <div class="login-form-container">
                        <div class="login-text">
                           <h2>Change Password</h2>
                        </div>
                        <div class="login-form">
                           <input type="password" name="pass" id="CustomerPassword" class="input-full" placeholder="Password" required autocorrect="off" autocapitalize="off" autofocus>
                           <input type="password" value="" name="repass" id="CustomerRePassword" required class="input-full" placeholder="Password">
                           <div class="login-toggle-btn">
                              <div class="form-action-button">
                                 <button type="submit" name="change" class="theme-default-button">Change Password</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<?php require_once('footer.php');?>