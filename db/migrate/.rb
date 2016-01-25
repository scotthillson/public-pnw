class ImageSpecs < ActiveRecord::Migration
  def change
    add_column :images, :width, :sting
    add_column :images, :height, :string
  end
end
