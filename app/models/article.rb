class Article < ApplicationRecord 
    belongs_to :user
    # this will validate that the title should not be empty
    validates :title, presence: true
    # this will validate that the description should not be empty
    validates :description, presence: true, length: {minimum: 10, maximum: 400}
    # validates the length of title should not be less then 3 and not more than 50
    validates :title, length: {minimum: 3, maximum: 50}
    validates :user_id, presence: true
end