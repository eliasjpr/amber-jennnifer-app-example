class CreatePost20170729091047 < Jennifer::Migration::Base
  def up
    puts "Running Create Post migration"
    create_table(:posts) do |t|
      t.string :title
      t.timestamps
    end
  end

  def down
    drop_table(:posts)
  end
end
