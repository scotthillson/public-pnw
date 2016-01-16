class Form < ActiveRecord::Base
  
  def self.upload(file)
    filename = file.original_filename
    path = "public/forms/#{filename}"
    File.rename(file.path,path)
    f = new
    f.path = path
    f.name = filename
    f.save
  end
  
  def in_use
    if Upload.dup_check(self.filename)
      true
    else
      false
    end
  end
  
end
