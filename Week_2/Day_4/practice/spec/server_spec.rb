require './server'
require 'rspec'
require 'rack/test'


describe 'Server service' do
  include  Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'Get /' do
      it 'returns 200 OK' do
        get '/'
         expect(last_response).to be_ok
      end

      it "includes 'I'm home'" do
        get '/'

        expect(last_response.body).to include("I'm home!")
      end
  end

end
