<label style="font-weight:bold;"><div class="modal fade" id="addfishcharges">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
      <div class="modal-header bg-secondary text-light">
        <h1 class="modal-title fs-5">New Fish Charges</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <form action="monthlycharges.php" method="post">
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">I.T.E</label>
            <select class="form-control inpv2 mb-2" name="ite">
              <option value="import">Import</option>
              <option value="export">Export</option>
              <option value="takeout">TakeOut</option>
              <option value="balance">Balance</option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Mc</label>
            <input type="number" name="mc" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">Kg</label>
            <input type="text" name="kg" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Cold Store Rate</label>
            <input type="text" name="coldstorerate" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">Labour Rate</label>
            <input type="text" name="labourrate" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Damage Kg</label>
            <input type="text" name="damagekg" class="form-control inpv2">
          </div>
          <div class="col mt-4">
            <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
            <button type="submit" name="addfishcharges" class="btn btn-success">Add</button>
          </div>
        </div>
      </div>
    </form>
    </div>
  </div>
</div>

<div class="modal fade" id="adddryfishcharges">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
      <div class="modal-header bg-secondary text-light">
        <h1 class="modal-title fs-5">New Dry Fish Charges</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <form action="monthlycharges.php" method="post">
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">I.T.E</label>
            <select class="form-control inpv2 mb-2" name="ite">
              <option value="import">Import</option>
              <option value="export">Export</option>
              <option value="takeout">Take Out</option>
              <option value="balance">Balance</option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Kg</label>
            <input type="text" name="kg" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">Cold Store Rate</label>
            <input type="text" name="drycoldstorerate" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Labour Rate</label>
            <input type="text" name="labourrate" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">Damage Kg</label>
            <input type="text" name="damagekg" class="form-control inpv2">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
        <button type="submit" name="adddryfishcharges" class="btn btn-success">Add</button>
      </div>
    </form>
    </div>
  </div>
</div>

<div class="modal fade" id="addrepackingout">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
      <div class="modal-header bg-secondary text-light">
        <h1 class="modal-title fs-5">New Dry Fish Charges</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <form action="monthlycharges.php" method="post">
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">Out Kg</label>
            <input type="text" name="outkg" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Rate</label>
            <input type="text" name="rate" class="form-control inpv2">
          </div>
          <div class="col mt-4">
            <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
            <button type="submit" name="addrepackingoutbtn" class="btn btn-success">Add</button>
          </div>
        </div>
      </div>
    </form>
    </div>
  </div>
</div>

<div class="modal fade" id="addtotal">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
      <div class="modal-header bg-secondary text-light">
        <h1 class="modal-title fs-5">New Dry Fish Charges</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <form action="monthlycharges.php" method="post">
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">Plug On Charges</label>
            <input type="number" name="plugoncharges" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label style="font-weight:bold;">Payment Date</label>
            <input type="number" name="payment_date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label style="font-weight:bold;">Payment Amount</label>
            <input type="number" name="payment_amount" class="form-control inpv2 mb-2">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
        <button type="submit" name="addtotalbtn" class="btn btn-success">Add</button>
      </div>
    </form>
    </div>
  </div>
</div>
