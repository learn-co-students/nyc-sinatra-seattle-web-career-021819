class CreateFigures < ActiveRecord::Migration
  def change
    create_table :Figures do |t|
      t.string :name
    end
  end
end
