class FaultBooksController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyFaultBook"
    session[:module_logo] = "fault-book.png" 
  end
  
  # GET /fault_books
  # GET /fault_books.json
  def index
    @fault_books = FaultBook.scoped
    @fault_books = FaultBook.belongs_to_truck_fleet(current_user.truck_fleet, @fault_books) if current_user.admin?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fault_books }
    end
  end

  # GET /fault_books/1
  # GET /fault_books/1.json
  def show
    if (params[:print])
      @fault_book = FaultBook.find(params[:id])

      respond_to do |format|
        format.html { render :layout => 'print' }# show.html.erb
        format.json { render json: @fault_book, :layout => 'print' }
      end
    else   
      @fault_book = FaultBook.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @fault_book }
      end
    end
  end

  # GET /fault_books/new
  # GET /fault_books/new.json
  def new
    @fault_book = FaultBook.new
    @fault_book.fault_date = Date.today.strftime("%d-%m-%Y")
    
    @drivers = current_user.truck_fleet.drivers
    @fleets = current_user.truck_fleet.fleets

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fault_book }
    end
  end

  # GET /fault_books/1/edit
  def edit
    @fault_book = FaultBook.find(params[:id])
    @drivers = current_user.truck_fleet.drivers
    @fleets = current_user.truck_fleet.fleets
    @fault_book.fault_date = @fault_book.fault_date.strftime("%d-%m-%Y")
  end

  # POST /fault_books
  # POST /fault_books.json
  def create
    @fault_book = FaultBook.new(params[:fault_book])

    respond_to do |format|
      if @fault_book.save
        s = Serviceable.find_by_fleet_id(params['fault_book']['fleet_id'])
        puts 'Fault book date'
        puts @fault_book.fault_date.inspect
        s.next_service_date = @fault_book.fault_date 
        s.save
        format.html { redirect_to @fault_book, notice: 'Fault book was successfully created.' }
        format.json { render json: @fault_book, status: :created, location: @fault_book }
      else
        format.html { render action: "new" }
        format.json { render json: @fault_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fault_books/1
  # PUT /fault_books/1.json
  def update
    @fault_book = FaultBook.find(params[:id])

    respond_to do |format|
      if @fault_book.update_attributes(params[:fault_book])
        format.html { redirect_to @fault_book, notice: 'Fault book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fault_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fault_books/1
  # DELETE /fault_books/1.json
  def destroy
    @fault_book = FaultBook.find(params[:id])
    @fault_book.destroy
    if (params[:from_calendar])
      UserMailer.cancel_service(current_user, @fault_book.fleet, "Fault Book Service", @fault_book.fault_date).deliver
      redirect_to controller: :calendar, action: :index
    else
      respond_to do |format|
        format.html { redirect_to fault_books_url }
        format.json { head :no_content }
      end      
    end
  end
  
  def postpone
    @fault_book = FaultBook.find(params[:fault_book])
  end
  
  def postponed
    @fault_book = FaultBook.find(params[:id])
    @fault_book.update_attributes(params[:fault_book])
    UserMailer.postponed_service(current_user, @fault_book).deliver
    
    redirect_to controller: :calendar, action: :index
  end
  
  def cancel
    p 'went into cancel'
  end
end
