class CustomEquipment extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'clearEquipment'
    )
  }

  clearEquipment() {
    $.ajax({
      method: 'patch',
      url: 'session_equipment',
      dataType: 'json',
      data: { equipment: {} },
      success: (data) => {
        this.props.setEquipment({});
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  axeEquipment(e) {
    let equipment = _.clone(this.props.equipment);
    delete equipment[e.id];
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

  clearButton() {
    return (
      <div className="btn btn-xs btn-primary btn-pnw" onClick={this.clearEquipment}>clear all</div>
    );
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

  axeButton(e) {
    return (
      <span className="btn btn-xs btn-danger pull-right"
      onClick={this.axeEquipment.bind(this, e)}>
        <i className="fa fa-ban" aria-hidden="true"></i>
      </span>
    );
  }

  equipment() {
    let list = [];
    for (var k in this.props.equipment) {
      list.push(
        <div className="row equipment-row" key={`eq-${k}`}>
          <div className="equipment-check pull-left">
            {this.checkedButton(this.props.equipment[k])}
          </div>
          {this.props.equipmentItem(this.props.equipment[k], 'equipment-12')}
          <div className="equipment-check pull-left">
            {this.axeButton(this.props.equipment[k])}
          </div>
        </div>
      );
    }
    return list;
  }


  render() {
    return (
      <div>
        {this.clearButton()}
        {this.equipment()}
      </div>
    );
  }

}

window.CustomEquipment = CustomEquipment;
