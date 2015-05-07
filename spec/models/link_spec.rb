require 'rails_helper'

describe Link do
	describe 'validations' do 
		it { should validate_presence_of(:url) }
	end

	describe '#create_slug' do 
		let(:link) { Link.create(id:10, url: "http://www.google.com") }

		it 'creates a slug based on id' do 
			expect(link.slug).to eq('a')
		end
	end
end
