class CreateUniversities < ActiveRecord::Migration[6.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :location
      t.string :url

      t.timestamps
    end
  end
end
