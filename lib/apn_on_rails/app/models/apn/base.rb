module APN
  #class Base < ActiveRecord::Base # :nodoc:
  class Base # :nodoc:
    include Mongoid::Document	
    #def self.table_name # :nodoc:
    #  self.to_s.gsub("::", "_").tableize
    #end

  end
end
