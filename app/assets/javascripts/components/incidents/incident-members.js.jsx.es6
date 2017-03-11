class IncidentMembers extends ViewComponent {

  constructor() {
    super();
    this.state = {
      loading: true,
      messages: []
    };
  }

  componentDidMount() {
    this.loadMessages();
    this.interval = setInterval(() => {
      this.updateMessages();
    }, 5000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  loadMessages() {
    $.ajax({
      method: 'get',
      url: '/messages',
      dataType: 'json',
      success: (data) => {
        this.setState({ messages: data, loading: false });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  updateMessages() {
    $.ajax({
      method: 'get',
      url: '/update_messages',
      dataType: 'json',
      success: (data) => {
        this.setState({ messages: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  render() {
    if (this.state.loading){
      return (
        <div>Loading!</div>
      );
    }
    return (
      <Responder
        getIncident={this.props.getIncident}
        incident={this.props.incident}
        members={this.props.members}
        messages={this.state.messages}
      />
    );
  }
}

window.IncidentMembers = IncidentMembers;
