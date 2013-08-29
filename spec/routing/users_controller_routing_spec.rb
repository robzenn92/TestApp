require 'spec_helper'

describe UserController do

  it 'routes GET /user to user, index' do
    {:get => '/user'}.should route_to(:controller=> 'user', :action => 'index')
  end

  it 'routes GET /user/new to user, new' do
    {:get => '/user/new'}.should route_to(:controller=> 'user', :action => 'new')
  end

  it 'routes GET /user/15 to user, show' do
    {:get => '/user/15'}.should route_to(:controller=> 'user', :action => 'show', :id => '15')
  end

  it 'routes GET /user/15/edit to user, edit' do
    {:get => '/user/15/edit'}.should route_to(:controller=> 'user', :action => 'edit', :id => '15')
  end

  it 'routes POST /user to user, create' do
    {:post => '/user'}.should route_to(:controller=> 'user', :action => 'create')
  end
end
