class PrintEquipment extends ViewComponent {

  firstAid(c) {
    if (c.display_name == 'First Aid Kit') {
      if (this.props.team.first_aid_kit)
       return true;
    }
  }

  print() {
    let list = [];
    let items = [];
    for (var c of this.props.categories){
      if (c.team_id == this.props.team.id || this.firstAid(c)) {
        list.push (
          <div className="row text-center" key={`cat-${c.id}`}>
              <div className="equipment-head">
                {c.display_name}
              </div>
          </div>
        );
        items = [];
        for (var e of this.props.list) {
          if (e.equipment_category_id == c.id) {
            items.push(e);
          }
        }
        for (var e = 0; e < items.length; e += 2) {
          if (items[e+1]) {
            list.push(
              <div className="row text-center" key={`eq-${items[e].id}`}>
                {this.props.equipmentItem(items[e], 'equipment-6 pull-left')}
                {this.props.equipmentItem(items[e+1], 'equipment-6 pull-left')}
              </div>
            );
          } else {
            list.push(
              <div className="row text-center equipment-row" key={`eq-${items[e].id}`}>
                {this.props.equipmentItem(items[e], 'equipment-12 pull-left')}
              </div>
            );
          }
        }
      }
    }
    return list;
  }

  render() {
    return (
      <div>
        {this.print()}
      </div>
    );
  }

}

window.PrintEquipment = PrintEquipment;
