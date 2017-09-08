class AdminController < ApplicationController
  layout 'application'
  def index
  	@flat_appartments = Property.where('holding_type=?', 'Flat-Appartment').count
  	@luxury_flats = Property.where('holding_type=?', 'Luxury-Flat').count
  	@house_villas = Property.where('holding_type=?', 'House-Villa').count
  	@lands = Property.where('holding_type=?', 'Lands').count
  	@other_holdings = Property.where('holding_type=?', 'Other Holding').count
  	@blogs = Blog.all.count
  	@news = News.all.count
  	@properties = Property.all
    # @users = User.where.not('role_id=?', Role.find_by_name('General Manager').id)
    @users = User.all
    @enquiries = Enquiry.all.count
  end

  def property_admin
  	@flat_appartments = Property.where('holding_type=?', 'Flat-Appartment').count
  	@luxury_flats = Property.where('holding_type=?', 'Luxury-Flat').count
  	@house_villas = Property.where('holding_type=?', 'House-Villa').count
  	@lands = Property.where('holding_type=?', 'Lands').count
  	@other_holdings = Property.where('holding_type=?', 'Other Holding').count
  	@properties = Property.all
  end

  # def blog_admin
  # 	@blog_count = Blog.all.count
  # 	@news_count = News.all.count
  # 	@blogs = Blog.all
  # 	@news = News.all
  # end

  def new_employee
    respond_to do |format|
      format.js{}
    end
    @user = User.new
    # @roles = Role.where.not(id: Role.find_by_name('General Manager').id)
    @roles = Role.all
  end

  def create_employee
    # @roles = Role.where(id: Role.find_by_name('Employee').id)
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_index_url, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:error] = @user.errors.full_messages.to_sentence
        format.html { render :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id, :is_active)
  end
end
