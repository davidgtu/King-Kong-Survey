class CreateUserStory < ActiveRecord::Migration
  def change
    create_table :user_surveys do |t|
      t.belongs_to :user
      t.belongs_to :survey
    end
  end
end
