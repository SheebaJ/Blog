class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :string
    add_column :users, :mobile, :string
  end
end
