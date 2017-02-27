class Callout extends ViewComponent {

  constructor() {
    super();
    this.state = {
      message: '',
      operational: true,
      operationalOnCall: true,
      recipients: [],
    };
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
        recipients.push(member.id);
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
        <div className="row" key={r.id}>
          <div className="col-md-4 recipient">{r.name}</div>
          <div className="btn btn-xs btn-danger" onClick={this.dropRecipient.bind(this, r)}>
            <i className="fa fa-ban" aria-hidden="true"></i>
          </div>
        </div>
      );
    }
    return recipients;
  }

  render() {
    return (
      <div>
        <div className="row btn-toolbar bottom-margin">
          <div className="btn btn-xs btn-default">operational</div>
        </div>
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
