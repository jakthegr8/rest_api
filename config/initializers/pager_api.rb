# Use this module to configure pager the available options
#
# Made with love by @icalialabs

PagerApi.setup do |config|
  config.pagination_handler = :will_paginate
  config.include_pagination_on_meta = true
  config.include_pagination_headers = true
  config.total_count_header = "X-Total-Count"
end
