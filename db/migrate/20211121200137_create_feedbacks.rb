class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :fid
      t.integer :team_id
      t.integer :course_id
      t.integer :giveuser_id
      t.integer :receiveuser_id
      t.boolean :done
      t.text :body

      t.timestamps
    end
  end
end
