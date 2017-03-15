require 'test_helper'

class ProveedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proveedor = proveedors(:one)
  end

  test "should get index" do
    get proveedors_url
    assert_response :success
  end

  test "should get new" do
    get new_proveedor_url
    assert_response :success
  end

  test "should create proveedor" do
    assert_difference('Proveedor.count') do
      post proveedors_url, params: { proveedor: { comuna_id: @proveedor.comuna_id, descripcion: @proveedor.descripcion, domicilio: @proveedor.domicilio, mail: @proveedor.mail, nombre: @proveedor.nombre, razon_social: @proveedor.razon_social, rut: @proveedor.rut, telefono1: @proveedor.telefono1, telefono2: @proveedor.telefono2, web: @proveedor.web } }
    end

    assert_redirected_to proveedor_url(Proveedor.last)
  end

  test "should show proveedor" do
    get proveedor_url(@proveedor)
    assert_response :success
  end

  test "should get edit" do
    get edit_proveedor_url(@proveedor)
    assert_response :success
  end

  test "should update proveedor" do
    patch proveedor_url(@proveedor), params: { proveedor: { comuna_id: @proveedor.comuna_id, descripcion: @proveedor.descripcion, domicilio: @proveedor.domicilio, mail: @proveedor.mail, nombre: @proveedor.nombre, razon_social: @proveedor.razon_social, rut: @proveedor.rut, telefono1: @proveedor.telefono1, telefono2: @proveedor.telefono2, web: @proveedor.web } }
    assert_redirected_to proveedor_url(@proveedor)
  end

  test "should destroy proveedor" do
    assert_difference('Proveedor.count', -1) do
      delete proveedor_url(@proveedor)
    end

    assert_redirected_to proveedors_url
  end
end
