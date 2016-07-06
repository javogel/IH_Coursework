

class ContactsController < ApplicationController

  def index
    @all_contacts = Contact.all.order("name ASC")
    render 'index'
  end

  def new

    render 'new'
  end

  def create

    Contact.create(name: params[:contact][:name], address: params[:contact][:address], phone: params[:contact][:phone], email: params[:contact][:email], avatar: params[:contact][:avatar])

    redirect_to '/contacts/index'
  end

  def show
    @id = params[:id]
    @contact = Contact.find_by(id: @id)
    @favorite = @contact.favorite
  end

  def favorite
    @contact = Contact.find_by(id: params[:id])
    @contact.favorite = @contact.favorite.nil? ? true : !@contact.favorite
    @contact.save
    @favorite = @contact.favorite
    redirect_to "/contacts/show/#{params[:id]}"
  end

  def allfavorites
    @contacts = Contact.where("favorite = ?", true)
    render 'allfavorites'
  end


  def search
    if params[:search]
      @search = params[:search]
      @first = @search.chars.first
      # binding.pry
      @contacts = Contact.where("name like ?", "#{@first}%")
    end
    render 'search'
  end


  def user_params
    params.require(:user).permit(:avatar)
  end

end
