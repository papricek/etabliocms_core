module EtabliocmsCore
  class User < ActiveRecord::Base

    devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable

    attr_accessible :email, :password, :password_confirmation, :remember_me

    has_paper_trail

  end
end
