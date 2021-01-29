class UserLoader
  class Data
    delegate :id, :username, :image, to: :@model

    def initialize(model)
      @model = model
    end

    def articles
      ArticleLoader.load(article_ids)
    end

    private

    def article_ids
      Rails.cache.fetch("users/#{@model.id}/article_ids") { @model.articles.pluck(:id) }
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
      user_model = Rails.cache.fetch(cache_key(id)) { User.find_by(id: id) }
      Data.new(user_model)
    end
  end

  private

  def cache_key(id)
    "users/#{id}"
  end
end
