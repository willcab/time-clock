require 'rails_helper'

RSpec.describe Store, type: :model do
  
  let (:store) { Store.create( name: 'Store1', address: 'Street 123') }

	context 'when a store is create' do

  	it 'create new store' do
  		expect(store.name).to eq 'Store1'
  		expect(store.address).to eq 'Street 123'
  	end
  end

  context 'validations' do

  	it 'validates presence on name' do
  		store.name = ''
  		store.validate
  		expect(store.errors[:name]).to include("can't be blank")

  		store.name = 'Store'
  		store.validate
  		expect(store.errors[:name]).to_not include("can't be blank")
  	end

  	it 'validates presence on address' do
  		store.address = ''
  		store.validate
  		expect(store.errors[:address]).to include("can't be blank")

  		store.address = 'Street 123'
  		store.validate
  		expect(store.errors[:address]).to_not include("can't be blank")
  	end

  	it 'showld be invalid address' do
  		store = Store.new(name:'Store', address: 'Clle')
  		expect(store.valid?).to_not eq true
  	end
  end

end
