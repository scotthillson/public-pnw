class Equipment extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'cancelCategory',
      'cancelEquipment',
      'destroyCategory',
      'destroyEquipment',
      'categoryChange',
      'equipmentChange',
      'newCategory',
      'newEquipment',
      'saveCategory',
      'saveEquipment',
      'showCategories',
      'showEquipment',
      'table'
    );
    this.state = {
      categories: [],
      category: null,
      checked: [],
      equipment: null,
      list: [],
      showEquipment: true,
      showCategories: false,
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

  showEquipment() {
    this.setState({ showCategories: false, showEquipment: true });
  }

  newEquipment() {
    this.setState({ equipment: { quantity: 1, equipment_category_id: this.state.categories[0].id }, category: null });
  }

  cancelEquipment() {
    this.setState({ equipment: null });
  }

  showCategories() {
    this.setState({ showCategories: true, showEquipment: false });
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

  checkedButton(e) {
    if (this.state.checked.includes(e.id)) {
      return (
        <div className="btn btn-xs btn-success" onClick={this.checkEquipment.bind(this, e)}>
        <i className="fa fa-check-circle-o" aria-hidden="true"></i>
      </div>
      );
    }
    return (
      <div className="btn btn-xs btn-primary" onClick={this.checkEquipment.bind(this, e)}>
        <i className="fa fa-circle-o" aria-hidden="true"></i>
      </div>
    );
  }

  equipment() {
    let list = [];
    for (var c of this.state.categories){
      if (c.team_id == this.state.team) {
        list.push (
          <tr key={`cat-${c.id}`}>
            <td>{c.display_name}</td>
            <td></td>
            <td></td>
          </tr>
        );
        for (var e of this.state.list) {
          if (e.equipment_category_id == c.id) {
            list.push (
              <tr key={`eq-${e.id}`}>
                <td>
                  {this.checkedButton(e)}
                </td>
                <td>{e.name}</td>
                <td>
                  <div
                    className="btn btn-xs btn-warning"
                    onClick={this.editEquipment.bind(this, e)}>edit
                  </div>
                </td>
              </tr>
            );
          }
        }
      }
    }
    return list;
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
    if (this.state.showCategories) {
      return (
        <Categories/>
      );
    }
    return (
      <table className="table">
        <thead>
          <tr>
            <th></th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {this.equipment()}
        </tbody>
      </table>
    );
  }

  render() {
    return (
      <div>
        <div className="row btn-toolbar">
          <div className="btn btn-xs btn-primary" onClick={this.showEquipment}>equipment</div>
          <div className="btn btn-xs btn-success" onClick={this.newEquipment}>new item</div>
          <div className="btn btn-xs btn-primary" onClick={this.showCategories}>categories</div>
          <div className="btn btn-xs btn-success" onClick={this.newCategory}>new category</div>
        </div>
        <div className="row btn-toolbar pull-right">
          <div className="btn btn-xs btn-default" onClick={this.setTeam.bind(this, 46)}>trt</div>
          <div className="btn btn-xs btn-default" onClick={this.setTeam.bind(this, 36)}>general</div>
          <div className="btn btn-xs btn-default" onClick={this.setTeam.bind(this, 41)}>rst</div>
          <div className="btn btn-xs btn-default" onClick={this.setTeam.bind(this, 35)}>mtb</div>
        </div>
        {this.table()}
      </div>
    );
  }

}

window.Equipment = Equipment;
