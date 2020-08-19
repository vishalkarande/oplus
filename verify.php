<?php
$active_tab = 'Verify Account';
require_once('header.php');
require_once('menu.php');
//check token is valid or not
if(isset($_REQUEST['token'])) {
    $data = $QueryFire->getAllData('users',' access_token="'.trim(strip_tags($_REQUEST['token'])).'"')[0];
    if(!empty($data)) {
        if($QueryFire->upDateTable("users",' access_token="'.trim(strip_tags($_REQUEST['token'])).'"', array('access_token'=>'','is_verified'=>1))) {
            $msg = 'You have successfully verified your account.';            
            //set session
            $_SESSION['user'] = $data;
            $to = $data['email'];
            $subject = ' Your account is activated.';
            $htmlContent ="
            <html>
                <head>
                    <title>Account verification done</title>
                    <style>
                        tr{
                        border:1px solid gray;
                        padding:5px;
                        }
                        th{
                        text-align:right;
                        }
                    </style>
                </head>
                <body>
                    Hi ".$data['name'].",<br>
                    You have verified your account on <a href=". base_url ."><img src='".base_url.'images/logo.png'."'></a><br><br> For any help kindly contact us at info@oplus.co.in
                </body>
            </html>";
            // Set content-type header for sending HTML email
            $headers= "MIME-Version: 1.0" . "\r\n";
            $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
            // Additional headers
            $headers .= 'From:admin <info@oplus.co.in>' . "\r\n";
            if(mail($to,$subject,$htmlContent ,$headers))
                echo "<script> alert('Your account is activated now.');window.location.href='".base_url."';</script>";
        }
        else
            $msg=" You are not verified your email yet. Kindly check your mail and then click to verify.";
    }
    else {
        $msg = " Sorry, we are unable to verify your email. We request you to click the link sent on your registered email/mobile no.";
    }
} else {
    $msg = " Sorry, we are unable to verify your email. We request you to click the link sent on your registered email.";
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
            <span>Verify Your Account</span>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<div class="about-us-area pt-100 pb-100" id="section-about-area">
  <div class="container">
    <?= isset($success)?'<h4 class="text-center text-primary">'.$success.'</h4>':(isset($error)?'<h4 class="text-center text-danger">'.$error.'</h4>':' <h3 class="text-danger"> Sorry! you are not authorized yet.</h3>')?>
  </div>
</div>
<?php require_once('footer.php');?>
