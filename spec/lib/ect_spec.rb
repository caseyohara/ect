require 'spec_helper'

describe Etc, "#collect" do
  it "returns a new array with the results of running block once for every element in enum" do
    array = [1, 2, 3, 4].extend(Etc)
    array.collect { |i| i*i }.should == [1, 4, 9, 16]
    array.collect { "cat"  }.should == ["cat", "cat", "cat", "cat"]
  end
end


describe Etc, "#detect" do
  it "returns the first entry for which block is not false" do
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].extend(Etc)
    array.detect { |i| i % 5 == 0 and i % 7 == 0 }.should == 35
  end

  context "no object matches" do
    it "returns the result of calling ifnone when it is specified" do
      array = [1, 2, 3, 4, 5].extend(Etc)
      array.detect(->(){ 'sentinel' }) { |i| i % 5 == 0 and i % 7 == 0 }.should == 'sentinel'
    end

    it "returns nil when no ifnone is specified" do
      array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].extend(Etc)
      array.detect  { |i| i % 5 == 0 and i % 7 == 0 }.should == nil
    end
  end
end


describe Etc, "#inject" do
  context "with an initial value for memo" do
    it "returns the result of each element in enum passed the block an accumulator value (memo) and the element when a block is specified" do
      array = [5, 6, 7, 8, 9, 10].extend(Etc)
      array.inject { |sum, n| sum + n }.should == 45
    end

    it "returns the result of each element in the collection passed to the named method of memo when a symbol is specified" do
      array = [5, 6, 7, 8, 9, 10].extend(Etc)
      array.inject(:+).should == 45
    end
  end

  context "without an initial value for memo" do
    it "returns the result of each element in enum passed the block an accumulator value (memo) and the element when a block is specified" do
      array = [5, 6, 7, 8, 9, 10].extend(Etc)
      array.inject(1) { |product, n| product * n }.should == 151200
    end

    it "returns the result of each element in the collection passed to the named method of memo when a symbol is specified" do
      array = [5, 6, 7, 8, 9, 10].extend(Etc)
      array.inject(1, :*).should == 151200
    end
  end

  it "can be used to find the longest word" do
    array = ['cat', 'sheep', 'bear'].extend(Etc)
    array.inject { |memo, word| memo.length > word.length ? memo : word }.should == "sheep"
  end
end


describe Etc, "#reject" do
  it "returns an array for all elements of enum for which the given block returns false" do
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].extend(Etc)
    array.reject { |i|  i % 3 == 0 }.should == [1, 2, 4, 5, 7, 8, 10]

    array = [1, 2, 3, 4, 5].extend(Etc)
    array.reject { |num| num.even? }.should == [1, 3, 5]
  end
end


describe Etc, "#select" do
  it "returns an array containing all elements of enum for which the given block returns a true value" do
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].extend(Etc)
    array.select { |i|  i % 3 == 0 }.should == [3, 6, 9]

    array = [1, 2, 3, 4, 5].extend(Etc)
    array.select { |num|  num.even?  }.should == [2, 4]
  end
end

