class MemberButtons extends ViewComponent {

  operationalButton() {
    let btnClass = 'btn-success'
    if (!this.props.mode.operational || this.props.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.props.operational} className={`btn btn-xs ${btnClass}`}>operational</div>
    );
  }

  nonOperationalButton() {
    let btnClass = 'btn-success'
    if (this.props.mode.operational || this.props.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.props.nonOperational} className={`btn btn-xs ${btnClass}`}>non operational</div>
    );
  }

  onCallButton() {
    let btnClass = 'btn-success'
    if (!this.props.mode.onCall || this.props.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.props.onCall} className={`btn btn-xs ${btnClass}`}>on call</div>
    );
  }

  offCallButton() {
    let btnClass = 'btn-success'
    if (this.props.mode.onCall || this.props.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.props.offCall} className={`btn btn-xs ${btnClass}`}>off call</div>
    );
  }

  everyoneButton() {
    let btnClass = 'btn-success'
    if (!this.props.mode.everyone) {
      btnClass = 'btn-default';
    }
    return (
      <div onClick={this.props.everyone} className={`btn btn-xs ${btnClass}`}>everyone</div>
    );
  }

  render() {
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
}

window.MemberButtons = MemberButtons;
