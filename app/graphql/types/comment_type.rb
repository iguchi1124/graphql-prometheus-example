module Types
  class CommentType < BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user, UserType, null: false

    def user
      context[:user_loader].load(object.user_id)
    end
  end
end
