class EquipmentForm extends ViewComponent {

  categoryOptions() {
    let options = [];
    for (var category in this.props.categories) {
      options.push(<option value={category.id}>{category.category_name}</option>)
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
              value={this.props.equipment.equipment_category_id}
              onChange={this.props.fieldChange.bind(this, 'equipment_category_id')}
            >
              {this.categoryOptions()}
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
              onChange={this.props.fieldChange.bind(this, 'importance')}
            >
              <option>Required</option>
              <option>Recommended</option>
              <option>Optional</option>
            </select>
          </div>
          <div className="form-group">
            <label>Example Links</label>
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
              onClick={this.props.save}
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
              onClick={ this.props.destroy }
              />
          </div>
        </form>
      </div>
    );
  }

}

window.EquipmentForm = EquipmentForm;
