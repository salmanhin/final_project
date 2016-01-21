class DirectoriesController < ApplicationController
	before_action :find_people, only: [:show, :edit, :update, :destory]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		#@people = Directory.where(["first_name LIKE ?", "%#{params[:search]}%"])

		if params[:category].blank?
			@people = Directory.all
			#@people = Directory.where(["first_name LIKE ?", "%#{params[:search]}%"])
			@people = Directory.search(params[:search])
		else
			@category_id = Category.find_by(name: params[:category]).id
			@people = Directory.where(:category_id => @category_id)
			#@people = Directory.search(params[:search])
		end

	end
	def show
	end
	def new
	#	@people = Directory.new #only show without restrictions.
		@people = current_user.directory.build #only user will see it
		@categories = Category.all.map{ |c| [c.name, c.id] }
		@person = Directory.all
	end
	def create
	#	@people = Directory.new(directory_params)
		@people = current_user.directory.build(directory_params)
		@people.category_id = params[:category_id]

		if @people.save
		flash[:notice] = "Your user is succesfully created!"
		redirect_to root_path
		else
			@people = current_user.directory.build
			@categories = Category.all.map{ |c| [c.name, c.id] }
			render 'new'
			flash[:notice] = current_user.errors.full_messages.join(" ")
		end
	end

	def edit

		@categories = Category.all.map{ |c| [c.name, c.id] }
		
	end

	def update
		@people.category_id = params[:category_id]
		if @people.update(directory_params)
			redirect_to directory_path(@people)
			flash[:notice] = "Your user is succesfully Edited!"
		else
			render 'edit'
			flash[:notice] = "Your user is succesfully Edited!"
		end
	end

	def about
	end

	def destroy
		#@peopel.destroy
		Directory.find(params[:id]).destroy
		flash[:notice] = "You deleted a empolyee!"
		redirect_to root_path
	end

	private

	def directory_params
		params.require(:directory).permit(:first_name, :last_name, :title, :email, :description, :previous, :report_to, :office_location, :seating_zone, :fun_fact_one, :fun_fact_two, :fun_fact_three, :category_id, :directory_img)
	end

	def find_people
		@people = Directory.find(params[:id])
	end

end


#@movies = Movie.new(params.require(:movie).permit(:title, :description, :year_released))
