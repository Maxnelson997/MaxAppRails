class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show,:destroy]
    layout 'portfolio'
    access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
    
    def index
       @portfolio_items = Portfolio.by_position
    end
  
    def sort 
      params[:order].each do |key, value|
        Portfolio.find(value[:id]).update(position: value[:position])
      end
      
      render nothing: true
    end
    
    def angular
       @angular_portfolio_items = Portfolio.angular
    end
    
    def new
      @portfolio_item = Portfolio.new
      3.times { @portfolio_item.technologies.build }
    end

  # POST /blogs
  # POST /blogs.json
  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  # GET /portfolios/1/edit
  def edit
  end
  
    # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update


    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show 

  end
  
  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    # Perform the lookup

    
    # Destroy/delete the record
    @portfolio_item.destroy
    
    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Item has been destroyed' }
    end
  end

  
  private 
  
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body, 
                                      :image,
                                      technologies_attributes: [:name])
  end
  
  
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
