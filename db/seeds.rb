colors_names = [
  "red",
  "blue",
  "yellow",
  "green",
  "black",
  "white",
  "orange"
]

colors = colors_names.each do |name|
  Color.create(name: name)
end

colors_ids = Color.pluck(:id)

sizes_labels = [*5..50]

sizes = sizes_labels.each do |label|
  Size.create(label: label)
end

sizes_ids = Size.pluck(:id)

titles = [
  "Футболка модная",
  "Футболка стильная",
  "Рубашка модная",
  "Рубашка стильная",
  "Джинсы модные",
  "Джинсы стильные",
  "Брюки модные",
  "Брюки стильные",
  "Свитер стильный",
  "Свитер модный"
]

item_columns = [
  :title,
  :price,
  :available_in_store
]

items = []

1.upto(100000) do |i|
  items << [
    titles.sample,         # title
    [*100..10000].sample,  # price
    [true, false].sample,  # available_in_store
  ]
end

Item.import(item_columns, items, validate: false)

item_size_ids  = []
item_color_ids = []
1.upto(100000) do |i|
  2.times do
    item_size_ids  << [i, sizes_ids.sample ]
    item_color_ids << [colors_ids.sample, i]
  end
end

values = item_size_ids.map { |pair| "(#{pair.join(',')})" }.join(',')
Item.connection.execute("INSERT INTO items_sizes (item_id, size_id) VALUES #{values}")

values = item_color_ids.map { |pair| "(#{pair.join(',')})" }.join(',')
Item.connection.execute("INSERT INTO colors_items (color_id, item_id) VALUES #{values}")
