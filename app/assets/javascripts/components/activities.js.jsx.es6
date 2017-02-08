class Activities extends ViewComponent {
  
  constructor() {
    super();
    this.state = {
      activities: []
    };
  }
  
  componentDidMount() {
    $.ajax({
      method: "GET",
      url: "/activities",
      dataType: "json",
      success: (data)=>{
        this.setState({activities: data});
      },
      error: (jqXHR, ajaxSettings, thrownError)=>{
        console.log(jqXHR);}
    });
  }
  
  activity(activity) {
    return (
    <tr key={activity.d4h_id}>
      <td>{activity.reference}</td>
      <td>{activity.start_on}</td>
      <td><div className="btn btn-xs btn-success">add</div></td>
    </tr>
    );
  }
  
  render() {
    if (this.state.activities.length > 0){
      let activities = [];
      for (var activity of this.state.activities){
        activities.push(this.activity(activity));
      }
      return (<table className="table">
        <thead>
          <tr>
            <th>Reference</th>
            <th>Date</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {activities}
        </tbody>
      </table>);
    }
    else {
      return(<h3>Loading!</h3>);
    }
  }
}

window.Activities = Activities;
