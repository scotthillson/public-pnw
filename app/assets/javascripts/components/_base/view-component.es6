
class ViewComponent extends React.Component {

  bindThisToComponent(...methods) {
    methods.forEach((method) => { this[method] = this[method].bind(this); });
  }

}

window.ViewComponent = ViewComponent;
