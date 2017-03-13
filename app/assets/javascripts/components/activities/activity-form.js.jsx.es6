class ActivityForm extends ViewComponent {

  save() {
    if (this.props.saving){
      return (
        <span className="pull-left">
          <i className="fa fa-spinner fa-pulse fa-fw" title="checking for updates"></i>
          <span>Saving</span>
        </span>
      );
    }
    return (
      <input
        className="btn btn-primary"
        value="Save"
        type="button"
        onClick={this.props.save}
      />
    );
  }

  render() {
    return(
      <div>
        <form className="text-center">
          <div className="form-group">
            <label>Title</label>
            <input
              className="form-control"
              type="text"
              value={this.props.activity.reference}
              onChange={this.props.fieldChange.bind(this, 'reference')}
            />
          </div>
          <div className="form-group">
            <label>Description</label>
            <textarea
              rows={10}
              className="form-control"
              value={this.props.activity.description}
              onChange={this.props.fieldChange.bind(this, 'description')}
            />
          </div>
          <div className="btn-toolbar">
            {this.save()}
            <input
              className="btn btn-warning"
              value="Cancel"
              type="button"
              onClick={this.props.cancel}
            />
            {this.props.destroyButton()}
          </div>
        </form>
      </div>
    );
  }

}

window.ActivityForm = ActivityForm;
