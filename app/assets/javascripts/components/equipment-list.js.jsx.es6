class EquipmentList extends ViewComponent {

  checkedButton(e) {
    if (this.props.checked.includes(e.id)) {
      return (
        <div className="btn btn-xs btn-success" onClick={this.props.checkEquipment.bind(this, e)}>
        <i className="fa fa-check-circle-o" aria-hidden="true"></i>
      </div>
      );
    }
    return (
      <div className="btn btn-xs btn-primary" onClick={this.props.checkEquipment.bind(this, e)}>
        <i className="fa fa-circle-o" aria-hidden="true"></i>
      </div>
    );
  }

  editButton(e) {
    if (this.props.advanced) {
      return (
        <div
          className="btn btn-xs btn-warning"
          onClick={this.props.editEquipment.bind(this, e)}>
          edit
        </div>
      );
    }
  }

  equipment() {
    if (this.props.print){
      return (this.print());
    }
    let list = [];
    for (var c of this.props.categories){
      console.log(c);
      console.log(this.props.team);
      if (c.team_id == this.props.team || c.display_name == 'First Aid Kit') {
        list.push (
          <div className="row" key={`cat-${c.id}`}>
            <div className="col-md-12 text-center">
              {c.display_name}
            </div>
          </div>
        );
        for (var e of this.props.list) {
          if (e.equipment_category_id == c.id) {
            list.push (
              <div className="row" key={`eq-${e.id}`}>
                <div className="col-md-2">
                  {this.checkedButton(e)}
                </div>
                <div className={`col-md-8 btn btn-xs ${e.importance}`}>
                  {e.name}
                </div>
                <div className="col-md-2">
                  {this.editButton(e)}
                </div>
              </div>
            );
          }
        }
      }
    }
    return list;
  }

  print() {
    let list = [];
    let items = [];
    for (var c of this.props.categories){
      if (c.team_id == this.props.team || c.display_name == 'First Aid Kit') {
        list.push (
          <div className="row text-center equipment-row" key={`cat-${c.id}`}>
              <div className="equipment-12">
                {c.display_name}
              </div>
          </div>
        );
        items = [];
        for (var e of this.props.list) {
          if (e.equipment_category_id == c.id) {
            items.push(e);
          }
        }
        for (var e = 0; e < items.length; e += 2) {
          if (items[e+1]) {
            list.push(
              <div className="row text-center equipment-row" key={`eq-${items[e].id}`}>
                <div className={`equipment-6 ${items[e].importance}`}>
                  {items[e].name}
                </div>
                <div className={`equipment-6 ${items[e+1].importance}`}>
                  {items[e+1].name}
                </div>
              </div>
            );
          } else {
            list.push(
              <div className="row text-center equipment-row" key={`eq-${items[e].id}`}>
                <div className={`equipment-12 ${items[e].importance}`}>
                    {items[e].name}
                </div>
              </div>
            );
          }
        }
      }
    }
    return list;
  }

  key(){
    return (
      <div className="equipment-space">
        <div className="row">
          <div className="col-md-1 btn btn-xs Required equipment-key">
            required:
          </div>
          <div className="col-md-10">
            <p>item must be in your pack on all missions and trainings</p>
          </div>
        </div>
        <div className="row">
          <div className="col-md-1 btn btn-xs Recommended equipment-key">
            recommended:
          </div>
          <div className="col-md-10">
            <p>item will greatly enhance your effectiveness/ability as a searcher and should be considered as you advance</p>
          </div>
        </div>
        <div className="row">
          <div className="col-md-1 btn btn-xs Optional equipment-key">
            optional:
          </div>
          <div className="col-md-10">
            <p>item may be helpful in certain situations, may be helpful on certain missions, or may be required for qualified resources</p>
          </div>
        </div>
      </div>
    );
  }

  head() {
    return (
      <div className="row bottom-margin">
        <p>Cotton clothing may not be worn in the field from October through May. In the Pacific Northwest, hypothermia is a year-round threat. Thus, cotton is not recommended at any time of year, as it does not wick moisture from the skin, but rather, it holds moisture quite well. Do not wear it next to your skin. Good choices are synthetics (polyester) and wool or silk. These pull moisture from the skin so you stay drier and warmer.</p>
        <p>All clothing items in your pack should be weather appropriate. This should go without saying</p>
      </div>
    );
  }

  render() {
    return (
      <div className="equipment-space">
        {this.head()}
        {this.equipment()}
        {this.key()}
      </div>
    );
  }

}

window.EquipmentList = EquipmentList;
