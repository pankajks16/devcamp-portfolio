class PortfoliosController < ApplicationController
	def index
		@portfolios_items = Portfolio.all.order("created_at DESC")
		#@portfolios_items = Portfolio.all
	end

	def new
		@portfolios_item = Portfolio.new
	end

	def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
	end

end