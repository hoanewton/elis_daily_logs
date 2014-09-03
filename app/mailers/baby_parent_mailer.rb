class BabyParentMailer < ActionMailer::Base
	default from: 'elis.tracker.app@gmail.com'

	def daily_report_email(day)
		@day = day
		@baby = day.baby
    mail(to: @day.baby.parent_email, subject: 'Daily Report from Elis-tracker')	
	end
end
