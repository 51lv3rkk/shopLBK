<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">Danh sách nhãn hiệu</h3>
		<div class="card-tools">
			<a href="javascript:void(0)" id="create_new" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Thêm nhãn hiệu mới</a>
		</div>
	</div>
	<div class="card-body">
        <div class="container-fluid">
			<table class="table table-hover table-striped" id="list">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="20%">
					<col width="35%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>#</th>
						<th>Thời gian tạo</th>
						<th>Tên nhãn hiệu</th>
						<th>Mô tả</th>
						<th>Trạng thái</th>
						<th>Hành dộng</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
						$qry = $conn->query("SELECT * from `brands` where delete_flag = 0 order by `name` asc ");
						while($row = $qry->fetch_assoc()):
                            $row['description'] = strip_tags(stripslashes(html_entity_decode($row['description'])));
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
							<td><?php echo $row['name'] ?></td>
							<td ><p class="truncate-1 m-0"><?php echo $row['description'] ?></p></td>
							<td class="text-center">
                                <?php if($row['status'] == 1): ?>
                                    <span class="badge badge-success px-3 rounded-pill">Hoạt động</span>
                                <?php else: ?>
                                    <span class="badge badge-danger px-3 rounded-pill">Không hoạt động</span>
                                <?php endif; ?>
                            </td>
							<td align="center">
								 <button type="button" class="btn btn-flat p-1 btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Lựa chọn
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item view_data" href=javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> Xem chi tiết</a>
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item edit_data" href=javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Sửa</a>
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Xoá</a>
				                  </div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Bạn có chắc muốn xoá nhãn hiệu này?","delete_brand",[$(this).attr('data-id')])
		})
		$('#create_new').click(function(){
			uni_modal("<i class='fa fa-plus'></i> Thêm nhãn hiệu","maintenance/manage_brand.php")
		})
		$('.view_data').click(function(){
			uni_modal("<i class='fa fa-eye'></i>  Chi tiết nhãn hiệu","maintenance/view_brand.php?id="+$(this).attr('data-id'))
		})
		$('.edit_data').click(function(){
			uni_modal("<i class='fa fa-edit'></i> Cập nhật nhãn hiệu","maintenance/manage_brand.php?id="+$(this).attr('data-id'))
		})
		$('.table').dataTable({
			columnDefs: [
					{ orderable: false, targets: [4,5] }
			],
			order:[0,'asc']
		});
		$('.dataTable td,.dataTable th').addClass('py-1 px-2 align-middle')
	})
	function delete_brand($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_brand",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("Có lỗi xảy ra, vui lòng thử lại.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("Có lỗi xảy ra, vui lòng thử lại.",'error');
					end_loader();
				}
			}
		})
	}
</script>