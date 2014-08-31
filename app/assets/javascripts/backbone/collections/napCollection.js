App.Collections.NapsCollection = Backbone.Collection.extend({
  model: App.NapModel,
  url: '/days/:day_id',
  initialize: function() {
    console.log('New Nap Collection');
  },
  save: function(){
    this.each(function(model){
      if (!model.has('id') || model.hasChanged()) { model.save(); }
    }, this)
  }
});