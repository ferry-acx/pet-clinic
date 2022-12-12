<?php 

require_once './header.php'; 
include('inc/code-generator.php');
include('inc/analytics.php');


   if(isset($_POST['payOrder'])) {

  $id = $_POST['order_id'];

  $order_code = $_POST['order_code'];

  $payment_no = $_POST['payment_no'];

  $payment_method = $_POST['payment_method'];





  $update = $pdo->prepare("UPDATE orders set status='PAID', date_paid=now(), ref_num=:payment_no, payment_method=:payment_method where id=:id ");

  $update->bindParam(":payment_no",$payment_no);

  $update->bindParam(":payment_method",$payment_method);

  $update->bindParam(":id",$id);



  if($update->execute()){



        ?>

 

      <script type="text/javascript">

        window.addEventListener("load", function() {

          swal({

            title: "Order Paid Successfully",

            text: "Order <?php echo $order_code ?>, Has Been Paid",

            icon: "success",

            showCancelButton: false,

            showConfirmButton: false,

            buttons: false

          });

        });

      </script>

      <?php



     header('refresh:2;orders-print.php#'.$id);

    } else {

      ?>

      <script>

        window.addEventListener("load", function() {

          swal({

            title: "Error",

            text: "Order Payment Failed",

            icon: "error",

            showConfirmButton: false,

            showCancelButton: false,

            buttons: false

          });

        });

      </script>



      <?php

     header('refresh:2;payorders.php');

    }





}



?>



<script type="text/javascript">

  $('#nav-sales').find('a').toggleClass('active');

</script>





<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">

  <!-- Content Header (Page header) -->

  <div class="content-header">

    <div class="container-fluid">

      <div class="row mb-2">

    <!--<div class="col-sm-6">

     <span class="d-flex" style="align-items: baseline;"><h1 class="">Dashboard</h1><small>Admin</small></span>

    </div> /.col 

    <div class="col-sm-6">

      <ol class="breadcrumb float-sm-right">

        <li class="breadcrumb-item"><a href="#">Home</a></li>

        <li class="breadcrumb-item active">Dashboard</li>

      </ol>

  </div>--><!-- /.col -->

</div><!-- /.row -->

</div><!-- /.container-fluid -->

</div>

<!-- /.content-header -->



<!-- Main content -->

<section class="content">

  <div class="container-fluid">



          <!-- Info boxes -->

      <div class="row mt-2">

        



        <!-- fix for small devices only -->

        <div class="clearfix hidden-md-up"></div>



        <div class="col-12 col-sm-6 col-md-4">

          <div class="info-box mb-3">

            <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cart-arrow-down"></i></span>



            <div class="info-box-content">

              <span class="info-box-text">SALES REVENUE</span>

              <span class="info-box-number"><span class="mr-2"><i class="fa fa-peso-sign"></i></span><?=number_format($sales,2)?></span>

            </div>

            <!-- /.info-box-content -->

          </div>

          <!-- /.info-box -->

        </div>

        <!-- /.col -->

        <div class="col-12 col-sm-6 col-md-4">

          <div class="info-box">

            <span class="info-box-icon bg-success elevation-1"><i class="fas fa-hand-holding-medical"></i></span>



            <div class="info-box-content">

              <span class="info-box-text">SERVICES REVENUE</span>

              <span class="info-box-number"><span class="mr-2"><i class="fa fa-peso-sign"></i></span><?=number_format($services,2)?></span>

            </div>

            <!-- /.info-box-content -->

          </div>

          <!-- /.info-box -->

        </div>

        <!-- /.col -->

        <div class="col-12 col-sm-6 col-md-4">

          <div class="info-box mb-3">

            <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-coins"></i></span>



            <div class="info-box-content">

              <span class="info-box-text">TOTAL REVENUE</span>

              <span class="info-box-number"><span class="mr-2"><i class="fa fa-peso-sign"></i></span><?=number_format(($sales+$services),2)?></span>

            </div>

            <!-- /.info-box-content -->

          </div>

          <!-- /.info-box -->

        </div>

        <!-- /.col -->

      </div>

      <!-- /.row -->

    <div class="row mt-3">

      <div class="col-md-12">

        <div class="card">

              

          <div class="card-header">

            <h3 class="card-title">PRODUCT SALES</h3>

          </div>

              <!-- /.card-header -->

              <div class="card-body">

                <table id="example1" class="table table-bordered table-striped">

                  <thead>

                      <tr>

                        <th>ORDER CODE</th>

                        <th>PRODUCT</th>

                        <th>QUANTITY</th>
                        <th>SALES</th>

                        <th>CUSTOMER</th>

                        <th>DATE</th>

                      </tr>

                    </thead>

                    <tbody>

                      <?php

                      $get_order = $pdo->prepare("SELECT orders.code, products.name as product, order_details.qty, customers.name as customer , orders.date_paid, order_details.total FROM `order_details` INNER JOIN orders on orders.id=order_details.order_id INNER join customers on customers.id=orders.customer_id INNER join products on products.id=order_details.product_id WHERE orders.status='PAID' ORDER BY orders.date_paid DESC");

                      $get_order->execute();

                      while ($order = $get_order->fetch(PDO::FETCH_OBJ)) {

                                    // var_dump($product);

                        ?>



                        <tr>


                          <td><?=$order->code?></td>

                          <td><?=$order->product?></td>

                          <td><?=$order->qty?></td>
                          <td><span class="mr-2"><i class="fa fa-peso-sign"></i></span><?=number_format($order->total,2)?></td>

                          <td><?=$order->customer?></td>

                          <td><?=$order->date_paid?></td>

                        </tr>

                        <?php  

                      }

                      ?>

                    </tbody>

                    <tfoot>



                    </tfoot>

                </table>

              </div>

              <!-- /.card-body -->

            </div>

            <!-- /.card -->

      </div>

      <!-- /.col -->

    </div>

  </div><!--/. container-fluid -->

</section>

<!-- /.content -->

</div>

<!-- /.content-wrapper -->


<!-- DataTables  & Plugins -->

<script src="<?=$baseurl ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/jszip/jszip.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/pdfmake/pdfmake.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/pdfmake/vfs_fonts.js"></script>

<script src="<?=$baseurl ?>assets/plugins/datatables-buttons/js/buttons.html5.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/datatables-buttons/js/buttons.print.min.js"></script>

<script src="<?=$baseurl ?>assets/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>



<script>

  $(function () {



    $('#example1').DataTable({

      "paging": true,

      "lengthChange": false,

      "searching": true,

      "ordering": true,
      "order": [ 5, 'desc' ],
 
      "info": true,

      "autoWidth": false,

      "responsive": true,

      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]

    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');



  });





</script>



<?php require_once './footer.php'; ?>