App.Views.NapFormView = Backbone.View.extend({
	el: '#nap-form',

	initialize: function () {
		this.template = HandlebarsTemplates['naps/form'];
		this.render();
	},

	events: {
		'click button.create': 'addNap',
		'click button.cancel': 'cancel'
	},

	render: function () {
		this.$el.empty();
		this.$el.html(this.template());
	},

	addNap: function () {
		var formData = {
			author: 	$('#author').val(),
			title: 		$('#title').val(),
			content: 	$('#content').val()
		};
		App.Collections.napsCollection.create(formData, {success: function () { 
			$('input').val('');
			$('#nap-form').hide(100);
			App.Routers.napRouter.navigate('');
		}
	});
	},
	cancel: function(){
		this.$el.fadeOut(200);
		App.Routers.napRouter.navigate('');
	}	
});