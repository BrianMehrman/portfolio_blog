class HtmlSnippetsController < ApplicationController
  # GET /html_snippets
  # GET /html_snippets.json
  def index
    @html_snippets = HtmlSnippet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @html_snippets }
    end
  end

  # GET /html_snippets/1
  # GET /html_snippets/1.json
  def show
    @html_snippet = HtmlSnippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @html_snippet }
    end
  end

  # GET /html_snippets/new
  # GET /html_snippets/new.json
  def new
    @html_snippet = HtmlSnippet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @html_snippet }
    end
  end

  # GET /html_snippets/1/edit
  def edit
    @html_snippet = HtmlSnippet.find(params[:id])
  end

  # POST /html_snippets
  # POST /html_snippets.json
  def create


    @html_snippet = HtmlSnippet.new(html_snippet_params)

    respond_to do |format|
      if @html_snippet.save
        format.html { redirect_to @html_snippet, notice: 'Html snippet was successfully created.' }
        format.json { render json: @html_snippet, status: :created, location: @html_snippet }
      else
        format.html { render action: "new" }
        format.json { render json: @html_snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /html_snippets/1
  # PUT /html_snippets/1.json
  def update
    @html_snippet = HtmlSnippet.find(params[:id])

    respond_to do |format|
      if @html_snippet.update_attributes(html_snippet_params)
        format.html { redirect_to @html_snippet, notice: 'Html snippet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @html_snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /html_snippets/1
  # DELETE /html_snippets/1.json
  def destroy
    @html_snippet = HtmlSnippet.find(params[:id])
    @html_snippet.destroy

    respond_to do |format|
      format.html { redirect_to html_snippets_url }
      format.json { head :no_content }
    end
  end

  private

  def html_snippet_params
    params.require(:html_snippet).permit(:name, :description, :html, :css, :javascript, :image)

  end
end
