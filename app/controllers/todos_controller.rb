class TodosController < ApplicationController
  before_action :get_todo, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token


  def create
    @task = Task.find(params[:belongs_to])
    @todo = @task.todos.build(title: params[:title], isComplete: false)

    if @todo.save 
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors
    end
  end

  def mark_all_done
    if params[:task_id] 
      @task = Task.find(params[:task_id])
      @todos = @task.todos
      @todos.each { |e| e.set_done }
    end

    head :ok
  end

  def update
    @todo.set_done
    head :ok
  end

  def destroy 
    @todo.destroy 
    head :ok
  end

  private 
    def get_todo
      @todo = Todo.find(params[:id])
    end
end
