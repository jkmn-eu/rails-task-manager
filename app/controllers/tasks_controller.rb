class TasksController < ApplicationController
  def all
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @new_task = Task.new()
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def create
    @final_task = Task.create(task_params)
    redirect_to task_path(@final_task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to all_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :details, :completed)
  end
end
