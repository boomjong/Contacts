class ContactsController < ApplicationController
  def index
	@contacts = Contact.all
  end
  def show
	@contact = Contact.find(params[:id])
  end
  def new
	@contact = Contact.new
  end
  def create
	@contact = Contact.new(allow_params)
	if @contact.save
	flash[:notice] = "Nieuw contact is aangemaakt."
	redirect_to '/contacts'
	else
		flash[:error] = "Oeps iets is niet goed ingevuld."
		render :new
	end
  end
  def edit
	@contact = Contact.find(params[:id])
  end
  def update
	params[:contact][:group_ids] ||=[]
	@contact = Contact.find(params[:id])
	@contact.update_attributes(allow_params)
	redirect_to '/contacts'
  end
  def destroy
	@contact = Contact.find(params[:id])
	@contact.destroy
	redirect_to '/contacts'
  end

  private
  
  def allow_params
	params.require(:contact).permit(:first_name, :middle_name, :last_name, :phone_number, :street_name, :street_number, :street_add, :zipcode, :city, :country, group_ids:[])
  end
end
