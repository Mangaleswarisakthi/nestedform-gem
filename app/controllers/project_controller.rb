class ProjectController < ApplicationController
  def index
	@project=Proj.all
  end
def create
	@project=Proj.new(add_params)
	if @project.save
		flash[:notice]='Success'
		redirect_to root_path
	else
		flash[:notice]='Not Success'
		render :new
	end
	
end
def edit
 	@project = Proj.find_by_id(params[:id])
end
def update
	@project=Proj.find(params[:id])
	if @project.update_attributes(add_params)
		flash[:notice] = 'Your Details Successfully Updated!'
		redirect_to root_path
	else
		flash[:error] = 'Sorry Updation is Failed!'
		render :update
	end
end
def alltask
	@project=Proj.new
	@projects=Proj.all
end

def destroy
	@project=Proj.find_by(params[:id])
	flash[:alert] = 'not deleted!'
	if @project.delete
		flash[:alert] = 'Deleted'
		
	end		
	
	@project=Proj.all
	redirect_to root_path
end
def new
	@project=Proj.new
	#@project=Proj.tasks.build
end 
  def show
	@project=Proj.find_by(id: params[:id])
  end

def uptasks

	@tasks=params[:proj][:tasks_attributes]
	@tasks.each do |i|
	j=@tasks[i]
	@task=Task.create(
		:proj_id => j["proj_id"],
		:title => j["title"],
		:desc => j["desc"],
		:duration => j["duration"]
		)
if @task.save
		flash[:notice] = 'Your Details Successfully Updated!'
	else
		flash[:error] = 'Sorry Updation is Failed!'
	end
end
redirect_to '/project/alltask'
end
  
def add_params
	params.require(:proj).permit(:title, :desc, :id, :tasks_attributes => [:id, :proj_id, :title, :desc, :duration, :_destroy] )

end

end
