class Categories extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'destroy',
      'fieldChange',
      'save'
    );
    this.state = {
      categories: null,
      category: null
    };
  }

  componentDidMount() {
    this.loadCategories();
  }

  loadCategories() {
    $.ajax({
      method: 'GET',
      url: '/equipment_categories',
      dataType: 'json',
      success: (data) => {
        this.setState({ categories: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  save() {
    let method = 'post';
    if (this.state.category.id) {
      method = 'patch';
    }
    $.ajax({
      method: method,
      url: '/categories',
      dataType: 'json',
      data: this.state.category,
      success: (data) => {
        this.setState({ categories: data });
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
      categories.push(this.category(category));
    }
    return categories;
  }

  category(category){
    return (
      <tr>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    );
  }

  render() {
    if (this.props.category) {
      return( 
        <CategoryForm
          category={this.state.category}
          cancel={this.cancel}
          destroy={this.destroy}
          fieldChange={this.fieldChange}
          save={this.save}
        />
      );
    }
    return (
      <table>
        <thead>
        </thead>
        <tbody>
        </tbody>
      </table>
    );
  }

}

window.Categories = Categories;
