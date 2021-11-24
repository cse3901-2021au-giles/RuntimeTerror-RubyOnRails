class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :fid
      t.integer :team_id
      t.integer :course_id

      t.references :giveuser, null: false 
      t.references :receiveuser, null: false 

      t.boolean :done
      t.text :body

      t.timestamps
    end
    
    add_foreign_key :feedbacks, :users, column: :giveuser_id
    add_foreign_key :feedbacks, :users, column: :receiveuser_id
  end
end
