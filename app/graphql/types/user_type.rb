module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :image, String, null: false
    field :articles, [ArticleType], null: false do
      argument :cursor, ID, required: false
      argument :limit, Integer, required: false
    end

    def articles(limit: 10, cursor: nil)
      ArticleCursorLoader.load(cursor: cursor, limit: limit)
    end
  end
end
