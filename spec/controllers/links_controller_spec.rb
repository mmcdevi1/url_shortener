require 'rails_helper'

describe LinksController do
	let(:link) { Fabricate(:link) }

	describe 'GET index' do 
		before do 
			get :index
		end

		it 'sets the @link variable' do 
			expect(assigns(:link)).to be_instance_of Link
		end

		it 'sets the @links variable' do 
			expect(assigns(:links)).to eq([link])
		end

		it 'orders by clicks desc' do 
			link_1 = Fabricate(:link, clicks: 2)
			link_2 = Fabricate(:link, clicks: 1)
			expect(assigns(:links)).to eq([link_1, link_2])
		end

		it 'displays only the top 100 links' do 
			101.times do |i|
				i = Fabricate(:link, clicks: i)
			end
			expect(assigns(:links).count).to eq(100)
		end

		it 'renders in the index template' do 
			expect(response).to render_template :index
		end
	end

	describe 'GET show' do 
		it 'sets the @link variable' do 
			get :show, id: link.id 
			expect(assigns(:link)).to eq(link)
		end

		it 'redirects to the saved url' do 
			get :show, id: link.id
			expect(response).to redirect_to link.url
		end

		# it 'should increment the click by 1' do 
		# 	get :show, id: link.id 
		# 	expect(response).to redirect_to link.url
		# 	expect(link.clicks).to eq(1)
		# end	
	end

	describe 'POST create' do 
		context 'with valid inputs' do 
			before do 
				post :create, link: Fabricate.attributes_for(:link)
			end

			it 'creates a link in the database' do 
				expect(Link.count).to eq(1)
			end

			it 'redirects to the root path' do 
				expect(response).to redirect_to root_path
			end
		end

		context 'with invalid inputs' do 
			before do 
				post :create, link: { url: "" }
			end

			it 'does not create a link' do 
				expect(Link.count).to eq(0)
			end

			it 'redirects to the root path' do 
				expect(response).to redirect_to root_path
			end
		end
	end
end









































