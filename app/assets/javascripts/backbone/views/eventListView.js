App.Views.EventListView = Backbone.View.extend ({
	el: '.events-list',
	initialize: function () {
		console.log( 'New event List');
		this.listenTo(this.collection, 'add', this.addOne)
		this.listenTo(this.collection, 'reset', this.addAll)
	},

	// events: {
	// 	'click button.add':'showForm'
	// },

	addOne: function (event) {
		var eventView = new App.Views.EventView({model: event});
		// eventView.$el.insertAfter(this.$('span.add'));
		this.$el.find('#event-list').append(eventView.$el);
	},

	addAll: function () {
		this.$el.find('#event-list').empty();
		App.Collections.eventsCollection.each(function (event) { this.addOne(event);}, this)
	},

	// showForm: function () {
	// 	console.log('show form')
	// 	App.Routers.eventRouter.navigate('events/new');
	// 	$('#event-form').fadeIn(500);
	// 	// $('button.add').fadeOut(200);
	// }

}) ;