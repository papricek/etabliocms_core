# This migration comes from etabliocms_core_engine (originally 20120222142355)
# This migration comes from etabliocms_core_engine (originally 20122202145113)
class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :email, :default => "", :null => false
      t.string :encrypted_password, :limit => 128, :default => "", :null => false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :users, ["email"], :name => "index_users_on_email", :unique => true
    add_index :users, ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

    EtabliocmsCore::User.create(:email => "patrikjira@gmail.com", :password => "heslo1", :password_confirmation => "heslo1")
  end

end

