class IncidentMembers extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'addMemberByName',
      'keyUp',
      'members'
    );
    this.state = {
      name: '',
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
        this.props.setMembers(data);
      },
      error: (jqXHR) => {
        this.props.error();
        console.log(jqXHR);
      }
    });
  }

  addMemberByName() {
    let name = this.state.name;
    let member = _.find(this.props.members, { name: name })
    if (member) {
      this.addMembers([member.id]);
      this.setState({ name: '' });
    }
  }

  keyUp(e) {
    if (e.key === 'Enter') {
      this.addMemberByName();
    }
  }

  nameChange(e) {
    this.setState({ name: e.target.value });
  }

  members() {
    if (!this.props.members) {
      return;
    }
    let options = [];
    for (var member of this.props.members) {
      let recipient = _.find(this.props.recipients, {id: member.id});
      if (!recipient) {
        if (this.props.operational) {
          if (member.status_id == 1) {
            options.push(
              <option key={member.id} value={member.name} />
            );
          }
        } else {
          options.push(
            <option key={member.id} value={member.name} />
          );
        }
      }
    }
    return (
      <datalist id="members">
        {options}
      </datalist>
    );
  }

  render() {
    return (
      <div className="col-md-6">
        <input
          className="form-control"
          list="members"
          onChange={this.nameChange.bind(this)}
          onKeyUp={this.keyUp}
          placeholder="members"
          type="text"
          value={this.state.name}
        />
        {this.members()}
      </div>
    );
  }

}

window.IncidentMembers = IncidentMembers;
