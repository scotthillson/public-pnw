class EquipmentList extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'addEquipment'
    )
  }

  addEquipment(e) {
    e.team_id = 0;
    let equipment = _.clone(this.props.equipment);
    equipment[e.id] = e;
    $.ajax({
      method: 'patch',
      url: 'session_equipment',
      dataType: 'json',
      data: {equipment: equipment},
      success: (data) => {
        this.props.setEquipment(data);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

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
    if (this.props.role == 'admin') {
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
    if (!this.props.equipment[e.id]){
      return (
        <div
          className="btn btn-xs btn-success btn-pnw"
          onClick={this.addEquipment.bind(this, e)}>
          add
        </div>
      );
    }
  }

  firstAid(c) {
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
                {this.props.equipmentItem(e, 'equipment-12')}
                <div className="equipment-2">
                  {this.editButton(e)}
                </div>
                <div className="equipment-2">
                  {this.addButton(e)}
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
