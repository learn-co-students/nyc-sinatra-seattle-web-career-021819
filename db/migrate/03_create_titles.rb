class CreateTitles < ActiveRecord::Migration
  def change
    create_table :Titles do |t|
      t.string :name
    end
  end
end
