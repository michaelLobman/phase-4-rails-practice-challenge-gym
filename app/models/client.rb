class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    def total_membership_cost
        self.memberships.reduce(0) {|sum, mbr| sum + mbr.charge}
    end
end
