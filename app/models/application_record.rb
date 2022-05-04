class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.paginate(page:, page_size:)
    count = self.count
    items = self.offset(page_size * page).take(page_size)
    {items: items, itemCount: count, page: page, page_size: page_size}
  end

end
