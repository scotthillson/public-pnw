class GroupForm extends ViewComponent {

  render() {
    return(
      <div>
        <form className="text-center">
          <h4>{this.props.group.name}</h4>
          <div className="form-group">
            <label>Name</label>
            <input
              className="form-control"
              type="text"
              value={this.props.group.local_name}
              onChange={this.props.fieldChange.bind(this, 'local_name')}
            />
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

window.GroupForm = GroupForm;
