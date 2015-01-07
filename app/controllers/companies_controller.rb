class CompaniesController < ApplicationController
	before_action :single_company, only: [:show, :edit, :update, :destroy]

	def index
		@companies = Company.all
	end

	def show
		@message = Message.new
		@message.company_id = @company.id
	end

	def edit
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		save(@company)
	end

	def update
		@company.update(company_params)
		save(@company)
	end

	 def destroy
    @company.destroy
    redirect_to companies_path
  end

	private

	def save(company)
		if company.save
			redirect_to '/'
		else
			render :new
		end
	end

	def single_company
		@company = Company.find(params[:id])
	end

	def company_params
		params.require(:company).permit(:name, :desc, :website)
	end
end 