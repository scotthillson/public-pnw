class IncidentMap extends ViewComponent {

  componentDidMount() {
    var options = {
      center: new google.maps.LatLng(45.386, -122.604),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    let map = new google.maps.Map(this.map, options);
  }

  componendDidUpdate() {
    google.maps.event.trigger(this.map, "resize")
  }

  render() {
    let style = {
      width: '900px',
      height: '400px'
    }
    return (
      <div style={style}
        ref={ (div) => { this.map = div; } }>
      </div>
    );
  }

}

window.IncidentMap = IncidentMap;
