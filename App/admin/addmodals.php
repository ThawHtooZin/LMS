<!-- Monthly Charges Modals -->
<label><div class="modal fade" id="addfishcharges">
  <div class="modal-dialog">
    <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
      <div class="modal-header bg-secondary text-light">
        <h1 class="modal-title fs-5">New Fish Charges</h1>
      </div>
    <form action="monthlycharges.php" method="post">
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label>Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>I.T.E</label>
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
            <label>Mc</label>
            <input type="number" name="mc" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>Kg</label>
            <input type="text" name="kg" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label>Cold Store Rate</label>
            <input type="text" name="coldstorerate" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>Labour Rate</label>
            <input type="text" name="labourrate" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label>Damage Kg</label>
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
            <label>Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>I.T.E</label>
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
            <label>Kg</label>
            <input type="text" name="kg" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>Cold Store Rate</label>
            <input type="text" name="drycoldstorerate" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label>Labour Rate</label>
            <input type="text" name="labourrate" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>Damage Kg</label>
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
        <h1 class="modal-title fs-5">Add Packing Out</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <form action="monthlycharges.php" method="post">
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label>Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>Out Kg</label>
            <input type="text" name="outkg" class="form-control inpv2 mb-2">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label>Rate</label>
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
        <h1 class="modal-title fs-5">Add Total Amount</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <form action="monthlycharges.php" method="post">
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label>Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>Plug On Charges</label>
            <input type="number" name="plugoncharges" class="form-control inpv2 mb-2">
          </div>
        </div>
        <!-- <div class="row">
          <div class="col">
            <label>Payment Date</label>
            <input type="date" name="payment_date" class="form-control inpv2 mb-2">
          </div>
          <div class="col">
            <label>Payment Amount</label>
            <input type="number" name="payment_amount" class="form-control inpv2 mb-2">
          </div>
        </div> -->
      </div>
      <div class="modal-footer">
        <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
        <button type="submit" name="addtotalbtn" class="btn btn-success">Add</button>
      </div>
    </form>
    </div>
  </div>
</div>

<!-- Monthly Charges Modals -->

<!-- Container Modals -->

<div class="modal fade" id="addpackingmaterialcosting" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width: 850px; !important; margin-top:70px !important;">
      <div class="modal-header bg-secondary text-light">
        <h5 class="modal-title">Packing Material Costing</h5>
        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="h3">&times;</span>
        </button>
      </div>
      <form action="" method="post" autocomplete="off">
        <div class="modal-body">
          <div class="row">
            <div class="col">
              <label>Commondity</label>
              <select class="form-control inpv2 mb-2" name="commondity">
              <?php
              $commonditydatas = $query->selectall('item');
              foreach ($commonditydatas as $commonditydata) {

               ?>
                <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
              <?php
              }
               ?>
             </select>
            </div>
            <div class="col">
              <label>Fish Size</label>
              <input type="text" name="fish_size" class="form-control inpv2 mb-2">
            </div>
            <div class="col">
              <label>Plastic Costing</label>
              <input type="text" name="plastic" class="form-control inpv2 mb-2" value="2450">
            </div>
          </div>
          <div class="row">
            <div class="col">
              <label>JCV Cost</label>
              <input type="text" name="jcv" class="form-control inpv2 mb-2" value="18.099">
            </div>
            <div class="col">
              <label>Inner Box</label>
              <input type="text" name="inner_box" class="form-control inpv2 mb-2" value="">
            </div>
            <div class="col">
              <label>Sticker Cost</label>
              <input type="text" name="sticker" class="form-control inpv2 mb-2" value="35">
            </div>
          </div>
          <div class="row">
            <div class="col">
              <label>MC Plastic Cost</label>
              <input type="text" name="mc_plastic" class="form-control inpv2 mb-2" value="2450">
            </div>
            <div class="col">
              <label>Carton Box Cost</label>
              <input type="text" name="carton_box" class="form-control inpv2 mb-2" value="1440">
            </div>
            <div class="col">
              <label>Tape Cost</label>
              <input type="number" name="tape" class="form-control inpv2 mb-2" value="4600">
            </div>
          </div>
          <div class="row">
            <div class="col">
              <label>Penon Cost</label>
              <input type="number" name="penon" class="form-control inpv2 mb-2" value="310">
            </div>
            <div class="col">
              <label>P-Sticker Cost</label>
              <input type="number" name="p_sticker" class="form-control inpv2 mb-2" value="75">
            </div>
            <div class="col">
              <label>Plastic Rope Cost</label>
              <input type="text" name="plastic_rope" class="form-control inpv2 mb-2" value="6400">
            </div>
          </div>
          <div class="row">
            <div class="col">
              <label>Micellion Cost</label>
              <input type="number" name="micellion" class="form-control inpv2 mb-2" value="50">
            </div>
            <div class="col">
              <label>Processing Cost</label>
              <input type="number" name="processing" class="form-control inpv2 mb-2" value="350">
            </div>
            <div class="col">
              <label>Plastic Size</label>
              <input type="text" name="plastic_size" class="form-control inpv2 mb-2">
            </div>
          </div>
          <div class="row">
            <div class="col">
              <label>Pcs Per Lb</label>
              <input type="number" name="pcsperlb" class="form-control inpv2 mb-2">
            </div>
            <div class="col">
              <label>Pcs Per MC</label>
              <input type="number" name="pcspermc" class="form-control inpv2 mb-2">
            </div>
            <div class="col">
              <label>Today Dollor Price</label>
              <input type="text" name="tdydollorprice" class="form-control inpv2 mb-2">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
          <button type="submit" name="addpackingmaterialbtn" class="btn btn-success">Add</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Container Modals -->

<!-- Add Opening Amount Modal -->

<div class="modal fade" id="addopening">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-secondary text-light">
        <h1 class="modal-title fs-5">Add Opening Amount</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <form action="monthlycharges.php" method="post">
      <div class="modal-body">
        <label>Opening Amount</label>
        <input type="number" name="openingamount" class="form-control inpv2">
      </div>
      <div class="modal-footer">
        <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
        <button type="submit" name="addopeningamountbtn" class="btn btn-success">Add</button>
      </div>
    </form>
    </div>
  </div>
</div>

<!-- Add Opening Amount Modal -->
