class ApplicationLanding extends ViewComponent {

  constructor() {
    super();
    this.state = {
      successfulSubmit: false
    };
  }

  submitApplication(data) {
    $.ajax({
      type: 'post',
      url: '/submit_new_member_application',
      data: data,
      dataType: 'json',
      context: this,
      success: (data) => {
        if (data.success == true) {
          this.setState({ successfulSubmit: true });
        }
      },
      error: (jqXHR) => {
        console.log(jqXHR);
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
    return (
      <ProspectApplication
        submitApplication={ this.submitApplication }
      />
    );
  }

}

window.ApplicationLanding = ApplicationLanding;
