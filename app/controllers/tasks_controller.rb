class TasksController < ApplicationController
  before_action :require_user_logged_in
  #before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    # @tasks = Task.order(id: :desc).page(params[:page]).per(5)
    # ログインユーザのタスクだけ表示するように変更
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(5)
  end
  def show
    #@task = Task.find(params[:id])
  end
  def new
    # @task = Task.new
    # userインスタンスを紐づけるフォームを用意するように変更
    @task = current_user.tasks.build # form_with用
  end
  def create
    # @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に登録されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'Taskが登録されませんでした'
      render :new
    end
  end
  def edit
    #@task = Task.find(params[:id])
  end
  def update
    # @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Taskが正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが更新されませんでした'
      render :edit
    end
  end
  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました。'
    redirect_to tasks_url
  end

  private
  
  # set_taskはcorrect_userで代用
  # def set_task
  #   @task = Tasks.find(params[:id])
  # end
  
  # Strong Patameter
  def task_params
    params.require(:task).permit(:content,:status)
  end
  
  # check user belongs
  # ここはfind_byで見つからない場合の処理を追加する。
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end

end
