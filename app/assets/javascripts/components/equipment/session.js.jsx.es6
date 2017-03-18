class SessionEquipment extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'cancelCategory',
      'cancelEquipment',
      'checkEquipment',
      'destroyCategory',
      'destroyEquipment',
      'editEquipment'
    );
    this.state = {
      equipment: []
    };
  }

  componentDidMount() {
    this.loadEquipment();
  }

  loadEquipment(){
    $.ajax({
      method: 'get',
      url: '/session_equipment',
      dataType: 'json',
      success: (data) => {
        this.setState({ equipment: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  editEquipment() {
    $.ajax({
      method: 'patch',
      url: 'session_equipment',
      dataType: 'json',
      data: { equipment: this.state.equipment },
      success: (data) => {
        this.setState({ equipment: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  addEquipment(e) {
    let newEquipment = _.clone(this.state_equipment);
    newEquipment.push(e);
    this.setState({ equipment: newEquipment }, this.editEquipment);
  }

  removeEquipment(e) {
    let newEquipment = _.clone(this.state_equipment);
    _.remove(newEquipment, { id: e.id })
    this.setState({ equipment: newEquipment }, this.editEquipment);
  }

  checkEquipment(e) {
    let newEquipment = _.clone(this.state.equipment);
    let equipment = _.find(newEquipment, { id: e.id })
    if (equipment.checked) {
      equipment.checked = false;
    } else {
      equipment.checked = true;
    }
    this.setState({ equipment: newEquipment }, this.editEquipment);
  }

  render() {
    return (
      <EquipmentList
        addEquipment={this.addEquipment}
        equipment={this.state.equipment}
        removeEquipment={this.removeEquipment}
      />
    );
  }

}

window.SessionEquipment = SessionEquipment;
