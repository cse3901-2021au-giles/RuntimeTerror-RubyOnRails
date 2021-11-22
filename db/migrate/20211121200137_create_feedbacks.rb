class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :fid
      t.integer :team_id
      t.integer :course_id
      t.boolean :done
      t.text :body

      #Let rails know these are foreign keys
      # t.references :giveuser_id
      # t.references :receiveuser_id


      # Potentially incorrect
      t.integer :giveuser_id, :references => "user"
      t.integer :receiveuser_id, :references=> "user"

      t.timestamps
    end
  end

end
