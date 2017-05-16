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
      note = 'unavailable ';
    }
    return (
      <div className={`${note}recipient-column row`} key={r.id}>
        <span className="pull-left">{r.name}</span>
        {this.dropButton(r)}
      </div>
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
        this.recipient(r)
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
