class Gossip < ApplicationRecord

has_one :user, :class_name => "User"
belongs_to :user, :class_name => "User"





end
