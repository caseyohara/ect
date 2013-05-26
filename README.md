## Implement the *ect methods of Ruby's Enumerable module

[http://ruby-doc.org/core-1.9.3/Enumerable.html](http://ruby-doc.org/core-1.9.3/Enumerable.html)

# #collect
```ruby
(1..4).collect { |i| i*i }.should == [1, 4, 9, 16]
(1..4).collect { "cat"  }.should == ["cat", "cat", "cat", "cat"]
```

# #detect
```ruby
(1..100).detect { |i| i % 5 == 0 and i % 7 == 0 }.should == 35
(1..10).detect(->(){ 'sentinel' }) { |i| i % 5 == 0 and i % 7 == 0 }.should == 'sentinel'
(1..10).detect  { |i| i % 5 == 0 and i % 7 == 0 }.should == nil
```

# #inject
```ruby
(5..10).inject { |sum, n| sum + n }.should == 45
(5..10).inject(:+).should == 45
(5..10).inject(1) { |product, n| product * n }.should == 151200
(5..10).inject(1, :*).should == 151200
%w{ cat sheep bear }.inject { |memo, word| memo.length > word.length ? memo : word }.should == "sheep"
```

# #reject
```ruby
(1..10).reject { |i|  i % 3 == 0 }.should == [1, 2, 4, 5, 7, 8, 10]
[1, 2, 3, 4, 5].reject { |num| num.even? }.should == [1, 3, 5]
```

# #select
```ruby
(1..10).select { |i|  i % 3 == 0 }.should == [3, 6, 9]
[1,2,3,4,5].select { |num|  num.even?  }.should == [2, 4]
```

