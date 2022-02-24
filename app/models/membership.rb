class Membership < ApplicationRecord
    belongs_to :gym 
    belongs_to :client
    validates :gym_id, presence: true
    validates :client_id, presence: true
    validates :charge, presence: true
    validate :unique_for_gym

    def unique_for_gym
        client = Client.find(self.client.id)
        if client.gyms.include?(self.gym) 
            errors.add(:client_id, "Already member of gym")
        end
    end

end
