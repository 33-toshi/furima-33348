class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :products_name,         null: false
      t.text    :description,           null: false
      t.integer :category_id,           null: false
      t.integer :detail_id,             null: false
      t.integer :delivery_fee_id,       null: false
      t.integer :area_id,               null: false
      t.integer :duration_id,           null: false
      t.integer :price,                 null: false
      t.references :user,               foreign_key: true
      t.timestamps
    end
  end
end
