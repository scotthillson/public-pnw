class Form < ActiveRecord::Base
  
  def self.import_form(file)
  end
  
  def in_use
    if Upload.dup_check(self.filename)
      true
    else
      false
    end
  end
  
end
