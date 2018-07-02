module Concerns

  module Findable
    def find_by_name(name)
      all.find { |obj| obj.name == name }
    end

    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
  end

  module InstanceMethods
    def initialize(name)
      @name = name
      save
    end

    def save
      # self.class - You are taking the specific class to which the module extends
      # class_variable_get() - is getting a specific variable inside of the class.
      # This function appends the instance object itself to the class variable which
      self.class.class_variable_get(:@@all) << self
    end
  end

  module ClassMethods
    def all
      self.class_variable_get(:@@all)
    end

    def destroy_all
      all.clear
    end

    def create(name)
      new_obj = self.new(name)
      new_obj
    end
  end

end
