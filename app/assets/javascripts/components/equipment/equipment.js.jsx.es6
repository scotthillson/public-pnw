class Equipment extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'cancelCategory',
      'cancelEquipment',
      'checkEquipment',
      'destroyCategory',
      'destroyEquipment',
      'editEquipment',
      'categoryChange',
      'equipmentChange',
      'newCategory',
      'newEquipment',
      'saveCategory',
      'saveEquipment',
      'table',
      'setCustom',
      'setDetail',
      'setPrint',
      'setTeam'
    );
    this.state = {
      categories: [],
      category: null,
      checked: [],
      custom: false,
      detail: 'short description',
      equipment: null,
      list: [],
      print: false,
      teams: [],
      team: 36
    };
  }

  componentDidMount() {
    this.loadEquipment();
  }

  loadEquipment(){
    $.ajax({
      method: 'GET',
      url: '/equipment',
      dataType: 'json',
      success: (data) => {
        for (var e of data.equipment) {
          if (e.quantity > 1) {
            e.name = `${e.quantity} x ${e.name}`
          }
        }
        this.setState({ list: data.equipment, categories: data.categories, teams: data.teams });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  saveEquipment() {
    let method = 'post';
    let url = '/equipment';
    if (this.state.equipment.id) {
      method = 'patch';
      url = `/equipment/${this.state.equipment.id}`;
    }
    $.ajax({
      method: method,
      url: url,
      dataType: 'json',
      data: this.state.equipment,
      success: (data) => {
        this.setState({ equipment: null }, this.loadEquipment);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  addEquipment(e) {
    $.ajax({
      method: 'patch',
      url: 'session_equipment',
      dataType: 'json',
      data: { equipment: e },
      success: (data) => {
        console.log(data);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  destroyEquipment() {
    $.ajax({
      method: 'delete',
      url: `/equipment/${this.state.equipment.id}`,
      dataType: 'json',
      success: (data) => {
        this.setState({ equipment: null }, this.loadEquipment);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  saveCategory() {
    let method = 'post';
    let url = '/equipment_categories';
    if (this.state.category.id) {
      method = 'patch';
      url = `/equipment_categories/${this.state.category.id}`
    }
    $.ajax({
      method: method,
      url: url,
      dataType: 'json',
      data: this.state.category,
      success: (data) => {
        this.setState({ category: null }, this.loadEquipment);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  destroyCategory() {
    $.ajax({
      method: 'delete',
      url: `/equipment_categories/${this.state.category.id}`,
      dataType: 'json',
      success: (data) => {
        this.setState({ category: null }, this.loadEquipment);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  categoryChange(field, e) {
    let category = _.clone(this.state.category);
    category[field] = e.target.value;
    this.setState({ category: category });
  }

  equipmentChange(field, e){
    let equipment = _.clone(this.state.equipment);
    equipment[field] = e.target.value;
    this.setState({ equipment: equipment });
  }

  newEquipment() {
    this.setState(
      { equipment: {
        quantity: 1,
        equipment_category_id: this.state.categories[0].id,
        importance: 'Required'
        },
        category: null
      }
    );
  }

  cancelEquipment() {
    this.setState({ equipment: null });
  }

  newCategory() {
    this.setState({ category: {}, equipment: null });
  }

  cancelCategory() {
    this.setState({ category: null })
  }

  editEquipment(e) {
    this.setState({ equipment: e });
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

  setTeam(t) {
    this.setState({ team: t });
  }

  setCustom() {
    if (this.state.custom) {
      this.setState({ custom: false });
    } else {
      this.setState({ custom: true });
    }
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
    if (this.state.equipment) {
      return(
        <EquipmentForm
          equipment={this.state.equipment}
          cancel={this.cancelEquipment}
          categories={this.state.categories}
          destroy={this.destroyEquipment}
          fieldChange={this.equipmentChange}
          save={this.saveEquipment}
        />
      );
    }
    if (this.state.category) {
      return(
        <CategoryForm
          category={this.state.category}
          cancel={this.cancelCategory}
          categories={this.state.categories}
          destroy={this.destroyCategory}
          fieldChange={this.categoryChange}
          save={this.saveCategory}
          teams={this.state.teams}
        />
      );
    }
    return (
      <EquipmentList
        addEquipment={this.addEquipment}
        advanced={this.props.advanced}
        categories={this.state.categories}
        checked={this.state.checked}
        checkEquipment={this.checkEquipment}
        detail={this.state.detail}
        editEquipment={this.editEquipment}
        list={this.state.list}
        print={this.state.print}
        team={this.state.team}
      />
    );
  }

  toolbar(){
    return (
      <EquipmentBar
        advanced={this.props.advanced}
        categories={this.state.categories}
        detail={this.state.detail}
        newCategory={this.newCategory}
        newEquipment={this.newEquipment}
        print={this.state.print}
        setCustom={this.setCustom}
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
