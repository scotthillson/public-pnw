class Responders extends ViewComponent {

  incidentMembers() {
    if (!this.props.members || !this.props.incident) {
      return [];
    }
    let recipients = [];
    for (var i of this.props.incident.incident_members) {
      let recipient = _.find(this.props.members, { id: i.member_id });
      if (recipient) {
        recipient.status = i.status;
        recipients.push(recipient);
      }
    }
    return recipients;
  }

  sortedNames() {
    return(
      this.incidentMembers().sort((a, b) => {
        let nameA = a.name.toUpperCase();
        let nameB = b.name.toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
      })
    );
  }

  responder(r) {
    return (
      <Responder
        getIncident={this.props.getIncident}
        incident={this.props.incident}
        messages={this.props.messages}
        responder={r}
      />
    );
  }

  responders() {
    let i = 0;
    let recipients = [];
    let incident_members = this.sortedNames();
    let unknown = _.find(incident_members, {status: 'unknown'})
    while (incident_members.length > 0) {
      let avail = _.find(incident_members, {status: 'available'})
      if (avail) {
        _.remove(incident_members, { id: avail.id });
        avail = this.responder(avail);
      } else {
        avail = <span className="responder-column"></span>
      }
      let unknown = _.find(incident_members, {status: 'unknown'})
      if (unknown) {
        _.remove(incident_members, { id: unknown.id });
        unknown = this.responder(unknown);
      } else {
        unknown = <span className="responder-column"></span>
      }
      let unavail = _.find(incident_members, {status: 'unavailable'})
      if (unavail) {
        _.remove(incident_members, { id: unavail.id });
        unavail = this.responder(unavail);
      } else {
        unavail = <span className="responder-column"></span>
      }
      i += 1;
      recipients.push (
        <div key={i} className="row">
          {avail}
          {unknown}
          {unavail}
        </div>
      );
    }
    return recipients;
  }

  render() {
    if (this.props.loading){
      return (
        <div>Loading!</div>
      );
    }
    return (
      <div>
        {this.responders()}
      </div>
    );
  }
}

window.Responders = Responders;
