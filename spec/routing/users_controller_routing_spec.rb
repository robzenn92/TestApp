require 'spec_helper'

describe UsersController do

  it 'routes GET root_path should route to /users index action' do
    {:get => root_path}.should route_to(:controller=> 'users', :action => 'index')
  end

  it 'routes GET /user to user, index' do
    {:get => '/users'}.should route_to(:controller=> 'users', :action => 'index')
  end

  it 'routes GET /user/new to user, new' do
    {:get => '/users/new'}.should route_to(:controller=> 'users', :action => 'new')
  end

  it 'routes GET /user/15 to user, show' do
    {:get => '/users/15'}.should route_to(:controller=> 'users', :action => 'show', :id => '15')
  end

  it 'routes GET /user/15/edit to user, edit' do
    {:get => '/users/15/edit'}.should route_to(:controller=> 'users', :action => 'edit', :id => '15')
  end

  it 'routes POST /user to user, create' do
    {:post => '/users'}.should route_to(:controller=> 'users', :action => 'create')
  end

end