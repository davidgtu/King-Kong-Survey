class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :prompt, null:false
      t.belongs_to :survey

      t.timestamps null:false
    end
  end
end
