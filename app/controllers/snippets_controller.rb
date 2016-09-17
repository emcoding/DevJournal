class SnippetsController < ApplicationController
  before_action :authenticate_account! # Devise
  load_and_authorize_resource except: :index # Cancancan

  # GET /snippets
  # GET /snippets.json
  def index

    @account = current_account

    if @account.soft_account?
      @snippets = Snippet.where(soft_token: @account.soft_token).reverse_order
    else
      @snippets = current_account.snippets.reverse_order
    end

    if params[:search]
      @snippets = @snippets.search(params[:search]).reverse_order
    elsif params[:tag]
      @snippets = @snippets.tagged_with(params[:tag]).reverse_order
    end
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show
  end

  # GET /snippets/new
  def new
  end

  # GET /snippets/1/edit
  def edit
  end

  # POST /snippets
  # POST /snippets.json
  def create
    @account = current_account
    @snippet = @account.snippets.build(snippet_params)

    if @account.soft_account?
      @snippet.soft_token = @account.soft_token
    end
    @snippet.save

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to snippets_path }
        format.json { render :show, status: :created, location: @snippet }
      else
        format.html { render :new }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippets/1
  # PATCH/PUT /snippets/1.json
  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to action: :index }
        format.json { render :show, status: :ok, location: @snippet }
      else
        format.html { render :edit }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to snippets_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def snippet_params
      params.require(:snippet).permit(:title, :content, :tag_list, :image, :remove_image)
    end
end
