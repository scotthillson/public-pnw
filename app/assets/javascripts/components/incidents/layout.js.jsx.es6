class IncidentsLayout extends ViewComponent {

  render() {
    return (
      <div className="callout">
        <Incidents
          addRecipients={this.props.addRecipients}
          error={this.props.error}
          getIncident={this.props.getIncident}
          groups={this.props.groups}
          incident={this.props.incident}
          incidents={this.props.incidents}
          members={this.props.members}
          messages={this.props.messages}
          setGroups={this.props.setGroups}
          setIncident={this.props.setIncident}
          setIncidents={this.props.setIncidents}
          setMembers={this.props.setMembers}
        />
        <NewMessage
          error={this.props.error}
          recipients={this.props.recipients}
          sendMessageResult={this.props.sendMessageResult}
        />
        <Messages
          error={this.props.error}
          setMessages={this.props.setMessages}
        />
        <Recipients
          dropRecipient={this.props.dropRecipient}
          recipients={this.props.recipients}
        />
        <Incident
          error={this.props.error}
          getIncident={this.props.getIncident}
          incident={this.props.incident}
          loading={this.props.loading}
          members={this.props.members}
          messages={this.props.messages}
          operational={this.props.operational}
          recipients={this.props.recipients}
          setMembers={this.props.setMembers}
        />
      </div>
    );
  }
}

window.IncidentsLayout = IncidentsLayout;
