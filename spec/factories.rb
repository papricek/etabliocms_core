require 'ffaker'

FactoryGirl.define do

  sequence :email do |n|
    name = [Faker::Name.first_name, Faker::Name.last_name].map { |i| i.gsub(/\W/, '') }.join(".").downcase
    "#{name}#{n}@#{Faker::Internet.domain_name}"
  end

  factory :user, :class => 'EtabliocmsCore::User' do
    email
    password "123456"
    password_confirmation "123456"
  end

end
