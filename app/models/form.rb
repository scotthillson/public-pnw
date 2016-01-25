class Form < ActiveRecord::Base
  
  def self.upload(file,page="")
    filename = file.original_filename
    return 'no pdf' if !filename.include? '.pdf'
    path = "public/#{filename}"
    File.rename(file.path,path)
    f = new
    f.page = page
    f.path = path
    f.name = filename
    f.save
  end
  
end
