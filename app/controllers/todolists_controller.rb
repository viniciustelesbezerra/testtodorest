class TodolistsController < ApplicationController
  respond_to :html, :json
  before_filter :owns_todolist, only: [:edit, :update, :destroy] 

  def index
    @todolists = Todolist.asc(:priority).where(user_id: current_user.id)
  end

  def show
    @todolist = get_todolist(params[:id])
  end

  def new
    @todolist = Todolist.new
  end

  def edit
    @todolist = get_todolist(params[:id])
  end

  def create
    @todolist = Todolist.new(params[:todolist])
    flash[:notice] = 'Todolist was successfully created.' if @todolist.save
    respond_with(@todolist)
  end

  def update
    @todolist = get_todolist(params[:id])
    flash[:notice] = 'Todolist was successfully updated.' if @todolist.update_attributes(params[:todolist])
    respond_with(@todolist)
  end

  def destroy
    @todolist = get_todolist(params[:id])
    flash[:notice] = 'Todolist was successfully deleted.' if @todolist.destroy
    respond_with(@todolist)
  end

  private
  
  def get_todolist(todolist_id)
    Todolist.find(todolist_id)
  end

  def owns_todolist
    begin  
      redirect_to root_path, error: "Not allowed" if !user_signed_in? || current_user != Todolist.where(user_id: current_user.id).first.user
    rescue
      redirect_to root_path, error: "Not allowed"
    end
  end

end
