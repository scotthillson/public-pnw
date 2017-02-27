class MemberRows extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'operational',
      'nonOperational',
      'onCall',
      'offCall',
      'everyone',
      'members',
      'loading'
    );
    this.state = {
      mode: {
        operational: true,
        onCall: true,
        everyone: false
      }
    };
  }

  member(member) {
    if (member.status_id == 1) {
      member.operational = true;
    }
    if (!this.state.mode.everyone) {
      if (this.state.mode.operational && !member.operational) {
        return null;
      }
      if (!this.state.mode.operational && member.operational) {
        return null;
      }
      if (this.state.mode.onCall && !member.on_call) {
        return null;
      }
      if (!this.state.mode.onCall && member.on_call) {
        return null;
      }
    }
    let onCall = member.duty_end;
    let operational = '';
    if (member.operational) {
      operational = <i className="fa fa-check" aria-hidden="true"></i>;
    }
    if (member.on_call && operational) {
      onCall = <i className="fa fa-check" aria-hidden="true"></i>;
    }
    return (
      <tr key={member.d4h_id}>
        <td>
          <a
            href={ `https://pnwsar.d4h.org/team/members/view/${member.d4h_id}` }
            target="_blank"
          >{ member.name }
          </a>
        </td>
        <td>{ member.mobile_phone }</td>
        <td>{ member.email }</td>
        <td>{ member.reference }</td>
        <td className="text-center">{ operational }</td>
        <td className="text-center">{ onCall }</td>
      </tr>
    );
  }

  members() {
    let members = [];
    for (var member of this.props.members) {
      if (this.member(member)){
        members.push(this.member(member));
      }
    }
    return members;
  }

  loading() {
    if (this.props.error) {
      return (
        <i className="fa fa-exclamation-triangle" aria-hidden="true" title="problems updating"></i>
      );
    }
    else if (this.props.loading) {
      return (
        <i className="fa fa-spinner fa-pulse fa-fw" title="checking for updates"></i>
      );
    }
    return (
      'On Call'
    );
  }

  operational() {
    let mode = _.clone(this.state.mode);
    mode.operational = true;
    mode.everyone = false;
    this.setState({ mode: mode }, this.members);
  }

  nonOperational() {
    let mode = _.clone(this.state.mode);
    mode.operational = false;
    mode.everyone = false;
    this.setState({ mode: mode }, this.members);
  }

  onCall() {
    let mode = _.clone(this.state.mode);
    mode.onCall = true;
    mode.everyone = false;
    this.setState({ mode: mode }, this.members);
  }

  offCall() {
    let mode = _.clone(this.state.mode);
    mode.onCall = false;
    mode.everyone = false;
    this.setState({ mode: mode }, this.members);
  }

  everyone() {
    let mode = _.clone(this.state.mode);
    mode.everyone = true;
    this.setState({ mode: mode }, this.members);
  }

  render() {
    return (
    <div>
      <MemberButtons
        mode={this.state.mode}
        operational={this.operational}
        nonOperational={this.nonOperational}
        onCall={this.onCall}
        offCall={this.offCall}
        everyone={this.everyone}
      />
      <table className="table">
        <thead>
          <tr>
            <th>{this.members().length}</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Position</th>
            <th className="text-center">Operational</th>
            <th className="text-center">{this.loading()}</th>
          </tr>
        </thead>
        <tbody>
          {this.members()}
        </tbody>
      </table>
    </div>
    );
  }
}

window.MemberRows = MemberRows;
