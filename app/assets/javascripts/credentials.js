var app = window.app = {};
app.Credentials = function() {
  this._input = $('#credentials-search-txt');
  this._initAutocomplete();
};

app.Credentials.prototype = {

};

_initAutocomplete: function() {
  this._input
    .autocomplete({
      source: '/credentials',
      appendTo: '#credentials-search-results',
      select: $.proxy(this._select, this)
    })
    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
}

_select: function(e, ui) {
  this._input.val(ui.item.title + ' - ' + ui.item.author);
  return false;
}

_render: function(ul, item) {
  var markup = [
    '<span class="name">' + item.name + '</span>',
    '<span class="required">' + item.required + '</span>'
  ];
  return $('<li>')
    .append(markup.join(''))
    .appendTo(ul);
}