App.Collections.EventsCollection = Backbone.Collection.extend({
  model: App.NapModel,
  url: '/day/:id',
  initialize: function() {
    console.log('New Event Collection');
  },
  save: function(){
    this.each(function(model){
      if (!model.has('id') || model.hasChanged()) { model.save(); }
    }, this)
  }
});