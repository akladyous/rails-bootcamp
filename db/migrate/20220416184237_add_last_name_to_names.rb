class AddLastNameToNames < ActiveRecord::Migration[7.0]
  def change
    add_column :names, :last_name, :string
  end
end
