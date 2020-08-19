<?php
$active_tab = 'users';
require_once('templates/header.php');
require_once('templates/sidebar.php');
if(!empty($_POST['user_action'])) {
  switch($_POST['user_action']) {
    case 'delete':
        //$QueryFire->deleteDataFromTable("users",' id='.$_POST['id']);
        $QueryFire->upDateTable("users",' id='.$_POST['id'],array('is_deleted'=>1));
        $msg = 'User deleted successfully.';
        break;
  }
}
$data = $QueryFire->getAllData('users',' is_deleted=0 order by id desc');
?>
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Users </h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
            <li class="breadcrumb-item active">Users</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>
  <section class="content">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <?php echo !empty($msg)?'<h5 class="text-center text-success">'.$msg.'</h5>':''?>
            <table class="table table-bordered table-striped table-bordered table-hover dt-responsive nowrap">
              <thead>
                <tr>
                  <th>Sr No.</th>
                  <th>Name</th>
                  <th>Mobile No</th>
                  <th>Email</th>
                  <th>Address</th>
                  <th>Pincode</th>
                  <th>Verified</th>
				  <th>User Type</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php if(!empty($data)) {
                  $cnt=1;
                  foreach($data as $row) { ?>
                  <tr <?php echo $row['user_type']=='prime'?'class="bg-success"':'' ?> >
                    <td><?php echo $cnt++;?></td>
                    <td><?php echo $row['name'];?></td>
                    <td><?php echo $row['mobile_no'];?></td>
                    <td><?php echo $row['email'];?></td>
                    <td><?php echo $row['address'];?></td>
                    <td><?php echo $row['pincode'];?></td>
                    <td><?php echo $row['is_verified']?'Yes':'No';?></td>
					  <td><?php echo ucwords($row['user_type'])?></td>
                    <td>
                      <button class="btn btn-danger btn-xs dev-delete mt-1" data-id="<?php echo $row['id'];?>">Delete</button>
                    </td>
                  </tr>
                <?php } } ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
  <form class="active_inactive-form" method="post">
    <input type="hidden" name="id" />
    <input type="hidden" name="user_action" />
  </form>
<?php 
$appendScript = '
  <script>
    $(document).ready(function() {
	      var table = $(".dt-responsive").dataTable({
        dom: "Bfrtip",
        buttons: [
            {
               extend: "copy",
               footer: true,
               exportOptions: {
                  columns: [0,1,2,3,4,5,6,7]
                }
            },
            {
               extend: "csv",
               footer: false,
               exportOptions: {
                  columns: [0,1,2,3,4,5,6,7]
                }
              
            },
            {
               extend: "excel",
               footer: false,
               exportOptions: {
                  columns: [0,1,2,3,4,5,6,7]
                }
            },
             {
               extend: "pdf",
               footer: false,
               exportOptions: {
                  columns: [1,2,3,5,6,7]
                }
            }
            
        ]  
      });
      jQuery(document).on("click",".dev-delete",function(e){
          if(jQuery(this).data("id") != "") {
              var id = jQuery(this).data("id");
              bootbox.confirm({
                  title: "Are you sure you want to delete this user?",
                  message: "<span class='."'text-danger'".'>User and all related information will be deleted permanently.</span>",
                  buttons: {
                    confirm: {
                      label: "Yes",
                      className: "btn-success btn-sm"
                    },
                    cancel: {
                      label: "No",
                      className: "btn-danger btn-sm"
                    }
                  },
                  callback: function (result) {
                    if(result) {
                        jQuery(".active_inactive-form input:nth(0)").val(id);
                        jQuery(".active_inactive-form input:nth(1)").val("delete");
                      jQuery(".active_inactive-form").submit();
                    }
                  }
              });
          }
      });
    });
  </script>';
require_once('templates/footer.php');?>