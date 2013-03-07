class TodolistsController < ApplicationController
    def index
        @todolists = current_user.todolists
    end

    def show
        @todolist = get_todolist(params[:id])
    end

    def new
        @todolist = current_user.todolists.new
    end

    def edit
        @todolist = get_todolist(params[:id])
    end

    def create
        @todolist = current_user.todolists.new(params[:todolist])
        set_flash_message('Todolist was successfully created.','notice') if @todolist.save
        respond_with(current_user, @todolist)
    end

    def update
        @todolist = get_todolist(params[:id])
        set_flash_message('Todolist was successfully updated.','notice') if @todolist.update_attributes(params[:todolist])
        respond_with(current_user, @todolist)
    end

    def destroy
        @todolist = get_todolist(params[:id])
        set_flash_message('Todolist was successfully deleted.','notice') if @todolist.destroy
        respond_with(current_user, @todolist)
    end

    private
    def get_todolist(todolist_id)
        current_user.todolists.find(todolist_id) rescue redirect_to root_path, alert: "Not found."
    end

end
