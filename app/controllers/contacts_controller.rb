class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
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
		# Render contact's attributes
		render(:text => contact.attributes)
	end
end
