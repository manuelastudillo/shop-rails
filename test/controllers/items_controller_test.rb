require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { brand_id: @item.brand_id, category_id: @item.category_id, codigo: @item.codigo, descripcion: @item.descripcion, min_stock: @item.min_stock, precio: @item.precio, proveedor_id: @item.proveedor_id, stock: @item.stock, unit_id: @item.unit_id } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { brand_id: @item.brand_id, category_id: @item.category_id, codigo: @item.codigo, descripcion: @item.descripcion, min_stock: @item.min_stock, precio: @item.precio, proveedor_id: @item.proveedor_id, stock: @item.stock, unit_id: @item.unit_id } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
