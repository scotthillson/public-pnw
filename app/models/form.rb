class Form < ActiveRecord::Base
  
  def self.upload(file,type="")
    filename = file.original_filename
    return 'no pdf' if !filename.include? '.pdf'
    path = "public/#{filename}"
    File.rename(file.path,path)
    f = new
    f.path = path
    f.name = filename
    f.save
  end
  
end
