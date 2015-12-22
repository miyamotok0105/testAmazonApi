require 'Vacuum'
require 'json'


#1時間に2000リクエストまで
request = Vacuum.new('JP')

request.configure(
    aws_access_key_id: 'hoge',
    aws_secret_access_key: 'hoge',
    associate_tag: 'hoge'
)

#response = request.browse_node_lookup(
#  query: {
#    'BrowseNodeId' => 123
#  }
#)
# response = request.item_search(
#  query: {
#    'Keywords' => '文房具',
#    'SearchIndex' => 'OfficeProducts',
#    'ItemPage' => '1'

#  }
# )
# response = request.item_lookup(
#  query: {
#    'ItemId' => 'B00JUDMGXM',
#    'OfferPage' => '1'
#  }
# )

  response = request.cart_create(
    query: {
      'HMAC' => 'secret',
      'Item.1.ASIN' => 'B00JUDMGXM',
      'Item.1.Quantity' => 1
    }
  )

  data = Hash.new
  data = JSON.parse(JSON.generate(response.to_h))
  day =  Time.now

  puts format("%04d", day.year) + format("%04d", day.month) + format("%04d", day.day)
  puts data["CartCreateResponse"]["Cart"]["CartItems"]["CartItem"]["ASIN"]
  puts data["CartCreateResponse"]["Cart"]["CartItems"]["CartItem"]["Quantity"]
  puts data["CartCreateResponse"]["Cart"]["CartItems"]["CartItem"]["Title"]
  puts data["CartCreateResponse"]["Cart"]["CartItems"]["CartItem"]["ProductGroup"]
  puts data["CartCreateResponse"]["Cart"]["CartItems"]["CartItem"]["Price"]["Amount"]




