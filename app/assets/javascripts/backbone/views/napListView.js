App.Views.NapListView = Backbone.View.extend ({
	el: '.naps-list',
	initialize: function () {
		console.log( 'New Nap List');
		this.listenTo(this.collection, 'add', this.addOne)
		this.listenTo(this.collection, 'reset', this.addAll)
	},

	events: {
		'click button.add':'showForm'
	},

	addOne: function (nap) {
		var napView = new App.Views.napView({model: nap});
		// napView.$el.insertAfter(this.$('span.add'));
		this.$el.find('#nap-list').append(napView.$el);
	},

	addAll: function () {
		this.$el.find('#nap-list').empty();
		App.Collections.napsCollection.each(function (nap) { this.addOne(nap);}, this)
	},

	showForm: function () {
		console.log('show form')
		App.Routers.napRouter.navigate('naps/new');
		$('#nap-form').fadeIn(500);
		// $('button.add').fadeOut(200);
	}

}) ;
