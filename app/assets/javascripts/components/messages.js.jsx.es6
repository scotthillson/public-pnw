class Messages extends ViewComponent {

  constructor() {
    super();
    this.state = {
      messages: [],
      body: ''
    };
  }

  componentDidMount() {
    this.loadMessages();
  }

  loadMessages() {
    $.ajax({
      method: 'GET',
      url: '/messages',
      dataType: 'json',
      context: this,
      success: (data) => {
        this.setState({messages: data});
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  bodyChange() {
    return true;
  }

  render() {
    return (
      <div>
        <textarea
          name="body"
          className="form-control"
          value={this.state.body}
          onChange={this.bodyChange}
        />
      </div>
    );
  }

}

window.Messages = Messages;
