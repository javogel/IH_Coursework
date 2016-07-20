class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json


  def login
    render 'login'
  end

  def login_validation
    @email = params[:email]
    @password = params[:password]
    @user = User.where('email = ?', @email).limit(1).first

    if @user && (@user.password == @password)
      session[:current_user_id] = @user.id
      redirect_to '/dashboard'
    else
      render text: 'Wrong email or password'
    end

  end


  def dashboard
    @current_id = session[:current_user_id]
    @products = Product.where('user_id = ?', @current_id)
    @bids = Bid.where('user_id = ?', @current_id)
    @bidded_products = []
    @won_products = []
    @bids.each do |bid|
      if !(@bidded_products.include? Product.where('id = ?', bid.product_id))
        @bidded_products << Product.find(bid.product_id)
      end
    end

    @bidded_products.each do |product|
      product_winner = product.bid.order(amount: :desc).first.user_id
      if (session[:current_user_id] == product_winner) && !(@won_products.include?  product)
        @won_products << product
      end
    end

  end

  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
