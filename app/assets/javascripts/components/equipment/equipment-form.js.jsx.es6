class EquipmentForm extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'destroyEquipment',
      'saveEquipment'
    )
  }

  saveEquipment() {
    let method = 'post';
    let url = '/equipment';
    if (this.props.equipment.id) {
      method = 'patch';
      url = `/equipment/${this.props.equipment.id}`;
    }
    $.ajax({
      method: method,
      url: url,
      dataType: 'json',
      data: this.props.equipment,
      success: (data) => {
        this.props.loadEquipment();
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  destroyEquipment() {
    $.ajax({
      method: 'delete',
      url: `/equipment/${this.props.equipment.id}`,
      dataType: 'json',
      success: (data) => {
        this.props.loadEquipment();
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  categoryOptions() {
    if (!this.props.categories) {
      return;
    }
    let options = [];
    for (var category of this.props.categories) {
      options.push(<option key={category.id} value={category.id}>{category.category_name}</option>)
    }
    return options;
  }

  options() {
    console.log(this.props);
    if (this.props.custom == true) {
      return (
        <option value="Personal">Personal</option>
      );
    }
    return (
      [<option key="0" value="Required">Required</option>,
      <option key="1" value="Recommended">Recommended</option>,
      <option key="2" value="Optional">Optional</option>,
      <option key="3" value="Personal">Personal</option>]
    );
  }

  render() {
    console.log(this.props.equipment);
    return(
      <div>
        <form className="text-center">
          <div className="form-group">
            <label>Category</label>
            <select
              className="form-control"
              value={this.props.equipment.equipment_category_id}
              onChange={this.props.fieldChange.bind(this, 'equipment_category_id')}
            >
              {this.categoryOptions()}
            </select>
          </div>
          <div className="form-group">
            <label>Quantity</label>
            <select
              className="form-control"
              value={this.props.equipment.quantity}
              onChange={this.props.fieldChange.bind(this, 'quantity')}>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
            </select>
          </div>
          <div className="form-group">
            <label>Name</label>
            <input
              className="form-control"
              type="text"
              value={this.props.equipment.name}
              onChange={this.props.fieldChange.bind(this, 'name')}
            />
          </div>
          <div className="form-group">
            <label>Description</label>
            <input
              className="form-control"
              type="text"
              value={this.props.equipment.description}
              onChange={this.props.fieldChange.bind(this, 'description')}
            />
          </div>
          <div className="form-group">
            <label>Importance</label>
            <select
              className="form-control"
              value={this.props.equipment.importance}
              onChange={this.props.fieldChange.bind(this, 'importance')}>
              {this.options()}
            </select>
          </div>
          <div className="form-group">
            <label>Example Link</label>
            <input
              className="form-control"
              type="text"
              value={this.props.equipment.examples}
              onChange={this.props.fieldChange.bind(this, 'examples')}
            />
          </div>
          <div className="form-group">
            <label>Notes</label>
            <input
              className="form-control"
              type="text"
              value={this.props.equipment.notes}
              onChange={this.props.fieldChange.bind(this, 'notes')}
            />
          </div>
          <div className="btn-toolbar">
            <input
              className="btn btn-primary"
              value="Save"
              type="button"
              onClick={this.saveEquipment}
            />
            <input
              className="btn btn-warning"
              value="Cancel"
              type="button"
              onClick={this.props.cancel}
            />
              <input
              className="btn btn-danger"
              value="Delete"
              type="button"
              onClick={ this.destroyEquipment }
              />
          </div>
        </form>
      </div>
    );
  }

}

window.EquipmentForm = EquipmentForm;
