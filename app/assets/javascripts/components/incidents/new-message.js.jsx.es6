class NewMessage extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'sendMessage'
    );
    this.state = {
      message: ''
    };
  }

  sendMessage() {
    let recipients = this.props.recipients;
    let message = this.state.message;
    $.ajax({
      method: 'post',
      url: '/new_message',
      data: {message: message, recipients: recipients},
      dataType: 'json',
      success: (data) => {
        this.props.sendMessageResult(data);
      },
      error: (jqXHR) => {
        this.props.error();
        console.log(jqXHR);
      }
    });
  }

  fieldChange(e) {
    this.setState({ message: e.target.value })
  }

  render() {
    return (
      <div>
        <div className="row bottom-margin">
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
          <span className="col-md-4">{150-this.state.message.length} characters remaining</span>
          <span
            className="btn btn-primary btn-xs pull-right btn-pnw col-md-4"
            onClick={this.sendMessage}>Send
          </span>
          <span className="pull-right col-md-4">{this.props.recipients.length} recipients</span>
        </div>
      </div>
    );
  }
}

window.NewMessage = NewMessage;
