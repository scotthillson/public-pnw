class EquipmentList extends ViewComponent {

  checkedButton(e) {
    if (this.props.checked.includes(e.id)) {
      return (
        <div className="btn btn-xs btn-success btn-pnw" onClick={this.props.checkEquipment.bind(this, e)}>
        <i className="fa fa-check-circle-o" aria-hidden="true"></i>
      </div>
      );
    }
    return (
      <div className="btn btn-xs btn-primary btn-pnw" onClick={this.props.checkEquipment.bind(this, e)}>
        <i className="fa fa-circle-o" aria-hidden="true"></i>
      </div>
    );
  }

  editButton(e) {
    if (this.props.advanced) {
      return (
        <div
          className="btn btn-xs btn-warning btn-pnw"
          onClick={this.props.editEquipment.bind(this, e)}
          >edit
        </div>
      );
    }
  }

  addButton(e) {
    return (
      <div
        className="btn btn-xs btn-success btn-pnw"
        onClick={this.props.addEquipment.bind(this, e)}>
        add
      </div>
    );
  }

  firstAid(c) {
    console.log(this.props);
    if (c.display_name == 'First Aid Kit') {
      if (this.props.team.first_aid_kit)
       return true;
    }
  }

  equipment() {
    let list = [];
    for (var c of this.props.categories){
      if (c.team_id == this.props.team.id || this.firstAid(c)) {
        list.push (
          <div className="row equipment-row" key={`cat-${c.id}`}>
            <div className="equipment-12 text-center">
              {c.display_name}
            </div>
          </div>
        );
        for (var e of this.props.list) {
          if (e.equipment_category_id == c.id) {
            list.push (
              <div className="row equipment-row" key={`eq-${e.id}`}>
                <div className="equipment-check pull-left">
                  {this.checkedButton(e)}
                </div>
                {this.props.equipmentItem(e, 'equipment-12 pull-left')}
                <div className="equipment-2 pull-left">
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


  render() {
    return (
      <div>
        {this.equipment()}
      </div>
    );
  }

}

window.EquipmentList = EquipmentList;
