class Callout extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'operational'
    );
    this.state = {
      incidents: [],
      message: '',
      operational: true,
      operationalOnCall: true,
      recipients: [],
    };
  }

  loadIncidents() {
    $.ajax({
      method: 'get',
      url: '/incidents',
      dataType: 'json',
      success: (data) => {
        this.setState({ incidents: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  operational() {
    let operational = true;
    if (this.state.operational) {
      operational = false;
    }
    this.setState({ operational: operational });
  }

  operationalButton() {
    let btnClass = 'btn-default';
    if (this.state.operational) {
      btnClass = 'btn-primary';
    }
    return (
      <div className="row btn-toolbar bottom-margin">
        <div className={`btn btn-xs ${btnClass}`} onClick={this.operational}>operational only</div>
      </div>
    );
  }

  fieldChange(e) {
    this.setState({ message: e.target.value })
  }

  findTeam(team, id) {
    return team.id == id;
  }

  addTeam(e) {
    let group = this.props.groups.find(team => team.id == e.target.value);
    if (!group) {
      return;
    }
    let recipients = _.clone(this.state.recipients);
    for (var member of group.members) {
      if (!recipients.includes(member.id)) {
        if (this.state.operational) {
          if (member.status_id == 1) {
            recipients.push(member.id);
          }
        } else {
          recipients.push(member.id);
        }
      }
    }
    this.setState({ recipients: recipients });
  }

  dropRecipient(r) {
    let recipients = _.clone(this.state.recipients).filter(item => item !== r.id);
    this.setState({ recipients: recipients });
  }

  addRecipient() {
    this.setState({ recipients: [] });
  }

  teams() {
    let options = [];
    options.push(<option key="0" value=""></option>);
    for (var team of this.props.groups) {
      options.push(<option key={team.id} value={team.id}>{team.name}</option>);
    }
    return options;
  }

  recipient(r) {
    let rClass = 'recipient';
    if (r.status_id != 1) {
      rClass = 'off-recipient';
    }
    return (
      <div className="row" key={r.id}>
        <div className={`col-md-4 ${rClass}`}>{r.name}</div>
        <div className="btn btn-xs btn-danger" onClick={this.dropRecipient.bind(this, r)}>
          <i className="fa fa-ban" aria-hidden="true"></i>
        </div>
      </div>
    );
  }

  recipients() {
    let names = [];
    let recipients = [];
    for (var r of this.state.recipients) {
      let recipient = this.props.members.find(member => member.id == r);
      names.push(recipient);
    }
    names.sort((a, b) => {
      let nameA = a.name.toUpperCase();
      let nameB = b.name.toUpperCase();
      if (nameA < nameB) {
        return -1;
      }
      if (nameA > nameB) {
        return 1;
      }
    });
    for (var r of names) {
      recipients.push(
        this.recipient(r)
      );
    }
    return recipients;
  }

  render() {
    return (
      <div>
      <div className="row off-recipient">
        new incident period
      </div>
        {this.operationalButton()}
        <div className="row bottom-margin">
          <div className="col-md-6">
            <input className="form-control" type="text" value={this.state.memberAdd} />
          </div>
          <div className="col-md-6">
            <select
              className="form-control"
              onChange={this.addTeam.bind(this)}
            >{this.teams()}
            </select>
          </div>
          <div className="col-md-12">
            <textarea
              rows={3}
              className="form-control top-margin"
              value={this.state.message}
              onChange={this.fieldChange.bind(this)}
            />
          </div>
        </div>
        <div className="row bottom-margin">
          <p>{150-this.state.message.length} characters remaining</p>
        </div>
          {this.recipients()}
      </div>
    );
  }
}

window.Callout = Callout;
