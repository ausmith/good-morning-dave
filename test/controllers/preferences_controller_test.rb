require 'test_helper'

class PreferencesControllerTest < ActionController::TestCase
  setup do
    @preference = preferences(:api_key)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preference" do
    assert_difference('Preference.count') do
      post :create, preference: { name: @preference.name, plugin: @preference.plugin, value: @preference.value }
    end

    assert_redirected_to preference_path(assigns(:preference))
  end

  test "should show preference" do
    get :show, id: @preference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @preference
    assert_response :success
  end

  test "should update preference" do
    patch :update, id: @preference, preference: { name: @preference.name, plugin: @preference.plugin, value: @preference.value }
    assert_redirected_to preference_path(assigns(:preference))
  end

  test "should destroy preference" do
    assert_difference('Preference.count', -1) do
      delete :destroy, id: @preference
    end

    assert_redirected_to preferences_path
  end
end
