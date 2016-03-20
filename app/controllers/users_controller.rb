class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy] 
  before_filter :authenticate_user!, :except => [:index] 
  load_and_authorize_resource

 
  # GET /users
  # GET /users.json
  def index
    @featured_post = Post.first
    @users = User.all
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @featured_post = Post.first
  end

  # GET /users/new
  def new
    @featured_post = Post.first
    @user = User.new
    
  end

  # GET /users/1/edit
  def edit
  @featured_post = Post.first
  end

  # POST /users
  # POST /users.json
  def create
    @featured_post = Post.first
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
  @featured_post = Post.first
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
    @featured_post = Post.first
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
      params.require(:user).permit(:first_name, :last_name)
    end
end
