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
        for (var e in this.props.list) {
          if (this.props.list[e].equipment_category_id == c.id) {
            items.push(this.props.list[e]);
          }
        }
        for (var e = 0; e < items.length; e += 2) {
          if (items[e+1]) {
            list.push(
              <div className="row equipment-row" key={`eq-${items[e].id}`}>
                {this.props.equipmentItem(items[e], 'equipment-6 pull-left')}
                {this.props.equipmentItem(items[e+1], 'equipment-6 pull-left')}
              </div>
            );
          } else {
            list.push(
              <div className="row equipment-row" key={`eq-${items[e].id}`}>
              {this.props.equipmentItem(items[e], 'equipment-10 pull-left')}
              </div>
            );
          }
        }
      }
    }
    return list;
  }

  customPrint() {
    let list = [];
    let items = [];
    if (this.props.team.id == 0) {
      let categories = [];
      let names = [];
      for (var e in this.props.list) {
        let id = Number(this.props.list[e].equipment_category_id);
        names.push(_.find(this.props.categories, {id: id}).display_name);
      }
      for (var c of this.props.categories){
        if (!categories.includes(c.display_name)) {
          categories.push(c.display_name);
          if (names.includes(c.display_name)) {
            list.push (
              <div className="row text-center" key={`cat-${c.id}`}>
                  <div className="equipment-head">
                    {c.display_name}
                  </div>
              </div>
            );
          }
          items = [];
          for (var e in this.props.list) {
            let id = Number(this.props.list[e].equipment_category_id);
            if (_.find(this.props.categories, {id: id}).display_name == c.display_name ) {
              items.push(this.props.list[e]);
            }
          }
          for (var e = 0; e < items.length; e += 2) {
            if (items[e+1]) {
              list.push(
                <div className="row equipment-row" key={`eq-${items[e].id}`}>
                  {this.props.equipmentItem(items[e], 'equipment-6 pull-left')}
                  {this.props.equipmentItem(items[e+1], 'equipment-6 pull-left')}
                </div>
              );
            } else {
              list.push(
                <div className="row equipment-row" key={`eq-${items[e].id}`}>
                {this.props.equipmentItem(items[e], 'equipment-10 pull-left')}
                </div>
              );
            }
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
        {this.customPrint()}
      </div>
    );
  }

}

window.PrintEquipment = PrintEquipment;
