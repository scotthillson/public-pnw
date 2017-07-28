class ApplicationLanding extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'submitApplication'
    );
    this.state = {
      successfulSubmit: false,
      submitFail: false,
      errors: []
    };
  }

  submitApplication(data) {
    $.ajax({
      type: 'post',
      url: '/submit_new_member_application',
      context: this,
      data: data,
      dataType: 'json',
      success: (data) => {
        if (data.success == true) {
          this.setState({ successfulSubmit: true });
        } else {
          this.setState({ submitFail: true, errors: data.errors });
        }
      },
      error: (jqXHR) => {
        console.log(jqXHR);
        this.setState({ submitFail: true });
      }
    });
  }

  render() {
    if (this.state.successfulSubmit) {
      return (
        <div className="text-center">
          <h3>Your application has been received!</h3>
          <p>We'll be in touch. Until then, don't get lost!</p>
        </div>
      );
    }
    if (this.state.submitFail) {
      let errors = [];
      for (var error in this.state.errors) {
        errors.push(
          <p key={error}>{ error } {this.state.errors[error]}</p>
        );
      }
      return (
        <div className="text-center">
          <p>There was a problem submitting your application.
          Please contact us so that we can resolve the error!</p>
          { errors }
        </div>
      );
    }
    return (
      <ProspectApplication
        submitApplication={ this.submitApplication }
      />
    );
  }

}

window.ApplicationLanding = ApplicationLanding;
