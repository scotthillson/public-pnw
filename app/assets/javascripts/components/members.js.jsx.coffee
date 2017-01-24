window.Members = React.createClass

  getInitialState: ->
    {members: []}
  
  componentDidMount: ->
    $.ajax {
      method: 'GET'
      url: '/members'
      dataType: 'json'
      context: this
      success: (data) ->
        @setState(members: data)
      error: (jqXHR, ajaxSettings, thrownError)->
        console.log jqXHR
      }
  
  memberRow: (member) ->
    if member.on_call and member.status_id is 1
      on_call = `<i className="fa fa-check" aria-hidden="true"></i>`
    else
      on_call = ''
    `<tr key={member.d4h_id}>
      <td>{member.name}</td>
      <td>{member.mobile_phone}</td>
      <td>{member.email}</td>
      <td>{member.reference}</td>
      <td className="text-center">{on_call}</td>
    </tr>`
  
  render: ->
    if @state.members.length > 0
      members = []
      on_call = _.filter(@state.members, {on_call: true, status_id: 1}).length
      for member in @state.members
        members.push @memberRow(member)
      `<table className="table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Position</th>
            <th className="text-center">Operational On Call ({on_call})</th>
          </tr>
        </thead>
        <tbody>
          {members}
        </tbody>
      </table>`
    else
      `<h3>Loading!</h3>`
