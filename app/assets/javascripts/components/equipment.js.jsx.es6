class Equipment extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'cancelCategory',
      'cancelEquipment',
      'destroy',
      'fieldChange',
      'newCategory',
      'newEquipment',
      'save',
      'showCategories',
      'showEquipment',
    );
    this.state = {
      categories: [],
      category: null,
      checked: [],
      equipment: null,
      list: [],
      showEquipment: true,
      showCategories: false
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
        this.setState({ list: data.equipment, categories: data.catagories });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  save() {
    let method = 'post';
    if (this.state.equipment.id) {
      method = 'patch';
    }
    $.ajax({
      method: method,
      url: '/equipment',
      dataType: 'json',
      data: this.state.equipment,
      success: (data) => {
        this.setState({ list: data.equipment, categories: data.catagories });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  destroy() {
    return true;
  }

  fieldChange(field, e){
    let equipment = _.clone(this.state.equipment);
    equipment[field] = e.target.value;
    this.setState({ equiment: equipment });
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
    this.setState({ equipment: {} });
  }

  cancelEquipment() {
    this.setState({ equipment: null });
  }

  showCategories() {
    this.setState({ showCategories: true, showEquipment: false });
  }

  newCategory() {
    this.setState({ category: {} });
  }

  cancelCategory() {
    this.setState({ category: null })
  }

  render() {
    if (this.state.equipment) {
      return( 
        <EquipmentForm
          equipment={this.state.equipment}
          cancel={this.cancelEquipment}
          categories={this.state.categories}
          destroy={this.destroy}
          fieldChange={this.fieldChange}
          save={this.save}
        />
      );
    }
    if (this.state.showCategories) {
      return (
        <Categories/>
      );
    }
    return (
      <div>
        <div className="row btn-toolbar">
          <div className="btn btn-xs btn-primary" onClick={this.showEquipment}>equipment</div>
          <div className="btn btn-xs btn-success" onClick={this.newEquipment}>new item</div>
          <div className="btn btn-xs btn-primary" onClick={this.showCategories}>categories</div>
          <div className="btn btn-xs btn-success" onClick={this.newCategory}>new category</div>
        </div>
        <table>
        </table>
      </div>
    );
  }

}

window.Equipment = Equipment;
