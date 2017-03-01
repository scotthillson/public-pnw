class EquipmentBar extends ViewComponent {

  teamButtonClass(team) {
    if (this.props.team == team.id ) {
      return('btn-primary');
    }
    return('btn-default');
  }

  printButtonClass() {
    if (this.props.print) {
      return('btn-primary');
    }
    return('btn-default');
  }

  detailButtonClass() {
    if (this.props.detail == 'long description') {
      return('btn-primary');
    }
    return('btn-default')
  }

  teams(){
    let buts = [];
    if (this.props.advanced) {
      for (var team of this.props.teams) {
        if (_.map(this.props.categories, 'team_id').includes(String(team.id))) {
          buts.push(
            <div
              key={`team-${team.id}`}
              className={`btn btn-xs ${this.teamButtonClass(team)}`}
              onClick={this.props.setTeam.bind(this, team.id)}>
              {team.name}
            </div>
          );
        }
      }
    }
    buts.push(
      <div
        key="team-print"
        className={`btn btn-xs ${this.printButtonClass()}`}
        onClick={this.props.setPrint}>print
      </div>
    );
    buts.push(
      <div
        key="detail"
        className={`btn btn-xs ${this.detailButtonClass()}`}
        onClick={this.props.setDetail}>long description
      </div>
    );
    return buts;
  }

  adminButtons() {
    if (this.props.advanced) {
      return (
        <div className="btn-toolbar pull-left">
          <div className="btn btn-xs btn-success" onClick={this.props.newEquipment}>new item</div>
          <div className="btn btn-xs btn-success" onClick={this.props.newCategory}>new category</div>
        </div>
      );
    }
  }

  render() {
    return (
      <div className="row">
        {this.adminButtons()}
        <div className="btn-toolbar pull-right">
          {this.teams()}
        </div>
      </div>
    );
  }

}

window.EquipmentBar = EquipmentBar;
