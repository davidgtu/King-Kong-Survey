class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title, null:false
      t.string :about, null:false
      t.belongs_to :author

      t.timestamps null:false
    end
  end
end
