class Form < ActiveRecord::Base
  
  def self.upload(file,page="")
    filename = file.original_filename
    return 'no pdf' if !filename.include? '.pdf'
    if page == 'Equipment List'
      filename = 'equipment.pdf'
    elsif page == 'Donation Form'
      filename = 'donate.pdf'
    elsif page == 'Application'
      filename = 'application.pdf'
    else
      return 'no page'
    end
    path = "public/#{filename}"
    if File.rename(file.path,path)
      return true
    else
      return false
    end
  end
  
end
