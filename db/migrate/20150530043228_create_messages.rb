class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.string :content
        t.references :sender
        t.references :recipient

    end
  end
end
