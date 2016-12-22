window.Members = React.createClass

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
    members = []
    on_call = _.filter(@props.members, {on_call: true, status_id: 1}).length
    for member in @props.members
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
