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
	else
		flash[:error] = 'Sorry Updation is Failed!'
	end
	redirect_to root_path
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
	taskdate=params[:obj][:taskdate]
	@tasks=params[:proj][:tasks_attributes]
	sum=0
	@tasks.each do |i|
	j=@tasks[i]
	sum += j["duration"].to_i
	end
t=8-Task.where(:taskdate => taskdate).sum(:duration)	
	if sum > 8 || sum > t
		if sum > 8
			flash[:notice] = 'Sry Only 8 hours should be Updated'
		elsif sum > t
			flash[:notice] ="Sry Already 8 Houres allocated for this day"
		end
		
	else
	@tasks.each do |i|
	j=@tasks[i]
	@task=Task.create(
		:proj_id => j["proj_id"],
		:taskdate => taskdate,
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
end

redirect_to '/project/alltask'
end
  
def add_params
	params.require(:proj).permit(:title, :desc, :id, :tasks_attributes => [:id, :proj_id, :taskdate, :title, :desc, :duration, :_destroy] )

end

end
