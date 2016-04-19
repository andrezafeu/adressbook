class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(name: :asc)
		render 'index'
	end
	def new
	end
	def create
		# Create new Contact from params[:contact]
		contact = Contact.new(
			:name => params[:contact][:name],
			:address => params[:contact][:address],
			:phone => params[:contact][:phone],
			:email => params[:contact][:email]
			)
		if !contact[:name].blank? and !contact[:address].blank?
			contact.save
			redirect_to("/contacts")
		else
			flash[:alert] = "Please fill out the name and address of the contact"
			render '/contacts/new'	
		end
		# Render contact's attributes
		# render(:text => contact.attributes)
		
	end
	def show
		contact_id = params[:id]
		@contact = Contact.find_by(id: contact_id)
	end
end
