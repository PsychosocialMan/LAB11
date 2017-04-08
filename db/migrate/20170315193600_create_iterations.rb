class CreateIterations < ActiveRecord::Migration[5.0]
  def change
    create_table :iterations do |t|
      t.float :element
      t.float :square

      t.timestamps
    end
  end
end
