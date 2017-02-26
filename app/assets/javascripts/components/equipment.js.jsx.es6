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
      'print'
    );
    this.state = {
      categories: [],
      category: null,
      checked: [],
      equipment: null,
      list: [],
      print: true,
      team: 46
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
        this.setState({ list: data.equipment, categories: data.categories });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  saveEquipment() {
    console.log(this.state.equipment);
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

  categories() {
    let categories = [];
    for (var category of this.state.categories) {
      categories.push(category);
    }
    return categories;
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
    console.log(e);
    this.setState({ equipment: e });
  }

  setTeam(t) {
    this.setState({ team: t });
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

  print() {
    if (this.state.print) {
      this.setState({ print: false });
    } else {
      this.setState({ print: true });
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
        />
      );
    }
    return (
      <EquipmentList
        advanced={this.props.advanced}
        categories={this.state.categories}
        checked={this.state.checked}
        checkEquipment={this.checkEquipment}
        editEquipment={this.editEquipment}
        list={this.state.list}
        print={this.state.print}
        team={this.state.team}
      />
    );
  }

  adminToolbar(){
    if (this.props.advanced) {
      return (
        <div className="row btn-toolbar">
          <div className="btn btn-xs btn-success" onClick={this.newEquipment}>new item</div>
          <div className="btn btn-xs btn-success" onClick={this.newCategory}>new category</div>
        </div>
      );
    }
  }

  render() {
    return (
      <div>
        {this.adminToolbar()}
        <div className="row btn-toolbar pull-right">
          <div className="btn btn-xs btn-default" onClick={this.setTeam.bind(this, 46)}>trt</div>
          <div className="btn btn-xs btn-default" onClick={this.setTeam.bind(this, 36)}>general</div>
          <div className="btn btn-xs btn-default" onClick={this.setTeam.bind(this, 41)}>rst</div>
          <div className="btn btn-xs btn-default" onClick={this.setTeam.bind(this, 35)}>mtb</div>
          <div className="btn btn-xs btn-default" onClick={this.print}>print</div>
        </div>
        {this.table()}
      </div>
    );
  }

}

window.Equipment = Equipment;
