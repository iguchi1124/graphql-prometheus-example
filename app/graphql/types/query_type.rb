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
  end
end
