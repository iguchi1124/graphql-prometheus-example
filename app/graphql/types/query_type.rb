module Types
  class QueryType < BaseObject
    field :user, UserType, null: true do
      argument :id, ID, required: true
    end

    def user(id:)
      UserLoader.load(id).first
    end

    field :article, ArticleType, null: true do
      argument :id, ID, required: true
    end

    def article(id:)
      ArticleLoader.load(id).first
    end

    field :articles, [ArticleType], null: true do
      argument :cursor, ID, required: false
      argument :limit, Integer, required: false
    end

    def articles(limit: 10, cursor: nil)
      ArticleCursorLoader.load(cursor: cursor, limit: limit)
    end
  end
end
