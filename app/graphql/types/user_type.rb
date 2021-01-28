module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :image, String, null: false
    field :articles, [ArticleType], null: false
  end
end
