App.Routers.EventRouter = Backbone.Router.extend({

	routes: {
		'': 'index',
		// 'events/new': 'new',
		'events/:id/edit': 'edit'
	},

	initialize: function () {
		console.log (' New Router! ');
		App.Collections.eventsCollection = new App.Collections.EventsCollection();
		App.Views.eventListView = new App.Views.EventListView({collection: App.Collections.eventsCollection});
		App.Views.eventFormView = new App.Views.EventFormView({collection: App.Collections.eventsCollection});
		App.Collections.eventsCollection.fetch({ reset: true });
	},

	index: function () {
		App.Collections.eventsCollection.fetch({ reset: true });
		// $('#event-form').hide();
	},

	new: function () {
		console.log('new action activated')
		App.Collections.eventsCollection.fetch({ reset: true });
		// $('#event-form').fadeIn(500);
	},

	edit: function (id) {
		var events = App.Collections.eventsCollection;
		events.fetch({ reset: true, success: function () {
			App.Routers.eventRouter.navigate('events/' + id + '/edit' )
			$('#' + id).find('button.edit').click()

		} });
		// $('#event-form').fadeOut();
		// $('.add').fadeIn(200);
	}

});