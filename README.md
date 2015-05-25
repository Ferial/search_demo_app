### Install

```
$ git clone https://github.com/Ferial/search_demo_app
$ cd search_demo_app
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rake ts:index
```

### Run and try
```
$ rails console
```
```ruby
Item.color_in(3,4).size_in(35,36).with_title("Футболка").price_in_range(1000, 2000).order_by(:price, :asc)
```
