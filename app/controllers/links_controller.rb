class LinksController < ApplicationController
  # GET /links
  def index
    @links = Link.order('created_at DESC')
    if logged_in?
      redirect_to users_path
    else
      render :index
    end
  end

  # GET /l/:short_name
  # See routes.rb for how this is set up.
  def show
    @link = Link.find_by_short_name(params[:short_name])

    if @link
      @link.clicked!
      redirect_to @link.url
    else
      render text: "No such link.", status: 404
    end
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links
  def create
    @link = Link.new(link_params)
    @link.user = current_user

    if @link.save
      redirect_to root_url, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  # Only allow a trusted parameter "white list" through.
  def link_params
    params.require(:link).permit(:url)
  end
end
