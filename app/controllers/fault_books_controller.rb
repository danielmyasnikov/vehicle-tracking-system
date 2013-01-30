class FaultBooksController < ApplicationController
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
    @fault_book = FaultBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fault_book }
    end
  end

  # GET /fault_books/new
  # GET /fault_books/new.json
  def new
    @fault_book = FaultBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fault_book }
    end
  end

  # GET /fault_books/1/edit
  def edit
    @fault_book = FaultBook.find(params[:id])
  end

  # POST /fault_books
  # POST /fault_books.json
  def create
    @fault_book = FaultBook.new(params[:fault_book])

    respond_to do |format|
      if @fault_book.save
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

    respond_to do |format|
      format.html { redirect_to fault_books_url }
      format.json { head :no_content }
    end
  end
end
