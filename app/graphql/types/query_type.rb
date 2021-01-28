module Types
  class QueryType < BaseObject
    field :user, UserType, null: true do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :article, ArticleType, null: true do
      argument :id, ID, required: true
    end

    def article(id:)
      Article.find(id)
    end

    field :articles, [ArticleType], null: true do
      argument :cursor, ID, required: false
      argument :limit, Integer, required: true
    end

    def articles(limit:, cursor: nil)
      articles = Article.all
      articles = articles.where('id > ?', cursor) if cursor
      articles.limit(limit)
    end
  end
end
