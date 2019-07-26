# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    # if self.length == 0
    #     return nil
    # end
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.empty?
    if self.length.odd?
        middle_idx = self.length / 2
        return self.sort[middle_idx]
    else
        sorted = self.sort
        middle_idx = self.length / 2
        first = sorted[middle_idx]
        second = sorted[middle_idx -1]
        return (first + second) / 2.0
    end
  end

  def counts
        # count = {}
    # starts at nil so we don't want to use the above
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1}
    count
  end

  def my_count(target)
    num = 0
        self.each do |ele|
            if ele == target
                num += 1
            end
        end
    num
  end

  def my_index(target)
    self.each_with_index do |ele, i|
        if ele == target
            return i
        end
    end
    nil
  end



#   def my_uniq
#     new_arr = []
#     self.each do |ele|
#         if !new_arr.include?(ele)
#             new_arr << ele
#         end
#     end
#     new_arr
#   end

  def my_uniq
    hash = {}
    self.each { |ele| hash[ele] = true }
    hash.keys
  end

  def my_transpose
    new_arr = []

    (0...self.length).each do |row|
      new_row = []

      (0...self.length).each do |col|
        new_row << self[col][row]
      end

      new_arr << new_row
    end

    new_arr
  end





end
