class Pokemon < ActiveRecord::Base
  has_many :users, through: :pokemon_users
end
