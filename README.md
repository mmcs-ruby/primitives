[![Build](https://github.com/mmcs-ruby/primitives/actions/workflows/main.yml/badge.svg)](https://github.com/mmcs-ruby/primitives/actions/workflows/main.yml)
<a href="https://codeclimate.com/github/mmcs-ruby/primitives/maintainability"><img src="https://api.codeclimate.com/v1/badges/d424b22ca6482d937001/maintainability" /></a>
<a href="https://codeclimate.com/github/mmcs-ruby/primitives/test_coverage"><img src="https://api.codeclimate.com/v1/badges/d424b22ca6482d937001/test_coverage" /></a>

# Primitives

Primitives is a gem for performing Boolean operations with
2D geometry primitives. Made by MMCS students as a lab work.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'primitives'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install primitives

## Usage

You can perform a boolean operation only for pair of shapes of the same type:

```ruby
p1t1 = Point.new(1.0, 1.0)
p2t1 = Point.new(4.0, 1.0)
p3t1 = Point.new(3.0, 3.0)
t1 = Triangle.new(p1t1, p2t1, p3t1)

p1t2 = Point.new(3.0, 2.0)
p2t2 = Point.new(7.0, 2.0)
p3t2 = Point.new(5.0, 4.0)
t2 = Triangle.new(p1t2, p2t2, p3t2)

triangles = PolygonSet.new([t1, t2])
plot(triangles)

intersection_result = intersect_triangles(t1, t2)
plot(intersection_result)
```

```ruby
p1 = Point.new(2.2, 3.3)
p2 = Point.new(5.5, 6.6)
ls = LineSegment.new(p1,p2)
# find a length of a line segment based on two points
lenght = ls.length
# return straight line object
StraightLine sl = ls.to_straight_line


```

![triangles_example](docs/images/triangles_example.png)

![intersect_triangles_example](docs/images/intersect_triangles_example.png)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mmcs-ruby/primitives. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mmcs-ruby/primitives/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Primitives project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mmcs-ruby/primitives/blob/master/CODE_OF_CONDUCT.md).
