class PortfoliosController < ApplicationController
	layout "portfolio"
	
	access all: [:show, :index, :angular, :ror], user: {except: [:destroy, :edit, :update, :new, :create, :sort]}, site_admin: :all


	def index
		@portfolios_items = Portfolio.by_position
		#@portfolios_items = Portfolio.all.order("created_at DESC")
		#@portfolios_items = Portfolio.where(subtitle: "Ruby On Rails")
		#@portfolios_items = Portfolio.where(subtitle: "Angular")
		#@portfolios_items = Portfolio.all
	end

	def sort
		params[:order].each do |key, value|
			Portfolio.find(value[:id]).update!(position: value[:position]) rescue ''
		end

		render body: nil
	end

	def angular
		@angular_items = Portfolio.angular_items
	end

	def ror
		@ror_items = Portfolio.ruby_on_rails_items	
	end

	def new
		@portfolio_item = Portfolio.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
    	@portfolio_item = Portfolio.new(portfolios_params)
    
	    respond_to do |format|
	      if @portfolio_item.save
	        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
		#3.times { @portfolio_item.technologies.build }
	end

	def update
	  @portfolio_item = Portfolio.find(params[:id])

	  respond_to do |format|
	    if @portfolio_item.update(portfolios_params)
	      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
	      
	    else
	      format.html { render :edit }
	    end
	  end
  	end

  	def show
  		@portfolio_item = Portfolio.find(params[:id])
  	end
	
  	def destroy
  		@portfolio_item = Portfolio.find(params[:id])

  		@portfolio_item.destroy
  		# respond_to do |format|
  		# 	format.html { redirect_to portfolios_path }
  		# end
  		redirect_to portfolios_path
  	end

  	private

  	def portfolios_params
  		params.require(:portfolio).permit(:id, :title, 
  										  :subtitle, 
  										  :body, 
    									  technologies_attributes: 
    									  [:name, :id])
  	end
end