module Types
  class QueryType < BaseObject
    field :user, UserType, null: true do
      argument :id, ID, required: true
    end

    def user(id:)
      context[:user_loader].load(id)
    end

    field :article, ArticleType, null: true do
      argument :id, ID, required: true
    end

    def article(id:)
      context[:article_loader].load(id)
    end

    field :articles, [ArticleType], null: true do
      argument :cursor, ID, required: false
      argument :limit, Integer, required: false
    end

    def articles(limit: 10, cursor: nil)
      articles = Article.all
      articles = articles.where('id > ?', cursor) if cursor
      articles = articles.limit(limit)
      ids = articles.pluck(:id)
      context[:article_loader].load_many(ids)
    end
  end
end
