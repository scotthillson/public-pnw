class Groups extends ViewComponent {

  componentDidMount() {
    this.loadGroups();
  }

  loadGroups() {
    $.ajax({
      method: 'get',
      url: '/groups',
      dataType: 'json',
      success: (data) => {
        this.props.setGroups(data);
      },
      error: (jqXHR) => {
        this.props.error();
        console.log(jqXHR);
      }
    });
  }

}

window.Groups = Groups;
