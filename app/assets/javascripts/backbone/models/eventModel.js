App.EventModel = Backbone.Model.extend({
  initialize: function() {
    console.log('New Event Model');
  },
  urlRoot: '/days/:day_id'
});