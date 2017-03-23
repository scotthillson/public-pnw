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
    if (this.props.newEquipment.id) {
      method = 'patch';
      url = `/equipment/${this.props.newEquipment.id}`;
    }
    $.ajax({
      method: method,
      url: url,
      dataType: 'json',
      data: this.props.newEquipment,
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
      url: `/equipment/${this.props.newEquipment.id}`,
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

  render() {
    return(
      <div>
        <form className="text-center">
          <div className="form-group">
            <label>Category</label>
            <select
              className="form-control"
              value={this.props.newEquipment.equipment_category_id}
              onChange={this.props.fieldChange.bind(this, 'equipment_category_id')}
            >
              {this.categoryOptions()}
            </select>
          </div>
          <div className="form-group">
            <label>Quantity</label>
            <select
              className="form-control"
              value={this.props.newEquipment.quantity}
              onChange={this.props.fieldChange.bind(this, 'quantity')}>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
            </select>
          </div>
          <div className="form-group">
            <label>Name</label>
            <input
              className="form-control"
              type="text"
              value={this.props.newEquipment.name}
              onChange={this.props.fieldChange.bind(this, 'name')}
            />
          </div>
          <div className="form-group">
            <label>Description</label>
            <input
              className="form-control"
              type="text"
              value={this.props.newEquipment.description}
              onChange={this.props.fieldChange.bind(this, 'description')}
            />
          </div>
          <div className="form-group">
            <label>Importance</label>
            <select
              className="form-control"
              value={this.props.newEquipment.importance}
              onChange={this.props.fieldChange.bind(this, 'importance')}
            >
              <option>Required</option>
              <option>Recommended</option>
              <option>Optional</option>
              <option>Personal</option>
            </select>
          </div>
          <div className="form-group">
            <label>Example Link</label>
            <input
              className="form-control"
              type="text"
              value={this.props.newEquipment.examples}
              onChange={this.props.fieldChange.bind(this, 'examples')}
            />
          </div>
          <div className="form-group">
            <label>Notes</label>
            <input
              className="form-control"
              type="text"
              value={this.props.newEquipment.notes}
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
