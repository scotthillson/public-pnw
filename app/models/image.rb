class Image < ActiveRecord::Base
  
  def self.banners
    array = []
    Dir.entries('public').each do |file|
      if file.include? 'banner'
        array.push file
      end
    end
    array
  end
  
  def self.upload(file)
    filename = file
    path = "public/#{filename}"
    #File.rename(file.path,path)
    i = new
    i.path = path
    i.filename = filename
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
