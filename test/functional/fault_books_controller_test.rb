require 'test_helper'

class FaultBooksControllerTest < ActionController::TestCase
  setup do
    @fault_book = fault_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fault_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fault_book" do
    assert_difference('FaultBook.count') do
      post :create, fault_book: { contact_no: @fault_book.contact_no, driver_id: @fault_book.driver_id, fault_date: @fault_book.fault_date, fault_type: @fault_book.fault_type, faults: @fault_book.faults, fleet_id: @fault_book.fleet_id, mileage: @fault_book.mileage }
    end

    assert_redirected_to fault_book_path(assigns(:fault_book))
  end

  test "should show fault_book" do
    get :show, id: @fault_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fault_book
    assert_response :success
  end

  test "should update fault_book" do
    put :update, id: @fault_book, fault_book: { contact_no: @fault_book.contact_no, driver_id: @fault_book.driver_id, fault_date: @fault_book.fault_date, fault_type: @fault_book.fault_type, faults: @fault_book.faults, fleet_id: @fault_book.fleet_id, mileage: @fault_book.mileage }
    assert_redirected_to fault_book_path(assigns(:fault_book))
  end

  test "should destroy fault_book" do
    assert_difference('FaultBook.count', -1) do
      delete :destroy, id: @fault_book
    end

    assert_redirected_to fault_books_path
  end
end
