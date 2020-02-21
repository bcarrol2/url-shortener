class Convert < ApplicationRecord
    validates :long_url, presence: true, length: { minimum: 7 }
    validates :new_url, presence: true
end
