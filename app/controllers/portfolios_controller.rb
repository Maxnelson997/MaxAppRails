class PortfoliosController < ApplicationController

    def index
       @portfolio_items = Portfolio.all
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
      @portfolio_item = Portfolio.find(params[:id])
  end
  
    # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to @portfolio_item, notice: 'Portfolio was successfully updated. Max is dope' }
       # format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
       # format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show 
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    
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
  
  
  
end
