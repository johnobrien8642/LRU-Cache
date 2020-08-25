class HashSet
  attr_accessor :store, :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key] << key
    @count += 1
    resize! if num_buckets < self.count
    key
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self.count -= 1 if self[key].delete(key)
  end

  private

  def [](el)
    # optional but useful; return the bucket corresponding to `num`
    self.store[el.hash % num_buckets]
  end

  def num_buckets
    self.store.length
  end

  def resize!
    old_store = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |el| insert(el) }
  end
end
