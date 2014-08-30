App.NapModel = Backbone.Model.extend({
  initialize: function() {
    console.log('New Grumble Model');
  },
  urlRoot: '/days/:day_id'
});
