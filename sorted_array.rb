class SortedArray
  attr_reader :internal_arr

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end

  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end

    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block
    i = 0
    while i < @internal_arr.size
      yield @internal_arr[i]
      i+=1
    end
    @internal_arr
  end

  def map &block
    
    i = 0
    until i == @internal_arr.size
      yield @internal_arr[i]
    i+=1
    end
    return @internal_arr
  end
    # new_array = []
    # map_block = @internal_arr.map {|el| el}
    # new_array<< map_block
    # yield 
    # return new_array.flatten!


    # map_block = Proc.new {|el| el}
    # yield map_block.map(@internal_arr) {|el| el}

  def map! &block
    new_array = []
    i = 0
    until i == @internal_arr.size
    new_array << (yield @internal_arr[i]) 
    i+=1
    end
    return new_array
end

  def find &block
  #   i = 0 
  #   self.each do |x|
  #     if value == x
  #       return value
  #     else
  #     i+=1
  #   end
  # end


   i = 0
    until i == @internal_arr.size
    if yield @internal_arr[i]
      return @internal_arr[i]
    else
      i+= 1    
    end
    end

    #    i=0
    # until i == @internal_arr.size 
    #   if yield(@internal_arr[i])
    #     return @internal_arr[i] 
    #   else
    #     i+=1
    #   end
    # end
  
  return nil
    # @internal_arr.each_with_index.select { |num, index| num > 0}.map { |pair| pair[1] }
    #compare exessive elements in the array
  end

  def inject acc=nil, &block
    raise NotImplementedError.new("You need to implement the inject method!")
  end
end

