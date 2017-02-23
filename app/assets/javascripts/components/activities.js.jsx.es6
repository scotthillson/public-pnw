class Activities extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'cancel',
      'destroy',
      'saveActivity'
    );
    this.state = {
      activities: [],
      activity: null,
      loading: true
    };
  }

  componentDidMount() {
    this.loadActivities();
  }

  loadActivities() {
    $.ajax({
      method: 'GET',
      url: '/activities',
      dataType: 'json',
      success: (data) => {
        this.setState({ activities: data }, this.updateActivities);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  updateActivities(){
    $.ajax({
      method: 'GET',
      url: '/update_activities',
      dataType: 'json',
      success: (data) => {
        this.setState({ activities: data, loading: false });
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  activityButton(activity) {
    if (activity.event) {
      return (
        <div
          className="btn btn-xs btn-warning"
          onClick={this.editActivity.bind(this, activity)}>
          edit
        </div>
      );
    }
    return (
      <div
        className="btn btn-xs btn-success"
        onClick={this.editActivity.bind(this, activity)}>
        add
      </div>
    );
  }

  activity(activity) {
    let type = 'btn btn-xs btn-success';
    if (activity.activity_type == 'incident') {
      type = 'btn btn-xs btn-primary';
    } else if (activity.activity_type == 'exercise') {
      type = 'btn btn-xs btn-warning';
    }
    return (
      <tr key={activity.d4h_id}>
        <td>{activity.reference}</td>
        <td><div className={type}>{moment(activity.start_on).format('MMMM Do YYYY, Hmm')}</div></td>
        <td>{this.activityButton(activity)}</td>
      </tr>
    );
  }

  editActivity(activity) {
    if (activity.event) {
      activity.reference = activity.event.reference;
      activity.description = activity.event.description;
    }
    this.setState({ activity: activity });
  }

  cancel() {
    this.setState({ activity: null });
  }

  destroy() {
    let data = this.state.activity;
    $.ajax({
      method: 'DELETE',
      url: `events/${data.event.id}`,
      dataType: 'json',
      success: () => {
        this.setState({ activity: null }, this.updateActivities());
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  saveActivity() {
    let data = this.state.activity;
    data.activity_id = data.id;
    data.start_time = data.start_on;
    data.event_type = data.activity_type;
    let method = 'POST';
    let url = '/events';
    if (data.event) {
      method = 'PATCH';
      url = `events/${data.event.id}`;
    }
    $.ajax({
      method: method,
      url: url,
      dataType: 'json',
      data: data,
      success: () => {
        this.setState({ activity: null }, this.updateActivities());
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  fieldChange(field, e){
    let activity = _.clone(this.state.activity);
    activity[field] = e.target.value;
    this.setState({activity: activity});
  }

  destroyButton() {
    if (this.state.activity.event) {
      return (
        <input
        className="btn btn-danger"
        value="Delete"
        type="button"
        onClick={this.destroy}
        />
      );
    }
  }

  activityForm(){
    return(
      <div>
        <form className="text-center">
          <div className="form-group">
            <label>Title</label>
            <input
              className="form-control"
              type="text"
              value={this.state.activity.reference}
              onChange={this.fieldChange.bind(this, 'reference')}
            />
          </div>
          <div className="form-group">
            <label>Description</label>
            <textarea
              rows={10}
              className="form-control"
              value={this.state.activity.description}
              onChange={this.fieldChange.bind(this, 'description')}
            />
          </div>
          <div className="btn-toolbar">
            <input
              className="btn btn-primary"
              value="Save"
              type="button"
              onClick={this.saveActivity}
            />
            <input
              className="btn btn-warning"
              value="Cancel"
              type="button"
              onClick={this.cancel}
            />
            {this.destroyButton()}
          </div>
        </form>
      </div>
    );
  }

  loading() {
    if (this.state.loading) {
      return (
        <i className="fa fa-spinner fa-pulse fa-fw" title="checking for updates"></i>
      ); 
    }
  }

  render() {
    if (this.state.activity) {
      return this.activityForm();
    }
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
            <th>{this.loading()}</th>
          </tr>
        </thead>
        <tbody>
          {activities}
        </tbody>
      </table>
    );
  }
}

window.Activities = Activities;
