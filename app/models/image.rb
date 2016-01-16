class Image < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :image
  
  def self.upload(file)
    filename = file.original_filename
    path = "public/forms/#{filename}"
    File.rename(file.path,path)
    i = new
    i.path = path
    i.name = filename
    i.save
  end
  
  def in_use
    if Upload.dup_check(self.filename)
      true
    else
      false
    end
  end
  
end
