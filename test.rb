ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'api_lawn.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

# describe "Test hello world" do

# def test_it_says_hello_world
#     get '/'
#     assert last_response.ok?
#     assert_equal 'Hello World', last_response.body
#   end

#   def test_it_says_hello_to_a_person
#     get '/', :name => 'Simon'
#     assert last_response.body.include?('Simon')
#   end

# end

describe "Lawns" do
  describe "GET /lawns" do
    before do
      # using the rack::test:methods, call into the sinatra app and request the following url
      get "/lawns"
    end

    it "responds successfully" do
      # Ensure the request we just made gives us a 200 status code
      last_response.status.must_equal 200
    end
  end

  describe "GET /lawns" do
    before do
      # using the rack::test:methods, call into the sinatra app and request the following url
      get "/lawns"
    end

    it "responds successfully" do
      # Ensure the request we just made gives us a 200 status code
      last_response.status.must_equal 200
    end

		it "/lawnsl GET" do
		  Lawn.create(:width=>5, :height=>5)
		  Lawn.create(:width=>6, :height=>6)
		  get "/lawns"
		  last_response.should be_ok
		  info = JSON::parse(last_response.body)
		  info.size.should == 2
		  info[0][:width].should == 5
		  info[1][:width].should == 6
		end  

		it "POST /lawn create" do
		  Lawn.count.should == 0
		  post '/lawn', { :width=>2, :height: 1 }
		  Lawn.count.should == 1
		  Lawn.first.width.should == 2
		end

		it "POST /lawn create with error" do
		  Lawn.count.should == 0
		  post '/lawn', { :width=>2, :height: nil }
		  Lawn.count.should == 0
		end

		it "PUT /lawn/:id update" do
		  Lawn.create(:width=>6, :height=>6, id: 2)

		  put '/lawn', { id: 1, :width=>2, :height: 2 }
		  Lawn.count.should == 1
		  Lawn.first.width.should == 2
		  Lawn.first.width.should == 2
		end

		it "DELETE /lawn/:id delete" do
		  Lawn.create(:width=>6, :height=>6, id: 1)

		  delete '/lawn', { id: 1 }
		  Lawn.count.should == 0
		end


		it "GET '/execute/:id'" do
		  lawn = Lawn.create(:width=>5, :height=>5, id: 1)
		  lawn.mowers.create(x:1, y:2, headings:"N", commands:"LMLMLMLMM", id:1)
		  lawn.mowers.create(x:3, y:3, headings:"E", commands:"MMRMMRMRRM", id:2)

		  delete '/execute/:id', { id: 1 }
		  Mower.first.x.shold == 1
		  Mower.first.y.shold == 3
		  Mower.first.headings.shold == "N"
		  Mower.last.x.shold == 5
		  Mower.last.y.shold == 1
		  Mower.last.headings.shold == "E"
		end


		it "/lawn/:id/mowers GET list all" do
		  lawn = Lawn.create(:width=>6, :height=>6)
		  awn.mowers.create(x:1, y:1, headings:"N", commands:"MMM")
		  awn.mowers.create(x:1, y:1, headings:"N", commands:"MMM")
		  get "/lawn/:id/mowers"
		  last_response.should be_ok
		  info = JSON::parse(last_response.body)
		  info.size.should == 2
		  info[0][:x].should == 1
		  info[1][:x].should == 1
		end  


		it "POST /lawn/:id/mower create" do
			lawn = Lawn.create(:width=>6, :height=>6, id:1)
		  awn.mowers.create(x:1, y:1, headings:"N", commands:"MMM")
		  Mower.count.should == 0
		  post '/lawn/:id/mower', { id: 1, mower: {x:2, x:1, headings:"N", commands:"MMMM" } }
		  Mower.count.should == 2
		  Mower.first.x.should == 2
		end

		it "POST /lawn/:id/mower create" do
			lawn = Lawn.create(:width=>6, :height=>6, id:1)
		  awn.mowers.create(x:1, y:1, headings:"N", commands:"MMM")
		  Mower.count.should == 0
		  post '/lawn/:id/mower', { id: 1, mower: {x:nil, x:1, headings:"N", commands:"MMMM" } }
		  Mower.count.should == 1
		end

		# it "POST /lawn create with error" do
		#   Lawn.count.should == 0
		#   post '/lawn', { :width=>2, :height: nil }
		#   Lawn.count.should == 0
		# end

		it "PUT /lawn/:id/mower/:mower_id update" do
		  lawn = Lawn.create(:width=>6, :height=>6, id:1)
		  awn.mowers.create(x:1, y:1, headings:"N", commands:"MMM", id: 1)

		  put '/lawn/:id/mower/:mower_id', { id: 1, mower_id: 1, mower: {x:2, x:1, headings:"S", commands:"MMMM"} }
		  mower_id.count.should == 1
		  Mower.first.width.should == 2
		  Mower.first.headings.should == "S"
		end

		it "DELETE /lawn/:id/mower/:mower_id delete" do
		  Lawn.create(:width=>6, :height=>6, id: 2)
		  awn.mowers.create(x:1, y:1, headings:"N", commands:"MMM", id: 1)

		  delete '/lawn/:id/mower/:mower_id', { id: 1, mower: 1 }
		  Lawn.count.should == 0
		end

		# describe "GET /lawns 2" do
  #   	before { get "lawns"
  #   	 @json = json_parse(last_response.body) 
  #   		@lawns =  json[:lawns] 
  #   	}

	 #    it "responds successfully" do
	 #      last_response.status.must_equal 200
	 #      json[:status].must_equal "success"
	 #    end

	 #    it "returns 3 lawns" do
	 #      lawns.size.must_equal 3
	 #    end
	 #  end

	 #  describe "POST /users" do
		#   before do
		#     post_json("/api/v1/users", {
		#       user: {
		#         name: "bob",
		#         email: "bob@test.com"
		#       }
		#     })
		#   end

		#   let(:resp) { json_parse(last_response.body) }

		#   it { resp[:status].must_equal "success" }
		#   it { resp[:user][:name].must_equal "bob" }
		#   it { resp[:user][:email].must_equal "bob@test.com" }
		# end
  # end
end