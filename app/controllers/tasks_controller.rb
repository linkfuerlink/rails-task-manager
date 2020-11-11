class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  # before calling all these methods, call the find_bouncy_castle method first!

  def index # Read all
    @tasks = Task.all
  end

  def show # Read 1
    # @bouncy_castle = BouncyCastle.find(params[:id])
    # raise
  end

  def new
    @task = Task.new # Empty instance of the bouncy castle to display in the form
  end

  def create
    # raise
    task = Task.new(task_params)
    task.save

    redirect_to task_path(task) # Redirect to the show page - same as saying bouncy_castle.id


    # OUR PARAMS LOOK LIKE THIS NOW

     # params = {
     #   bouncy_castle:
     #     {"name"=>"Fluffy Bouncy", "address"=>"Berlin", "rating"=>"4"}
     # }


    # TO CREATE A BOUNCY CASTLE WE WOULD DO  THIS

    # BouncyCastle.create(params[:bouncy_castle])

    # BUT WE NEED TO USE STRONG PARAMS SO ACTUALLY WE DO THIS

    # bouncy_castle = BouncyCastle.new(bouncy_castle_params)

  end

  def edit
    # @bouncy_castle = BouncyCastle.find(params[:id]) # Prefilled bouncy castle instance to display in the form
  end

  def update
    # bouncy_castle = BouncyCastle.find(params[:id]) # Prefilled bouncy castle instance to display in the form
    @task.update(task_params)

    redirect_to task_path(@task) # Redirect to the show page
  end

  def destroy
    # bouncy_castle = BouncyCastle.find(params[:id])
    @task.destroy

    redirect_to task_path
  end

  private

  # STRONG PARAMS
  def task_params # Whitelist your params, only the ones below will be admitted. To protect against malicious input injections into forms
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
