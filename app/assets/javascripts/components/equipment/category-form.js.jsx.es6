class CategoryForm extends ViewComponent {

  teams() {
    let options = [];
    for (var team of this.props.teams) {
      options.push(<option key={team.id} value={team.id}>{team.name}</option>)
    }
    return options;
  }

  render() {
    return(
      <div>
        <form className="text-center">
          <div className="form-group">
            <label>Team</label>
            <select
              className="form-control"
              value={this.props.category.team_id}
              onChange={this.props.fieldChange.bind(this, 'team_id')}
            >
              {this.teams()}
            </select>
          </div>
          <div className="form-group">
            <label>Name</label>
            <input
              className="form-control"
              type="text"
              value={this.props.category.category_name}
              onChange={this.props.fieldChange.bind(this, 'category_name')}
            />
          </div>
          <div className="form-group">
            <label>Display Name</label>
            <input
              className="form-control"
              type="text"
              value={this.props.category.display_name}
              onChange={this.props.fieldChange.bind(this, 'display_name')}
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

window.CategoryForm = CategoryForm;
