class Activities extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'cancel'
    );
    this.state = {
      activities: [],
      activity: null
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
        onClick={this.createActivity.bind(this,activity)}>
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
    this.setState({ activities: activities, activity: null });
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

  createActivity(activity) {
    this.setState({ activity: activity });
  }

  cancel() {
    this.setState({ activity: null });
  }

  saveActivity(data) {
    $.ajax({
      method: 'POST',
      url: '/events',
      dataType: 'json',
      data: this.state.activity,
      success: (data) => {
        this.updateActivities(data);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  fieldChange(data){
    return true;
  }

  activityForm(){
    return(
      <div>
        <form className="col-md-10 form-horizontal text-center" role="form">
          <div className="row">
            <div className="col-md-6">
              <label>Title</label>
              <div>
                <input
                  className="form-control"
                  type="text"
                  value={this.state.activity.reference}
                  onChange={this.fieldChange.bind(this, 'reference')}
                />
              </div>
            </div>
          </div>
          <div className="row">
            <div className="col-md-6">
              <label>Description</label>
              <div>
                <input
                  className="form-control"
                  type="text"
                  value={this.state.activity.description}
                  onChange={this.fieldChange.bind(this, 'description')}
                />
              </div>
            </div>
          </div>
          <input
            className="btn btn-primary"
            value="Save"
            type="button"
            onClick={this.startSubmit}
          />
          <input
            className="btn btn-warning"
            value="Cancel"
            type="button"
            onClick={this.cancel}
          />
        </form>
      </div>
    );
  }

  render() {
    if (this.state.activity) {
      return this.activityForm();
    }
    else if (this.state.activities.length > 0) {
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
