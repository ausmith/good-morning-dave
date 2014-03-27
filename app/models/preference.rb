class Preference < ActiveRecord::Base
  validates_presence_of :plugin, :name, :value
end
