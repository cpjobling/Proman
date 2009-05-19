class NewsArticlesController < ApplicationController
  
  # GET /news_articles
  # GET /news_articles.xml
  def index
    @news_articles = NewsArticle.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_articles }
    end
  end
  
  # GET /news_articles/1
  # GET /news_articles/1.xml
  def show
    @news_article = NewsArticle.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_article }
    end
  end
  
  # GET /news_articles/new
  # GET /news_articles/new.xml
  def new
    @news_article = NewsArticle.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_article }
    end
  end
  
  # GET /news_articles/1/edit
  def edit
    @news_article = NewsArticle.find(params[:id])
  end
  
  # POST /news_articles
  # POST /news_articles.xml
  def create
    @news_article = NewsArticle.new(params[:news_article])
    
    respond_to do |format|
      if @news_article.save
        flash[:notice] = 'NewsArticle was successfully created.'
        format.html { redirect_to(@news_article) }
        format.xml  { render :xml => @news_article, :status => :created, :location => @news_article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_article.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /news_articles/1
  # PUT /news_articles/1.xml
  def update
    @news_article = NewsArticle.find(params[:id])
    
    respond_to do |format|
      if @news_article.update_attributes(params[:news_article])
        flash[:notice] = 'NewsArticle was successfully updated.'
        format.html { redirect_to(@news_article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_article.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /news_articles/1
  # DELETE /news_articles/1.xml
  def destroy
    @news_article = NewsArticle.find(params[:id])
    @news_article.destroy
    
    respond_to do |format|
      format.html { redirect_to(news_articles_url) }
      format.xml  { head :ok }
    end
  end
  
end