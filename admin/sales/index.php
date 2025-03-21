<style>
    table td,table th{
        padding: 3px !important;
    }
</style>
<?php 
$date_start = isset($_GET['date_start']) ? $_GET['date_start'] :  date("Y-m-d",strtotime(date("Y-m-d")." -7 days")) ;
$date_end = isset($_GET['date_end']) ? $_GET['date_end'] :  date("Y-m-d") ;
?>
<div class="card card-primary card-outline">
    <div class="card-header">
        <h5 class="card-title">Báo cáo doanh thu</h5>
    </div>
    <div class="card-body">
        <form id="filter-form">
            <div class="row align-items-end">
                <div class="form-group col-md-3">
                    <label for="date_start">Thời gian bắt đầu</label>
                    <input type="date" class="form-control form-control-sm" name="date_start" value="<?php echo date("Y-m-d",strtotime($date_start)) ?>">
                </div>
                <div class="form-group col-md-3">
                    <label for="date_start">Thời gian kết thúc</label>
                    <input type="date" class="form-control form-control-sm" name="date_end" value="<?php echo date("Y-m-d",strtotime($date_end)) ?>">
                </div>
                <div class="form-group col-md-1">
                    <button class="btn btn-flat btn-block btn-primary btn-sm"><i class="fa fa-filter"></i> Bộ lọc</button>
                </div>
                <div class="form-group col-md-1">
                    <button class="btn btn-flat btn-block btn-success btn-sm" type="button" id="printBTN"><i class="fa fa-print"></i> In file</button>
                </div>
            </div>
        </form>
        <hr>
        <div id="printable">
            <div class="row row-cols-2 justify-content-center align-items-center" id="print_header" style="display:none">
                <div class="col-1">
                    <img src="<?php echo validate_image($_settings->info('logo')) ?>" alt="<?php echo $_settings->info('short_name') ?>" width="75px" heigth="75px">
                </div>
                <div class="col-7">
                    <h4 class="text-center m-0"><?php echo $_settings->info('name') ?></h4>
                    <h3 class="text-center m-0"><b>Báo cáo doanh thu</b></h3>
                    <?php if($date_start != $date_end): ?>
                    <p class="text-center m-0">Thời gian từ <?php echo date("M d,Y", strtotime($date_start)) ?> đến <?php echo date("M d,Y", strtotime($date_end)) ?></p>
                    <?php else: ?>
                    <p class="text-center m-0">- <?php echo date("M d,Y", strtotime($date_start)) ?> -</p>
                    <?php endif; ?>
                </div>
            </div>
            <hr>

            <table class="table table-bordered">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="20%">
                    <col width="20%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Thời gian</th>
                        <th>Sản phẩm</th>
                        <th>Khách hàng</th>
                        <th>Phương thức thanh toán</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tổng</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $i = 1;
                    $gtotal = 0;
                        $qry = $conn->query("SELECT * FROM `sales` where date(date_created) between '{$date_start}' and '{$date_end}' order by unix_timestamp(date_created) desc ");
                        while($row = $qry->fetch_assoc()):
                            $olist = $conn->query("SELECT ol.*,p.name,b.name as bname,concat(c.firstname,' ',c.lastname) as name,c.email,o.date_created,cc.category,i.variant, o.payment_method FROM order_list ol inner join orders o on o.id = ol.order_id inner join inventory i on ol.inventory_id = i.id inner join `products` p on p.id = i.product_id inner join clients c on c.id = o.client_id inner join brands b on p.brand_id = b.id inner join categories cc on p.category_id = cc.id  where ol.order_id = '{$row['order_id']}' ");
                            while($roww = $olist->fetch_assoc()):
                                $gtotal += $roww['quantity'] * $roww['price'];
                    ?>
                    <tr>
                        <td class="text-center"><?php echo $i++ ?></td>
                        <td><?php echo $row['date_created'] ?></td>
                        <td>
                            <p class="m-0"><?php echo $roww['name']." - ".$roww['variant'] ?></p>
                            <p class="m-0"><small>Nhãn hiệu: <?php echo $roww['bname'] ?></small></p>
                            <p class="m-0"><small>Danh mục: <?php echo $roww['category'] ?></small></p>
                        </td>
                        <td>
                            <p class="m-0"><?php echo $roww['name'] ?></p>
                            <p class="m-0"><small>Email: <?php echo $roww['email'] ?></small></p>
                        </td>
                        <td class=""><?php echo strtoupper($roww['payment_method']) ?></td>
                        <td class="text-center"><?php echo format_num($roww['price']) ?></td>
                        <td class="text-center"><?php echo format_num($roww['quantity']) ?></td>
                        <td class="text-right"><?php echo format_num($roww['quantity'] * $roww['price']) ?> đ</td>
                    </tr>
                    <?php endwhile; ?>
                    <?php endwhile; ?>
                    <?php if($qry->num_rows <= 0): ?>
                    <tr>
                        <td class="text-center" colspan="8">Không có dữ liệu...</td>
                    </tr>
                    <?php endif; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="7" class="font-weight-bold text-center">TỔNG DOANH THU</th>
                        <th class="text-right font-weight-bold"><?= format_num($gtotal) ?> đ</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<noscript>
    <style>
        .m-0{
            margin:0;
        }
        .text-center{
            text-align:center;
        }
        .text-right{
            text-align:right;
        }
        .table{
            border-collapse:collapse;
            width: 100%
        }
        .table tr,.table td,.table th{
            border:1px solid gray;
        }
    </style>
</noscript>
<script>
    $(function(){
        $('table th, table td').addClass("px-1 py-2 align-middle")
        $('#filter-form').submit(function(e){
            e.preventDefault()
            location.href = "./?page=sales&date_start="+$('[name="date_start"]').val()+"&date_end="+$('[name="date_end"]').val()
        })

        $('#printBTN').click(function(){
            var head = $('head').clone();
            var rep = $('#printable').clone();
            var ns = $('noscript').clone().html();
            start_loader()
            rep.prepend(ns)
            rep.prepend(head)
            rep.find('#print_header').show()
            var nw = window.document.open('','_blank','width=900,height=600')
                nw.document.write(rep.html())
                nw.document.close()
                setTimeout(function(){
                    nw.print()
                    setTimeout(function(){
                        nw.close()
                        end_loader()
                    },200)
                },300)
        })
    })
</script>