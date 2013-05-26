## Quick kata: <br> Implement the *ect methods of Ruby's Enumerable module 

**Enumberable docs (1.9.3):**
[http://ruby-doc.org/core-1.9.3/Enumerable.html](http://ruby-doc.org/core-1.9.3/Enumerable.html)


<table>
  <thead>
    <tr>
      <td colspan="2"><strong>Solutions</strong></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://github.com/caseyohara/">caseyohara</a></td>
      <td><a href="https://gist.github.com/caseyohara/5651968">https://gist.github.com/caseyohara/5651968</a></td>
    </tr>
  </tbody>
</table>

### Submit your solutions:

```bash
$ git clone git@github.com:caseyohara/ect.git
$ cd ect
$ rspec spec
```

- edit `lib/ect.rb` to make the specs green
- post your `lib/ect.rb` as a [gist](https://gist.github.com/)
- [pull request](https://github.com/caseyohara/ect/pull/new/master) a change to this README that adds a link to your gist
- -or- [create an issue](https://github.com/caseyohara/ect/issues/new) with a link to your gist

<br>

```ruby
# collect
(1..4).collect { |i| i*i }.should == [1, 4, 9, 16]
(1..4).collect { "cat"  }.should == ["cat", "cat", "cat", "cat"]

# detect
(1..100).detect { |i| i % 5 == 0 and i % 7 == 0 }.should == 35
(1..10).detect(->(){ 'sentinel' }) { |i| i % 5 == 0 and i % 7 == 0 }.should == 'sentinel'
(1..10).detect  { |i| i % 5 == 0 and i % 7 == 0 }.should == nil

# inject
(5..10).inject { |sum, n| sum + n }.should == 45
(5..10).inject(:+).should == 45
(5..10).inject(1) { |product, n| product * n }.should == 151200
(5..10).inject(1, :*).should == 151200
%w{ cat sheep bear }.inject { |memo, word| memo.length > word.length ? memo : word }.should == "sheep"

# reject
(1..10).reject { |i|  i % 3 == 0 }.should == [1, 2, 4, 5, 7, 8, 10]
[1, 2, 3, 4, 5].reject { |num| num.even? }.should == [1, 3, 5]

# #select
(1..10).select { |i|  i % 3 == 0 }.should == [3, 6, 9]
[1,2,3,4,5].select { |num|  num.even?  }.should == [2, 4]
```


## todo
- Use Ruby 2.0 with `refine` instead of `Extend`
