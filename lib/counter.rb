# frozen_string_literal: true

module Counter
  def self.most_page_views(hash)
    new_hash = {}
    hash.each do |key, value|
      new_hash[key] = value.count
    end
    sort_hash(new_hash).to_h
  end

  def self.unique_most_page_views(hash)
    new_hash = {}
    hash.each do |k, v|
      new_hash[k] = v.uniq!.count
    end
    sort_hash(new_hash).to_h
  end

  def self.sort_hash(views_hash)
    views_hash.sort_by { |_k, v| v }.reverse
  end
end
