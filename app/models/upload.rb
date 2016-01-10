class Upload < ActiveRecord::Base
  
  validates_presence_of :file
  
  def self.import_file(file)
    filename = file.original_filename
    path = "public/#{filename}"
    File.rename(file.path,path)
  end
  
  def self.dup_check(file)
    Dir.entries('public/').include? file
  end
  
end
