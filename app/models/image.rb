class Image < ActiveRecord::Base

  def self.get_started
    Dir.entries('public').each do |file|
      if file.include? 'banner'
      end
    end
  end
  
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
    filename = file.original_filename
    return 'dup' if Dir.entries('public').include? filename
    path = "public/#{filename}"
    File.rename(file.path,path)
    image = MiniMagick::Image.open("#{Rails.root}/public/#{filename}")
    width = image.width
    if width > 700
      image.combine_options do |b|
        b.resize '1125x1125'
        b.crop '1125x600+0+0'
      end
      image.write "#{Rails.root}/public/#{filename}"
    else
      return 'small'
    end
    i = new
    i.path = path
    i.filename = filename
    i.save
  end
  
  def delete
    File.delete self.path if File.exist? self.path
  end
  
end
