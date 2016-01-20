class Image < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :image
  
  def self.get_started
    Dir.entries('public').each do |file|
      if file.include? 'jpg'
        puts file.class
        upload file
      end
    end
  end
  
  def self.upload(file)
    filename = file
    path = "public/#{filename}"
    #File.rename(file.path,path)
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
