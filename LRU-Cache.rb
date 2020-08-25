  class LRUCache
    def initialize(size)
        @size = size
        @LRU = []
    end

    def count
      # returns number of elements currently in cache
      @LRU.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @LRU.include?(el)
        @LRU.delete(el)
        @LRU << el
      elsif @LRU.count >= @size
        @LRU.shift
        @LRU << el
      else
        @LRU << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @LRU
    end

    private
    # helper methods go here!

  end
