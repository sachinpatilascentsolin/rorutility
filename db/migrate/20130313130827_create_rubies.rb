class CreateRubies < ActiveRecord::Migration
  def change
    create_table :rubies do |t|

      t.timestamps
    end
  end
end
