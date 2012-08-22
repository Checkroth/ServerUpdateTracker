class SoftwaresController < ApplicationController
  http_basic_authenticate_with :name => "Administrator", :password => "PHARails"

   before_filter :get_software, :only => [:show, :edit, :update, :destroy]
   before_filter :get_softwares, :only => [:list_ood, :list_utd]

  def get_software
    @software = Software.find(params[:id])
  end

  def get_softwares
    @softwares = Software.find(:all)
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @software }
    end
  end


  def index
    @softwares = Software.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @softwares }
    end
  end

  def new
    @software = Software.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @server }
    end
  end

  def edit
  end

  def create
    @software = Software.new(params[:software])

    respond_to do |format|
      @server
      if @software.save
        format.html { redirect_to @software, :notice => 'Server was successfully created.' }
        format.json { render :json => @software, :status => :created, :location => @server }
      else
        format.html { render :action => "new" }
        format.json { render :json => @software.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
   # @software = Software.find(params[:id])
   # @server = @software.server

    respond_to do |format|
      if @software.update_attributes(params[:software])
        format.html { redirect_to @software, :notice => 'Software was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @software.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @software.destroy
    respond_to do |format|
      format.html { redirect_to softwares_url }
      format.json { head :no_content }
      end
  end

  def list_ood
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @server }
    end
  end

  def list_utd
    respond_to do |format|
      format.html
      format.json { render :json => @server }
    end
  end

end
