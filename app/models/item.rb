class Item < ActiveRecord::Base
  include ThinkingSphinx::Scopes

  has_and_belongs_to_many :sizes
  has_and_belongs_to_many :colors

  sphinx_scope(:available_in_store) do
    { with: { available_in_store: true } }
  end

  sphinx_scope(:color_in) do |ids|
    { with: { color_ids: ids } }
  end

  sphinx_scope(:size_in) do |ids|
    { with: { size_ids: ids } }
  end

  sphinx_scope(:with_title) do |title|
    { conditions: { title: title } }
  end

  sphinx_scope(:max_price) do |price|
    { with: { price: 0..price } }
  end

  sphinx_scope(:min_price) do |price|
    { with: { price: price..(2**32) } }
  end

  sphinx_scope(:price_in_range) do |min_price, max_price|
    { with: { price: min_price..max_price } }
  end

  sphinx_scope(:order_by) do |attr_name, order|
    { order: "#{attr_name} #{order}" }
  end

  default_sphinx_scope :available_in_store

  #Item.color_in([3,4]).size_in([35,36]).with_title("Футболка").price_in_range(1000, 2000).order_by(:price, :asc)
end
