class CreateGoalTaggings < ActiveRecord::Migration
  def change
    create_table :goal_taggings do |t|
      t.references :goal, null: false
      t.integer :taggable_id, null: false
      t.string :taggable_type, null: false
    end

    add_index :goal_taggings, [:taggable_id, :taggable_type]
    add_index :goal_taggings, :goal_id
    add_index :goal_taggings, [:goal_id, :taggable_id, :taggable_type], unique: true, name: 'unique_pairs'
  end
end
