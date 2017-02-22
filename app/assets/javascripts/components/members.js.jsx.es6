class Members extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'operational',
      'nonOperational',
      'onCall',
      'offCall',
      'everyone'
    );
    this.state = {
      mode: {
        operational: true,
        onCall: true,
        everyone: false
      },
      members: [],
      loading: true,
      error: false
    };
  }

  componentDidMount() {
    this.loadMembers();
  }

  loadMembers() {
    $.ajax({
      method: 'get',
      url: '/members',
      dataType: 'json',
      success: (data) => {
        this.setState({ members: data }, this.updateMembers);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  updateMembers() {
    $.ajax({
      method: 'get',
      url: '/update_members',
      dataType: 'json',
      success: (data) => {
        this.setState({ members: data, loading: false });
      },
      error: (jqXHR) => {
        this.setState({ error: true });
        console.log(jqXHR);
      }
    });
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
    let onCall = '';
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
    //let onCall = _.filter(this.state.members, {on_call: true, status_id: 1}).length;
    for (var member of this.state.members) {
      members.push(this.member(member));
    }
    return members;
  }

  loading() {
    if (this.state.error) {
      return (
        <i className="fa fa-exclamation-triangle" aria-hidden="true" title="problems updating"></i>
      ); 
    }
    else if (this.state.loading) {
      return (
        <i className="fa fa-spinner" aria-hidden="true" title="checking for updates"></i>
      ); 
    }
    return (
      'On Call'
    );
  }

  operationalButton() {
    let btnClass = 'btn-success'
    if (!this.state.mode.operational || this.state.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.operational} className={`btn btn-xs ${btnClass}`}>operational</div>
    );
  }

  nonOperationalButton() {
    let btnClass = 'btn-success'
    if (this.state.mode.operational || this.state.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.nonOperational} className={`btn btn-xs ${btnClass}`}>non operational</div>
    );
  }

  onCallButton() {
    let btnClass = 'btn-success'
    if (!this.state.mode.onCall || this.state.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.onCall} className={`btn btn-xs ${btnClass}`}>on call</div>
    );
  }

  offCallButton() {
    let btnClass = 'btn-success'
    if (this.state.mode.onCall || this.state.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.offCall} className={`btn btn-xs ${btnClass}`}>off call</div>
    );
  }

  everyoneButton() {
    let btnClass = 'btn-success'
    if (!this.state.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.everyone} className={`btn btn-xs ${btnClass}`}>everyone</div>
    );
  }

  operational() {
    let mode = _.clone(this.state.mode);
    mode.operational = true;
    mode.everyone = false;
    this.setState({ mode: mode });
  }

  nonOperational() {
    let mode = _.clone(this.state.mode);
    mode.operational = false;
    mode.everyone = false;
    this.setState({ mode: mode });
  }

  onCall() {
    let mode = _.clone(this.state.mode);
    mode.onCall = true;
    mode.everyone = false;
    this.setState({ mode: mode });
  }

  offCall() {
    let mode = _.clone(this.state.mode);
    mode.onCall = false;
    mode.everyone = false;
    this.setState({ mode: mode });
  }

  everyone() {
    let mode = _.clone(this.state.mode);
    mode.everyone = true;
    this.setState({ mode: mode });
  }

  buttons(){
    return (
      <div className="row btn-toolbar">
        {this.operationalButton()}
        {this.nonOperationalButton()}
        {this.onCallButton()}
        {this.offCallButton()}
        {this.everyoneButton()}
      </div>
    );
  }

  render() {
    return (
      <div>
        {this.buttons()}
        <table className="table">
          <thead>
            <tr>
              <th>Name</th>
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

window.Members = Members;
