class PersonalsController < ApplicationController
  before_filter :require_signed_in

  def new
    @personal = Personal.new

  end

  def show
    @personal = Personal.find(params[:id])

  end

  def index
    @personals = Personals.all

  end

  def create
    @personal = Personal.new(personal_params)
    @personal.user_id = current_user.id
    if @personal.save
      redirect_to personal_url(@personal)
    else
      flash.now[:errors] = @personal.errors.full_messages
      render :new
    end

  end

  def edit
    @personal = Personal.find(params[:id])

  end

  def update
    @personal = Personal.find(params[:id])
    @personal.user_id = current_user.id
    if @personal.update_attributes(personal_params)
      redirect_to personal_url(@personal)
    else
      flash.now[:errors] = @personal.errors.full_messages
      render :edit
    end
  end

  def destroy
    personal = Personal.find(params[:id])
    personal.destroy
    redirect_to personals_url
  end

  private

  def personal_params
    params.require(:personal).permit(:title, :body, :location, :gender, :age)
  end
end
