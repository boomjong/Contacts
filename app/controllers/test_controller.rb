class TestController < ApplicationController
  def index
	@tests = Test.all
  end
  def show
  end
  def new
	@test = Test.new
  end
  def create
	@test = Test.new(allow_params)
	if @test.save
		flash[:notice] = "Nieuw contact is aangemaakt."
		redirect_to '/test'
	else
		flash[:error] = "Oeps iets is niet goed ingevuld."
		render 'test/new'
	end
  end
  
  private
  
  def allow_params
	params.require(:test).permit(:first_name, :middle_name, :last_name, :phone_number, :street_name, :street_number, :street_add, :zipcode, :city, :country, :group)
  end
end