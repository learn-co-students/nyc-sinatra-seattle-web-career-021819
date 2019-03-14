class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :Figure_titles do |t|
      t.integer :title_id
      t.integer :figure_id
    end
  end
end
