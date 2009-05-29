require 'app'
require 'test/unit'
require 'sinatra/test'

set :environment, :test

class AppTest < Test::Unit::TestCase

  include Sinatra::Test

  def test_index_page
    get '/'
    assert response.ok?
    assert response.body.include?('start coding ...')
  end

end

