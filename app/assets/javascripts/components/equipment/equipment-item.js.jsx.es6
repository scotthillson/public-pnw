class EquipmentItem extends ViewComponent {

  getInitialState() {
    {
      isOver: false
      dragHoverCounter: 0
    }
  }

  onDragStart(e) {
    if (!e) {
      return;
    }
    e.dataTransfer.setData('text', this.props.column.field_name);
    e.dataTransfer.setData('table', this.props.column.server_table);
  }

  onDragEnter(e) {
    if (!e || !this.props.removeItem) {
      return;
    }
    e.preventDefault();
    this.setState({ dragHoverCounter: (this.state.dragHoverCounter + 1) });
  }

  onDragOver(e) {
    if (!e || !this.props.removeItem) {
      return;
    }
  }

  onDragLeave(e) {
    if (!e || !this.props.removeItem) {
      return;
    }
    this.setState({ dragHoverCounter: (this.state.dragHoverCounter - 1) });
  }

  onDrop(e) {
    if (!e) {
      return;
    }
    e.preventDefault();
    if (!this.props.removeItem || !this.props.addItem) {
      return;
    }
    let item = {id: e.dataTransfer.getData('item')};
    this.props.addColumn(column, this.props.index);
  }

  onMouseEnter(e) {
    if (!this.state.isOver){
      this.setState({ isOver: true });
    }
  }

  onMouseLeave(e) {
    if (this.state.isOver) {
      this.setState({ isOver: false });
    }
  }

  onClickAction(e) {
    if (!e) {
      return;
    }
    e.preventDefault();
    if (this.props.removeColumn) {
      this.props.removeColumn(this.props.column);
    } else {
      this.props.addColumn(this.props.column);
    }
  }

  getClassName() {
    let output = [];
    if (this.state.isOver) {
      output.push('hover');
    }
    if (this.props.isNewest) {
      output.push('glow');
    }
    return output.join(' ');
  }

  getDropZone() {
    if (this.state.dragHoverCounter < 1) {
      return;
    }
    return (
      <span className="drop-zone"></span>
    );
  }

  getDragIcon() {
    if (props.removeColumn) {
      return (
        <i className="fa fa-bars"></i>
      );
    } else {
      return (
        <i className="fa fa-arrows"></i>
      );
    }
  }

  getAction() {
    if (this.props.removeColumn){
      return (
        <i className="fa fa-times"></i>
      );
    } else {
      return (
        <i className="fa fa-arrow-right"></i>
      );
    }
  }

  render() {
    return (
      <li
        draggable={true}
        droppable={this.props.removeColumn != null}
        onDragStart={this.onDragStart}
        onDragEnter={this.onDragEnter}
        onDragOver={this.onDragOver}
        onDragLeave={this.onDragLeave}
        onDrop={this.onDrop}
        >
        {this.getDropZone()}
        <a
          className={this.getClassName()}
          title={this.props.column.display + ' is a ' + this.props.column.server_table + ' attribute.'}
          onMouseEnter={this.onMouseEnter}
          onMouseLeave={this.onMouseLeave}
          >
          <span className="display-name">
            {this.props.column.display}
          </span>
          <span className="draggable">
            {this.getDragIcon()}
          </span>
          <span
            className="action"
            onClick={this.onClickAction}
            >
            {this.getAction()}
          </span>
        </a>
      </li>
    );
  }
}

window.EquipmentItem = EquipmentItem;
