class CommentLoader
  class Data
    delegate :id, :body, to: :@model

    def initialize(model)
      @model = model
    end

    def user
      UserLoader.load(@model.user_id).first
    end
  end

  def self.load(ids)
    new(ids).load
  end

  def initialize(ids)
    @ids = Array(ids)
  end

  def load
    @ids.map do |id|
      comment_model = Rails.cache.fetch(cache_key(id)) { Comment.find_by(id: id) }
      Data.new(comment_model)
    end
  end

  private

  def cache_key(id)
    "comments/#{id}"
  end
end
