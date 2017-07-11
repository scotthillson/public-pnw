class EquipmentBar extends ViewComponent {

  teamButtonClass(team) {
    if (this.props.team.id == team.id ) {
      return('btn btn-xs btn-primary');
    }
    return('btn btn-xs btn-default');
  }

  printButtonClass() {
    if (this.props.print) {
      return('btn btn-xs btn-primary');
    }
    return('btn btn-xs btn-default');
  }

  detailButtonClass() {
    if (this.props.detail == 'long description') {
      return('btn btn-xs btn-primary');
    }
    return('btn btn-xs btn-default')
  }

  customButtonClass() {
    if (this.props.team.local_name == 'custom') {
      return('btn btn-xs btn-primary');
    }
    return('btn btn-xs btn-default');
  }

  customButton() {
    if (this.props.role) {
      return (
        <div
          className="btn btn-xs btn-primary"
          onClick={this.props.newCustom}>
          personal item
        </div>
      );
    }
  }

  teams(){
    let buts = [
      <div
        key="custom"
        className={this.customButtonClass()}
        onClick={this.props.setTeam.bind(this, { id: 0, local_name: 'custom' })}>
        custom
      </div>
    ];
    if (this.props.role) {
      buts.unshift(
        <div
          key="personal"
          className="btn btn-xs btn-default"
          onClick={this.props.setTeam.bind(this,'personal')}>
          personal
        </div>
      )
    }
    for (var team of this.props.teams) {
      if (_.map(this.props.categories, 'team_id').includes(String(team.id))) {
        let name = team.name;
        if (team.local_name) {
          name = team.local_name
        }
        buts.push(
          <div
            key={`team-${team.id}`}
            className={this.teamButtonClass(team)}
            onClick={this.props.setTeam.bind(this, team)}>
            {name}
          </div>
        );
      }
    }
    buts.push(
      <div
        key="team-print"
        className={this.printButtonClass()}
        onClick={this.props.setPrint}>
        print
      </div>
    );
    buts.push(
      <div
        key="detail"
        className={this.detailButtonClass()}
        onClick={this.props.setDetail}>
        long description
      </div>
    );
    return buts;
  }

  adminButtons() {
    if (this.props.role == 'admin' || this.props.role == 'advanced') {
      return (
        <span>
          <div
            className="btn btn-xs btn-success"
            onClick={this.props.newEquipment}>
            new item
          </div>
          <div
            className="btn btn-xs btn-primary"
            onClick={this.props.newCategory}>
            new category
          </div>
          <a
            className="btn btn-xs btn-info"
            href="/groups">
            manage groups
          </a>
        </span>
      );
    }
  }

  render() {
    return (
      <div className="row">
        <div className="btn-toolbar pull-left">
          {this.customButton()}
          {this.adminButtons()}
        </div>
        <div className="btn-toolbar pull-right">
          {this.teams()}
        </div>
      </div>
    );
  }

}

window.EquipmentBar = EquipmentBar;
