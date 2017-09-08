class UserMailer < ApplicationMailer
	default from: 'oraclients@gmail.com'

	def enquiry_email(enquiry)
    @enquiry = enquiry
    mail(to: 'ph44cx30@gmail.com', subject: 'Customer enquiry')
  end
end