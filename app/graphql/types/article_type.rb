module Types
  class ArticleType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :body, String, null: false
    field :user, UserType, null: false
    field :comments, [CommentType], null: false
  end
end
