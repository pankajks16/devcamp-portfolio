class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :portfolio_status]
  # before_action makes the method (wriiten after it in the above line as syntax) to execute before the actions given 
  # in this controller class. only and except option are there to specifically include or exculdes some methods for this
  # action

  layout "blog"

  access all: [:show, :index], user: {except: [:destroy, :edit, :update, :new, :create]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all.order('created_at DESC')  # This is done in order to maintain the order after update on UI. 
                                                # Else the updated record will move down the screen.
    #@blogs = Blog.all           # This one is the default scaffold generated one.
    @page_title = "Blog | My Portfolio Blog"  # Here we are overriding the value of @page_title variable present in the 
                                              # application_controller file. So, this value gets render when index page is accessed.
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.title
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def portfolio_status
    if @blog.published?
      @blog.draft!
    elsif @blog.draft?
      @blog.published!
    end

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog status was successfully updated.' }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id]) #friendly is used to fetch the record based on the friendly url present
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
