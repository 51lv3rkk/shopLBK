<?php

require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `categories` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<style>
    #uni_modal .modal-footer{
        display:none !important;
    }
</style>
<div class="container-fluid">
    <dl>
        <dt class="muted">Tên danh mục</dt>
        <dd class="pl-4"><?= isset($category) ? $category : "" ?></dd>
        <dt class="muted">Mô tả</dt>
        <dd class="pl-4"><?= isset($description) ? $description : "" ?></dd>
        <dt class="muted">Trạng thái</dt>
        <dd class="pl-4">
            <?php if($status == 1): ?>
                <span class="badge badge-success px-3 rounded-pill">Hoạt động</span>
            <?php else: ?>
                <span class="badge badge-danger px-3 rounded-pill">Không hoạt động</span>
            <?php endif; ?>
        </dd>
    </dl>
    <div class="clear-fix mb-3"></div>
    <div class="text-right">
        <button class="btn btn-dark btn-flat btn-sm" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Đóng</button>
    </div>
</div>