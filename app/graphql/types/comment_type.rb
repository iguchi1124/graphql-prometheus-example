module Types
  class CommentType < BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user, UserType, null: false
  end
end
