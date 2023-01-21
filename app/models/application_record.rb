class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
         validates :name, uniqueness: true, length:{in: 2..20 }
         validates :introduction, length: {maximum: 50 }
  
end
