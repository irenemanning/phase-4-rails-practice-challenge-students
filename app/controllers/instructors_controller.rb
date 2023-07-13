class InstructorsController < ApplicationController
    def index
        instructors = Instructor.all
        render json: instructors
    end
    def show
        instructor = Instructor.find_by(params[:id])
        render json: instructor
    end
    def create
        instructor = Instructor.create(instructor_params)
        render json: instructor, status: :created
    end
    def update
        instructor = Instructor.find(params[:id])
        instructor.update(instructor_params)
        render json: instructor
    end
    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end
end
