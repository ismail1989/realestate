class EnquiriesController < ApplicationController
  def new
  	respond_to do |format|
  		format.js{}
  	end
  end

  def index
    @enquiries = Enquiry.all
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    
    respond_to do |format|
      if @enquiry.save
        UserMailer.enquiry_email(@enquiry).deliver_later
        format.js{}
      else
        render render Rails.application.routes.recognize_path(request.referer)[:action]
      end
    end
  end

  private

  def enquiry_params
  	params.require(:enquiry).permit(:name, :mobile)
  end
end
