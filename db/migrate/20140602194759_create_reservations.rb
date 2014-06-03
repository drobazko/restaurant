class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :number, :null => false
      t.datetime :start, :null => false
      t.datetime :end, :null => false

      t.timestamps
    end
  end
end
