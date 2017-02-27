class Categories extends ViewComponent {

  categories() {
    let categories = [];
    for (var category of this.props.categories) {
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
