class GroupForm extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'firstAid'
    );
  }

  firstAid() {
    if (this.props.group.first_aid_kit) {
      this.props.fieldChange('first_aid_kit', { target: { value: false } });
    } else {
      this.props.fieldChange('first_aid_kit', { target: { value: true } });
    }
  }

  firstAidButton() {
    let check = <i className="fa fa-check"></i>;
    let btnClass = 'btn-danger';
    let text = "Don't include Team First Aid Kit"
    if (this.props.group.first_aid_kit) {
      text = "Include Team First Aid Kit"
      check = <i className="fa fa-check"></i>;
      btnClass = 'btn-success';
    }
    return (
      <div className={`btn ${btnClass}`} onClick={this.firstAid}>
        {check}
        {text}
      </div>
    );
  }

  render() {
    return(
      <div>
        <form className="text-center">
          <h4>{this.props.group.name}</h4>
          <div className="form-group">
            <label>Local Name</label>
            <input
              className="form-control"
              type="text"
              value={this.props.group.local_name}
              onChange={this.props.fieldChange.bind(this, 'local_name')}
            />
          </div>
          <div className="form-group">
            <label>Equipment Note</label>
            <textarea
              className="form-control"
              value={this.props.group.equipment_note}
              onChange={this.props.fieldChange.bind(this, 'equipment_note')}
            />
          </div>
          <div className="btn-toolbar">
            {this.firstAidButton()}
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
