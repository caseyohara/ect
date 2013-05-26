require 'spec_helper'

describe Etc, "#collect" do
  it "returns a new array with the results of running block once for every element in enum" do
    Extend(1..4).collect { |i| i*i }.should == [1, 4, 9, 16]
    Extend(1..4).collect { "cat"  }.should == ["cat", "cat", "cat", "cat"]
  end
end


describe Etc, "#detect" do
  it "returns the first entry for which block is not false" do
    Extend(1..100).detect { |i| i % 5 == 0 and i % 7 == 0 }.should == 35
  end

  context "no object matches" do
    it "returns the result of calling ifnone when it is specified" do
      Extend(1..10).detect(->(){ 'sentinel' }) { |i| i % 5 == 0 and i % 7 == 0 }.should == 'sentinel'
    end

    it "returns nil when no ifnone is specified" do
      Extend(1..10).detect  { |i| i % 5 == 0 and i % 7 == 0 }.should == nil
    end
  end
end


describe Etc, "#inject" do
  context "with an initial value for memo" do
    it "returns the result of each element in enum passed the block an accumulator value (memo) and the element when a block is specified" do
      Extend(5..10).inject { |sum, n| sum + n }.should == 45
    end

    it "returns the result of each element in the collection passed to the named method of memo when a symbol is specified" do
      Extend(5..10).inject(:+).should == 45
    end
  end

  context "without an initial value for memo" do
    it "returns the result of each element in enum passed the block an accumulator value (memo) and the element when a block is specified" do
      Extend(5..10).inject(1) { |product, n| product * n }.should == 151200
    end

    it "returns the result of each element in the collection passed to the named method of memo when a symbol is specified" do
      Extend(5..10).inject(1, :*).should == 151200
    end
  end

  it "can be used to find the longest word" do
    Extend(%w{ cat sheep bear }).inject { |memo, word| memo.length > word.length ? memo : word }.should == "sheep"
  end
end


describe Etc, "#reject" do
  it "returns an array for all elements of enum for which the given block returns false" do
    Extend(1..10).reject { |i|  i % 3 == 0 }.should == [1, 2, 4, 5, 7, 8, 10]
    Extend([1, 2, 3, 4, 5]).reject { |num| num.even? }.should == [1, 3, 5]
  end
end


describe Etc, "#select" do
  it "returns an array containing all elements of enum for which the given block returns a true value" do
    Extend(1..10).select { |i|  i % 3 == 0 }.should == [3, 6, 9]
    Extend([1,2,3,4,5]).select { |num|  num.even?  }.should == [2, 4]
  end
end

