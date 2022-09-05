require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:all) do
  	@store = Store.create(name: 'Store1', address: 'Street 1234')
  end

  describe "stores test actions" do

		it 'render a index of stores' do
			get :index
			expect(response).to render_template("index")
		end

		it 'check that a new store' do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe 'test of creation store' do

		it 'check that a store can be created' do
			expect(@store).to be_valid
		end		
	end

	describe 'test of edit store' do

		it  'checks that a store can be update' do
			@store.update(:name => 'store2')
			expect(Store.find_by_name('store2')). to eq(@store)
		end
	end

	describe 'test of destroy store' do

		it 'eliminar' do
			store_id = @store.id

			@store = Store.find(@store.id)
      @store.destroy	

      expect{Store.find(store_id)}.to raise_error(ActiveRecord::RecordNotFound)
		end

	end
end
