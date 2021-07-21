module Types
  class ArticleType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :body, String, null: false
    field :user, UserType, null: false

    def user
      context[:user_loader].load(object.user_id)
    end

    field :comments, [CommentType], null: false

    def comments
      ids = object.comments.pluck(:id)
      context[:comment_loader].load_many(ids)
    end
  end
end
