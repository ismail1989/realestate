class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  # helper_method :current_or_guest_user

  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = "Access denied!"
  #   redirect_to root_url
  # end

  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # def guest_user(with_retry = true)
  #   @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  # rescue ActiveRecord::RecordNotFound
  #    session[:guest_user_id] = nil
  #    guest_user if with_retry
  # end

  def after_sign_in_path_for(resource)
    if current_user.role.name == "General Manager"
      admin_index_url
    elsif
      current_user.role.name == "Property Manager"
      property_admins_url
    elsif
      current_user.role.name == "Blog Manager"
      blog_admin_url
    else
      root_url
    end
  end

  # private

  # def logging_in
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
  # end

  # def create_guest_user
  #   u = User.create(:email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
  #   u.save!(:validate => false)
  #   session[:guest_user_id] = u.id
  #   u
  # end
  
  # def after_sign_in_path_for(resource_or_scope)
  #   if resource_or_scope.is_a?(User) && resource_or_scope.locale !=  I18n.locale
  #     I18n.locale = resource_or_scope.locale
  #   end
  #   super
  # end

  private
    def set_locale
      I18n.locale = params[:locale] if params[:locale].present?
    end
    
    def default_url_options(options={})
    { :locale => I18n.locale }
    end
end
