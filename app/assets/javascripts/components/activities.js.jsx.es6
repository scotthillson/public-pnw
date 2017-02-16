class Activities extends ViewComponent {

  constructor() {
    super();
    this.state = {
      activities: [],
      d4h_id: null,
      new_name: null,
      new_date: null
    };
  }

  componentDidMount() {
    this.loadActivities();
  }

  activityButton(activity) { 
    if (activity.event) {
      return (
        <div className="btn btn-xs btn-warning">edit</div>
      );
    }
    return (
      <div
        className="btn btn-xs btn-success"
        onClick={this.saveActivity.bind(this,activity)}>
        add
      </div>
    );
  }
  
  activity(activity) {
    return (
      <tr key={activity.d4h_id}>
        <td>{activity.reference}</td>
        <td>{activity.start_on}</td>
        <td>{this.activityButton(activity)}</td>
      </tr>
    );
  }

  updateActivities(data) {
    let activities = _.clone(this.state.activities);
    let activity = _.find(activities, {d4h_id: data.d4h_id})
    activity = data;
    this.setState({ activities: activities });
  }

  loadActivities() {
    $.ajax({
      method: 'GET',
      url: '/activities',
      dataType: 'json',
      success: (data) => {
        this.setState({ activities: data });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }
  
  saveActivity(data) {
    $.ajax({
      method: 'POST',
      url: '/events',
      dataType: 'json',
      data: data,
      success: (data) => {
        this.updateActivities(data);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }
  
  render() {
    if (this.state.activities.length > 0) {
      let activities = [];
      for (var activity of this.state.activities) {
        activities.push(this.activity(activity));
      }
      return (
        <table className="table">
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
        </table>
      );
    }
    return(
      <h3>Loading!</h3>
    );
  }
}

window.Activities = Activities;
