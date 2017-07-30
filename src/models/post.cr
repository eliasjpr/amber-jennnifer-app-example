class Post < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: {type: Int32, primary: true},
    title: {type: String, null: true, unique: false},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )
end
