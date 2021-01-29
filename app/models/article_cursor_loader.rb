class ArticleCursorLoader
  def self.load(cursor:, limit:)
    new(cursor: cursor, limit: limit).load
  end

  def initialize(cursor:, limit:)
    @cursor = cursor
    @limit = limit
  end

  def load
    ArticleLoader.load(article_ids)
  end

  private

  def article_ids
    Rails.cache.fetch(cache_key) do
      articles = Article.all
      articles = articles.where('id > ?', @cursor) if @cursor
      articles = articles.limit(@limit)
      articles.pluck(:id)
    end
  end

  def cache_key
    "article_cursor/#{@cursor}/limit/#{@limit}"
  end
end
