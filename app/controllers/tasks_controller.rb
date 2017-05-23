class TasksController < ApplicationController
  before_action :get_task, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @tasks = Task.all
  end

  def show
    @todos = @task.todos
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task.update_attribute(:title, params[:task][:title])
    head :ok
  end

  def destroy 
    @task.destroy
    head :ok
  end

  private 
    def task_params
      params.require(:task).permit(:title)
    end

    def get_task
      @task = Task.find(params[:id])
    end
end
