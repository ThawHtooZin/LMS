<div class="modal fade" id="addpayment<?php echo $totaldata['id']; ?>">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
      <div class="modal-header bg-secondary text-light">
        <h1 class="modal-title fs-5">Add Payment</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <form action="monthlycharges.php" method="post">
      <input type="hidden" name="id" value="<?php echo $totaldata['id']; ?>">
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label>Payment Date</label>
            <input type="date" name="payment_date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>Payment Amount</label>
            <input type="number" name="payment_amount" class="form-control inpv2 mb-2">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
        <button type="submit" name="addpaymentbtn" class="btn btn-success">Add</button>
      </div>
    </form>
    </div>
  </div>
</div>
