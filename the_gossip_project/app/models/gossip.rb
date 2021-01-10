class Gossip < ApplicationRecord
  belongs_to :user
  has_many :JoinTableTagGossips
  has_many :tags, through: :JoinTableTagGossips

  validates :title, presence: true, 
  length: { minimum: 3, maximum: 20, message: "Le titre doit contenir entre 3 et 14 caractères."} 
  validates :content,presence: true
end
