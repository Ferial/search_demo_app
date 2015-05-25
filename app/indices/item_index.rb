ThinkingSphinx::Index.define :item, with: :active_record do
  indexes title,                  facet: true

  has colors.id, as: :color_ids,  facet: true
  has sizes.id,  as: :size_ids,   facet: true
  has price,                      facet: true
  has available_in_store,         facet: true
end
