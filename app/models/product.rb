class Product < ApplicationRecord
  validates_presence_of :name, :price, :description

  def self.filter
    where(category: __callee__)
  end
  class << self
    alias_method :starters , :filter
    alias_method :main_courses , :filter
    alias_method :desserts , :filter
  end
end
