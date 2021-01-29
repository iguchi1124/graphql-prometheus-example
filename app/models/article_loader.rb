class ArticleLoader
  class Data
    delegate :id, :title, :slug, :description, :body, to: :@model

    def initialize(model)
      @model = model
    end

    def user
      UserLoader.load(@model.user_id).first
    end

    def comments
      CommentLoader.load(comment_ids)
    end

    private

    def comment_ids
      Rails.cache.fetch("articles/#{@model.id}/comment_ids") { @model.comments.pluck(:id) }
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
      article_model = Rails.cache.fetch(cache_key(id)) { Article.find_by(id: id) }
      Data.new(article_model)
    end
  end

  private

  def cache_key(id)
    "articles/#{id}"
  end
end
