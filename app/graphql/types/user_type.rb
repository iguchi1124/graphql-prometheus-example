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
      articles = object.articles
      articles = articles.where('id > ?', cursor) if cursor
      articles = articles.limit(limit)
      ids = articles.pluck(:id)
      context[:article_loader].load_many(ids)
    end
  end
end
