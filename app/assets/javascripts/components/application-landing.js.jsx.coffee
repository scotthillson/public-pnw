window.ApplicationLanding = React.createClass

  getInitialState: ->
    {successfulSubmit: false}

  submitApplication: (data) ->
    $.ajax
      type: 'post'
      url: "/submit_new_member_application"
      data: data
      context: this
      success: (data) ->
        console.log data
        if data.errors
          for key, error of data.errors
            console.log("#{key} #{error}")
        else if data.success == true
          @setState(successfulSubmit: true)
      error: (jqXHR, textStatus, errorThrown) ->
        console.log(jqXHR)

  render: ->
    if @state.successfulSubmit
      `<div className="text-center">
        <h3>Your application has been received!</h3>
        <p>We'll be in touch. Until then, don't get lost!</p>
      </div>`
    else
      `<ProspectApplication
        submitApplication={this.submitApplication}
      />`
