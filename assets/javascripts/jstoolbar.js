// Add Slide
jsToolBar.prototype.elements.diagram = {
  type: 'button',
  title: 'Diagram',
  fn: {
    wiki: function() { this.encloseLineSelection('{{diagram\n', '\n}}') }
  }
}

// Add space
// jsToolBar.prototype.elements.space_slide = {
//   type: 'space'
// }

// Move back the help at the end
var help = jsToolBar.prototype.elements.help;
delete(jsToolBar.prototype.elements.help);
jsToolBar.prototype.elements.help = help;

$('html head').append('<style>.jstb_diagram{ background-image: url(/plugin_assets/redmine_mermaid/images/diagram.png); }</style>');
