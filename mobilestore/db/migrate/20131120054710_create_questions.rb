class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :mobile
      t.text :your_question

      t.timestamps
    end
  end
end
