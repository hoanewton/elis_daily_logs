App.Views.NapView = Backbone.View.extend({
  className: 'nap',
  initialize: function() {
    console.log('New Nap View');

    this.template = HandlebarsTemplates['naps/nap'];
    this.listenTo(this.model, 'change', this.render)
    this.listenTo(this.model, 'destroy', this.remove)
    this.render();
  },
  render: function(){
    this.$el.html(this.template(this.model.toJSON()));
  },
  // DOM EVENTS
  events: {
    'click span.destroy': 'destroyView',
    'click span.edit': 'editNap',
    'click span.edit-nap': 'updateNap',
    'click span.cancel': 'cancel'
  },
  destroyView: function() {
    this.model.destroy();
  },
  editNap: function() {
  App.router.navigate('naps/'+ this.model.id +'/edit');
    this.$('.nap-form-div').remove();
    this.$el.append(HandlebarsTemplates['naps/form'](this.model.toJSON()));
    this.$('.nap-form-div').show();
  },
  updatenap: function() {
    var newData = {
      start_time: this.$("[name='start_time']").val(),
      end_time: this.$("[name='end_time']").val(),
      description: this.$("[name='description']").val(),
    };
    this.model.save(newData, {success: function() {
      App.router.navigate('');
    }});
  },
  cancel: function() {
    App.router.navigate('');
    this.$('.nap-form-div').remove();
  }
});
