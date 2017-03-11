class Recipients extends ViewComponent {

  dropButton(r) {
    return (
      <span className="btn btn-xs btn-danger pull-right"
      onClick={this.props.dropRecipient.bind(this, r)}>
        <i className="fa fa-ban" aria-hidden="true"></i>
      </span>
    );
  }

  recipient(r) {
    let note = '';
    if (r.status_id != 1) {
      note = 'non-op';
    }
    return (
      <span className={`recipient-column ${r.status}`} key={r.id}>
        <div>
          <span>
            {r.name}
            {note}
          </span>
          {this.dropButton(r)}
        </div>
      </span>
    );
  }

  sortedNames() {
    return(
      this.props.recipients.sort((a, b) => {
        let nameA = a.name.toUpperCase();
        let nameB = b.name.toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
      })
    );
  }

  recipients() {
    let recipients = [];
    let names = this.sortedNames();
    for (var r of names) {
      recipients.push (
        <div className="row">
          <span className="recipient-column"></span>
          {this.recipient(r)}
          <span className="recipient-column"></span>
        </div>
      );
    }
    return recipients;
  }

  render() {
    return (
      <div>
        {this.recipients()}
      </div>
    );
  }
}

window.Recipients =  Recipients;
