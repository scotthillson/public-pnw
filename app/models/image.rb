class Image < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :image
  
  def self.import_file(file)
  end
  
  def in_use
    if Upload.dup_check(self.filename)
      true
    else
      false
    end
  end
  
end
