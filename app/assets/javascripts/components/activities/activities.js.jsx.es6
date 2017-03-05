class Activities extends ViewComponent {

  constructor() {
    super();
    this.bindThisToComponent(
      'cancel',
      'destroy',
      'save'
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
      data: this.addParam('year'),
      success: (data) => {
        this.setState({ activities: data }, this.updateActivities);
      },
      error: (jqXHR) => {
        console.log(jqXHR);
      }
    });
  }

  addParam(param) {
      let url = location.href;
      param = param.replace(/[\[\]]/g, "\\$&");
      let regex = new RegExp("[?&]" + param + "(=([^&#]*)|&|#|$)");
      let results = regex.exec(url);
      if (!results) return null;
      if (!results[2]) return null;
      let result = decodeURIComponent(results[2].replace(/\+/g, " "));
      if (result) {
        return { year: result };
      }
      return {};
  }

  updateActivities(){
    $.ajax({
      method: 'GET',
      url: '/update_activities',
      dataType: 'json',
      data: this.addParam('year'),
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
    let type = 'btn btn-xs btn-info';
    if (activity.activity_type == 'incident') {
      type = 'btn btn-xs btn-primary';
    } else if (activity.activity_type == 'exercise') {
      type = 'btn btn-xs btn-pnw';
    }
    return (
      <tr key={activity.id}>
        <td>{activity.reference}</td>
        <td>
          <a
            href={`https://pnwsar.d4h.org/team/${activity.activity_type}s/view/${activity.d4h_id}`}
            className={type}
            target="_blank"
          >
            {moment(activity.start_on).format('MMMM Do YYYY, Hmm')}
          </a>
          </td>
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

  save() {
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
    this.setState({ activity: activity });
  }

  destroyButton() {
    if (this.state.activity.event) {
      return (
        <input
        className="btn btn-danger"
        value="Delete"
        type="button"
        onClick={ this.destroy }
        />
      );
    }
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
      return( 
        <ActivityForm
          activity={this.state.activity}
          cancel={this.cancel}
          destroyButton={this.destroyButton}
          fieldChange={this.fieldChange}
          save={this.save}
        />
      );
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
