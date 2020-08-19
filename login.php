<?php
$active_tab = 'Login';
require_once('header.php');
require_once('menu.php');
if(isset($_SESSION['user'])) {
	if(isset($_REQUEST['url']))
    	echo "<script>window.location.href='".$_REQUEST['url']."';</script>";
    else
    	echo "<script>window.location.href='".base_url."';</script>";
}
if(isset($_POST['login'])) {
    $data = $QueryFire->getAllData('users',' email="'.trim(strip_tags($_POST['email'])).'" and password ="'.md5(trim(strip_tags($_POST['password']))).'"');
    if(!empty($data[0])) {
        $data = $data[0];
        if($data['is_verified'] ==1) {
            $success = 'Logged in successfully.';
            $dummy = '';
			
			$_SESSION['loginstatus']="yes";
			
            //set session
            if(isset($_SESSION['cartitems'])) {
              $dummy = $_SESSION['cartitems'];
            }
            $_SESSION['user'] = $data;
            if(!empty($dummy)) {
                $_SESSION['cartitems']= $dummy;
            }
            $to = $data['email'];
            $subject = 'New sign from IP Address '.get_client_ip();
            $htmlContent ="
            <html>
                <head>
                    <title>New login from device </title>
                    <style>
                        tr{
                        border:1px solid gray;
                        padding:5px;
                        }
                        th{
                        text-align:right;
                        }
                        .btn-verify{
                            color: #FFF;
                            background-color: rgb(255, 148, 57);
                            border: 2px solid rgb(255, 148, 57);
                            border-radius: 0px 10px;
                            font-weight: 700;
                            padding: 8px 25px;
                            font-size: 12px;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                        }
                    </style>
                </head>
                <body>
                    Hi <b>".$data['name']."</b>,<br>
                    Someone just logged in with  ".get_client_ip()." on <a href=". base_url .">Oplus Forgot Password</a> <br> If this is not you kindly report us at info@oplus.co.in
                </body>
            </html>";
            // Set content-type header for sending HTML email
            $headers= "MIME-Version: 1.0" . "\r\n";
            $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
            // Additional headers
            $headers .= 'From: Admin <info@oplus.co.in>' . "\r\n";
           /* if(mail($to,$subject,$htmlContent ,$headers)) {
                if(isset($_REQUEST['url']))
                    echo "<script>window.location.href='".urldecode($_REQUEST['url'])."';</script>";
                elseif(isset($_SERVER['HTTP_REFERER']) && !empty($_SERVER['HTTP_REFERER']))
                    echo '<script> window.location.href="'.$_SERVER['HTTP_REFERER'].'";</script>';
                else
                    echo '<script> window.location.href="'.base_url.'";</script>';
            }*/
            if(isset($_REQUEST['url']))
                echo "<script>window.location.href='".urldecode($_REQUEST['url'])."';</script>";
            elseif(isset($_SERVER['HTTP_REFERER']) && !empty($_SERVER['HTTP_REFERER']))
                echo '<script> window.location.href="'.$_SERVER['HTTP_REFERER'].'";</script>';
            else
                echo '<script> window.location.href="'.base_url.'";</script>';
        } else {
            $error=" You are not verified your email yet. Kindly check your mail/message and then click to verify.";
        }
    } else {
        $error = "Invalid email or password.";
    }
}
if(isset($_POST['forgot-password'])) {
	$data = $QueryFire->getAllData('users',' email="'.trim(strip_tags($_POST['email'])).'"');
	if(!empty($data[0])) {
	    $data = $data[0];
	    if($data['is_verified'] ==1) {
	        //just update tokan 
	        $token = generateRandomString(10);
	        $QueryFire->upDateTable("users",' email="'.trim(strip_tags($_REQUEST['email'])).'"', array('access_token'=>$token));
	        $success = 'Password reset successfully. Check your email to change password.';
	        $to = $data['email'];
	        $subject = 'Forgot password request from IP Address '.get_client_ip();
	        $htmlContent ="
	        <html>
	            <head>
	                <title>Forgot password | Oplus Forgot Password </title>
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
	                Hi <b>".$data['name']."</b>,<br>
	                Someone just requested forgot password option on your registered mail with  ".get_client_ip()." on <a href=". base_url .">Oplus.co.in</a> <br> If this is not you kindly report us at info@oplus.co.in<br><br>
	                <b>To reset your password <a href='".base_url."change-password/".$token."'> click here<a/>.</b>
	            </body>
	        </html>";
	        // Set content-type header for sending HTML email
	        $headers= "MIME-Version: 1.0" . "\r\n";
	        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
	        // Additional headers
	        $headers .= 'From: admin <info@oplus.co.in>' . "\r\n";
	        mail($to,$subject,$htmlContent ,$headers);
	        //if(mail($to,$subject,$htmlContent ,$headers))
	        //echo "<script>window.location.href='".base_url."';</script>";
	    }
	    else
	        $error=" You are not verified your email yet. Kindly check your mail and then click to verify.";       
	}
	else
	{
	    $error = "Incorrect email address.";
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
            <span>Login</span>
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
                           <h2>Login</h2>
                           <p>Please login using account detail bellow.</p>
                        </div>
                        <div class="login-form">
                           <input type="email" name="email" id="CustomerEmail" class="input-full" placeholder="Email" required autocorrect="off" autocapitalize="off" autofocus>
                           <input type="password" value="" name="password" id="CustomerPassword" required class="input-full" placeholder="Password">
                           <div class="login-toggle-btn">
                              <div class="form-action-button">
                                 <button type="submit" name="login" class="theme-default-button">Sign In</button>
                                 <a href="#recover" id="RecoverPassword">Forgot your password?</a>
                              </div>
                              <div class="account-optional-action">
                                 <a href="<?= base_url?>register" id="customer_register_link">Create account</a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
               <div id="RecoverPasswordForm" style="display: none;">
                  <form method="post" action="" accept-charset="UTF-8">
                     <div class="login-form-container">
                        <div class="login-text">
                           <h2>Reset your password</h2>
                           <p>We will send you an email to reset your password.</p>
                        </div>
                        <div class="login-form">
                           <input type="email" value="" name="email" id="RecoverEmail" class="input-full" placeholder="Email" required autocorrect="off" autocapitalize="off">
                           <div class="login-toggle-btn">
                              <div class="form-action-button">
                                 <button type="submit" name="forgot-password" class="theme-default-button">Submit</button>
                                 <a href="#" id="HideRecoverPasswordLink">Cancel</a>
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