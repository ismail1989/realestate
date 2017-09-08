class TagNamesController < ApplicationController

	def new
		@tag_name = TagName.new
	end

	def create
    @tag_name = TagName.new(tag_name_params)

    respond_to do |format|
      if @tag_name.save
        format.js{}
      else
        format.js{}
      end
    end
  end

	private
	def tag_name_params
    params.require(:tag_name).permit(:name)
  end
end