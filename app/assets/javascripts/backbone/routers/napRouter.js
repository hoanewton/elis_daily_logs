App.Routers.NapRouter = Backbone.Router.extend({

	routes: {
		'': 'index',
		'naps/new': 'new',
		'naps/:id/edit': 'edit'
	},

	initialize: function () {
		console.log (' New Router! ');
		App.Collections.napsCollection = new App.Collections.NapsCollection();
		App.Views.napListView = new App.Views.NapListView({collection: App.Collections.napsCollection});
		App.Views.napFormView = new App.Views.NapFormView({collection: App.Collections.napsCollection});
		App.Collections.napsCollection.fetch({ reset: true });
	},

	index: function () {
		App.Collections.napsCollection.fetch({ reset: true });
		$('#nap-form').hide();
	},

	new: function () {
		console.log('new action activated')
		App.Collections.napsCollection.fetch({ reset: true });
		$('#nap-form').fadeIn(500);
	},

	edit: function (id) {
		var naps = App.Collections.napsCollection;
		naps.fetch({ reset: true, success: function () {
			App.Routers.napRouter.navigate('naps/' + id + '/edit' )
			$('#' + id).find('button.edit').click()

		} });
		$('#nap-form').fadeOut();
		$('.add').fadeIn(200);
	}

});