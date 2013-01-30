require 'test_helper'

class FautlBooksControllerTest < ActionController::TestCase
  setup do
    @fautl_book = fautl_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fautl_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fautl_book" do
    assert_difference('FautlBook.count') do
      post :create, fautl_book: { contact_no: @fautl_book.contact_no, driver_id: @fautl_book.driver_id, fault_date: @fautl_book.fault_date, fault_type: @fautl_book.fault_type, faults: @fautl_book.faults, fleet_id: @fautl_book.fleet_id, mileage: @fautl_book.mileage }
    end

    assert_redirected_to fautl_book_path(assigns(:fautl_book))
  end

  test "should show fautl_book" do
    get :show, id: @fautl_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fautl_book
    assert_response :success
  end

  test "should update fautl_book" do
    put :update, id: @fautl_book, fautl_book: { contact_no: @fautl_book.contact_no, driver_id: @fautl_book.driver_id, fault_date: @fautl_book.fault_date, fault_type: @fautl_book.fault_type, faults: @fautl_book.faults, fleet_id: @fautl_book.fleet_id, mileage: @fautl_book.mileage }
    assert_redirected_to fautl_book_path(assigns(:fautl_book))
  end

  test "should destroy fautl_book" do
    assert_difference('FautlBook.count', -1) do
      delete :destroy, id: @fautl_book
    end

    assert_redirected_to fautl_books_path
  end
end
