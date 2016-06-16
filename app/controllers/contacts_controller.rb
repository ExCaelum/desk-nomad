class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    redirect_to root_path
  end

end
