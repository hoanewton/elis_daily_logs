App.Views.NapFormView = Backbone.View.extend({
	id: 'nap',
	tagName: 'div',

	initialize: function () {
		console.log('created a napView')
		this.template = HandlebarsTemplates['naps/nap'];
		this.editTemplate = HandlebarsTemplates['naps/editForm'];
		this.listenTo(this.model, 'change', this.render);
		this.listenTo(this.model, 'destroy', this.remove);
		this.render();
	},

	render: function () {
		this.$el.empty();
		this.$el.html(this.template(this.model.toJSON()));
	},

	events: {
		'click button.delete': 'deleteView',
		'click button.edit': 'editNap',
		'click button.edit-nap': 'updateNap',
		'click button.cancel': 'cancel'
	},

	deleteView: function () {
		this.model.destroy();
	},

	editNap: function () {
		App.Routers.napRouter.navigate('naps/' + this.model.id + '/edit');
		this.$el.html(this.editTemplate(this.model.toJSON()));
		this.$('.edit-nap').show();
	},

	updateNap: function () {
		var newData = {
			start_time: 	this.$("input#start_time").val(),
			end_time: 		this.$("input#end_time").val(),
			description: 	this.$("input#description").val()
		};
		this.model.save(newData, {success: function () {
			console.log('updated')
			App.Routers.napRouter.navigate('');
			this.$('.edit-nap').fadeOut(500);
		}.bind(this)});

	},
	cancel: function () {
		App.Routers.napRouter.navigate('');
		this.render();
		this.$('.edit-nap').fadeOut(500);
	}
	
});

