class GroupsController < ApplicationController
    def index
	@groups = Group.all
  end
  def show
  	@group = Group.find(params[:id])
  end
  def new
	@group = Group.new
  end
  def create
	@group = Group.new(allow_params)
	if @group.save
		flash[:notice] = "Nieuwe groep is aangemaakt."
		redirect_to '/groups'
	else
		flash[:error] = "Oeps iets is niet goed ingevuld."
		render :new
	end
  end  
  def edit
	@group = Group.find(params[:id])
  end
  def update
	@group = Group.find(params[:id])
	@group.update_attributes(allow_params)
	redirect_to '/groups'
  end
  def destroy
	@group = Group.find(params[:id])
	@group.destroy
	redirect_to '/groups'
  end
  
  private
  
  def allow_params
	params.require(:group).permit(:group_name)
  end
end
