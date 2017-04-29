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
    let equipment = _.clone(this.props.sessionEquipment);
    delete equipment[e.id];
    $.ajax({
      method: 'patch',
      url: 'session_equipment',
      dataType: 'json',
      data: {equipment: equipment},
      success: (data) => {
        this.props.setEquipment(data.equipment);
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
    if (this.props.checked.includes(parseInt(e.id, 10))) {
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

  axeButton(e) {
    return (
      <span className="btn btn-xs btn-danger pull-right"
      onClick={this.axeEquipment.bind(this, e)}>
        <i className="fa fa-ban" aria-hidden="true"></i>
      </span>
    );
  }

  equipment() {
    if (this.props.print) {
      return (
        <PrintEquipment
          categories={this.props.categories}
          equipmentItem={this.props.equipmentItem}
          list={this.props.sessionEquipment}
          team={this.props.team}
        />
      );
    }
    let list = [];
    for (var k in this.props.sessionEquipment) {
      list.push(
        <div className="row equipment-row" key={`eq-${k}`}>
          <div className="equipment-check pull-left">
            {this.checkedButton(this.props.sessionEquipment[k])}
          </div>
          {this.props.equipmentItem(this.props.sessionEquipment[k], 'equipment-12')}
          <div className="equipment-check pull-left">
            {this.axeButton(this.props.sessionEquipment[k])}
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
