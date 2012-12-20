Given 'there are posts' do
  Post.create!(:title => 'FooTitle1', :body => 'FooBody1')
  Post.create!(:title => 'FooTitle2', :body => 'FooBody2')
end

Given 'there is a registered user' do
  @admin = Admin.create!(email: 'foo@example.com', password: '123456')
end

When 'I request an authentication token using valid credentials' do
  request_token_with_valid_credentials
end

Then 'I should receive an authentication token' do
  auth_token_from_last_response.should_not be_empty
end

Given 'I have requested an authentication token using valid credentials' do
  request_token_with_valid_credentials
end

When 'I use that valid authentication token' do
  get_posts_with_token(auth_token_from_last_response)
end

Then 'I should be able to access the posts' do
  page = JSON.parse(last_response.body)
  page.should_not be_empty
end

When 'I use a different authentication token' do
  get_posts_with_token('foo')
end

Then 'I should be redirected to the sign in page' do
  last_response.status.should == 302
end

def auth_token_from_last_response
  page = JSON.parse(last_response.body)
  page["auth_token"]
end

def request_token_with_valid_credentials
  post '/admins/sign_in', { action: 'create', user_login: { email: 'foo@example.com', password: '123456' } }
end

def get_posts_with_token(token)
  get "/posts?auth_token=#{token}"
end
