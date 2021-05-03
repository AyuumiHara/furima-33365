class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :item_text
      t.integer :price
      t.references :user, foreign_key: true

      t.integer    :category_id     , null: false
      t.integer    :condition_id    , null: false
      t.integer    :shipping_fee_id , null: false
      t.integer    :area_id         , null: false
      t.integer    :shipping_day_id, null: false

      t.timestamps
    end
  end
end
