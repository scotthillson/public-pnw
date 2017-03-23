class Equipment extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'cancelCategory',
      'cancelEquipment',
      'checkEquipment',
      'editEquipment',
      'categoryChange',
      'equipmentChange',
      'loadEquipment',
      'newCategory',
      'newCustom',
      'newEquipment',
      'table',
      'setDetail',
      'setEquipment',
      'setPrint',
      'setTeam'
    );
    this.state = {
      categories: [],
      category: null,
      checked: [],
      detail: 'short description',
      equipment: {},
      list: [],
      newEquipment: null,
      print: false,
      teams: [],
      team: {}
    };
  }

  componentDidMount() {
    this.loadEquipment();
  }

  getTeam() {
    let name = location.hash.split('#')[1]
    if (!name) {
      name = 'general';
    }
    let team = _.find(this.state.teams, { local_name: name });
    if (!team) {
      team = _.find(this.state.teams, { local_name: 'general' });
    }
    this.setState({ team: team });
  }

  loadEquipment(){
    $.ajax({
      method: 'GET',
      url: '/equipment',
      dataType: 'json',
      success: (data) => {
        if (!data.session) {
          data.session = {};
        }
        for (var e of data.equipment) {
          if (e.quantity > 1) {
            e.name = `${e.quantity} x ${e.name}`
          }
        }
        this.setState(
          {
            list: data.equipment,
            categories: data.categories,
            equipment: data.session,
            teams: data.teams,
            category: null,
            newEquipment: null
          },
          this.getTeam
        );
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  setEquipment(equipment) {
    this.setState({ equipment: equipment })
  }

  categoryChange(field, e) {
    let category = _.clone(this.state.category);
    category[field] = e.target.value;
    this.setState({ category: category });
  }

  equipmentChange(field, e){
    let equipment = _.clone(this.state.newEquipment);
    equipment[field] = e.target.value;
    this.setState({ newEquipment: equipment });
  }

  newCustom() {
    this.setState(
      { custom: true,
        team: { local_name: 'custom' },
        equipment: {
          quantity: 1,
          equipment_category_id: null,
          importance: 'Personal'
        },
        category: null
      }
    );
  }

  newEquipment() {
    this.setState(
      {
        newEquipment: true,
        category: null
      }
    );
  }

  cancelEquipment() {
    this.setState({ newEquipment: false });
  }

  newCategory() {
    this.setState({ category: {}, newEquipment: null });
  }

  cancelCategory() {
    this.setState({ category: null })
  }

  editEquipment(e) {
    this.setState({ newEquipment: e });
  }

  checkEquipment(e) {
    let checked = _.clone(this.state.checked);
    if (checked.includes(e.id)) {
      _.pull(checked, e.id);
    } else {
      checked.push(e.id);
    }
    this.setState({ checked: checked });
  }

  setTeam(team) {
    location.hash = team.local_name;
    this.setState({ team: team });
  }

  setPrint() {
    if (this.state.print) {
      this.setState({ print: false });
    } else {
      this.setState({ print: true });
    }
  }

  setDetail() {
    if (this.state.detail == 'short description') {
      this.setState({ detail: 'long description' });
    } else {
      this.setState({ detail: 'short description' });
    }
  }

  table() {
    if (this.state.newEquipment) {
      return(
        <EquipmentForm
          cancel={this.cancelEquipment}
          categories={this.state.categories}
          fieldChange={this.equipmentChange}
          loadEquipment={this.loadEquipment}
          newEquipment={this.state.newEquipment}
        />
      );
    }
    if (this.state.category) {
      return(
        <CategoryForm
          newCategory={this.state.newCategory}
          cancel={this.cancelCategory}
          categories={this.state.categories}
          fieldChange={this.categoryChange}
          loadEquipment={this.loadEquipment}
          teams={this.state.teams}
        />
      );
    }
    return (
      <EquipmentLayout
        role={this.props.role}
        categories={this.state.categories}
        checked={this.state.checked}
        checkEquipment={this.checkEquipment}
        detail={this.state.detail}
        editEquipment={this.editEquipment}
        equipment={this.state.equipment}
        list={this.state.list}
        print={this.state.print}
        setEquipment={this.setEquipment}
        team={this.state.team}
      />
    );
  }

  toolbar(){
    return (
      <EquipmentBar
        role={this.props.role}
        categories={this.state.categories}
        custom={this.state.custom}
        detail={this.state.detail}
        newCategory={this.newCategory}
        newCustom={this.newCustom}
        newEquipment={this.newEquipment}
        print={this.state.print}
        setDetail={this.setDetail}
        setPrint={this.setPrint}
        setTeam={this.setTeam}
        teams={this.state.teams}
        team={this.state.team}
      />
    );
  }

  render() {
    return (
      <div>
        {this.toolbar()}
        {this.table()}
      </div>
    );
  }

}

window.Equipment = Equipment;
