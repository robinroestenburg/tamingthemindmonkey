require 'spec_helper'

describe Admins::SessionsController do

  it 'should return an error when login name is not provided' do
    post :create, { user_login: '' }
    response.status.should == 422
    response.body.should =~ /missing user_login/
  end

  it 'returns 401 when email invalid' do
    Admin.stub(:find_for_database_authentication) { nil }

    post :create, { user_login: { email: 'invalid', password: 'invalid' } }
    response.status.should == 401
  end

  it 'returns 401 when password invalid' do
    admin = mock_model(Admin, valid_password?: false).as_null_object
    Admin.stub(:find_for_database_authentication) { admin }

    post :create, { user_login: { email: 'foo@example.com', password: 'invalid' } }
    response.status.should == 401
  end

  it 'returns 200 when a user is authorized' do
    Admins::SignsInAdmin.stub_chain(:new, :perform)
    admin = mock_model(Admin, valid_password?: true,
                              authentication_token: 1,
                              email: 'foo@example.com').as_null_object
    Admin.stub(:find_for_database_authentication) { admin }

    post :create, { user_login: { email: 'foo@example.com', password: '1337' } }
    response.status.should == 200
    JSON.parse(response.body)['success'].should be_true
  end

end
