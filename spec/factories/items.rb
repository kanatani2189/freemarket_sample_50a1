FactoryBot.define do

    factory :item do
     name {"商品名"}
     description {"商品説明"}
     size {"XS(SS)"}
     brand_id {1}
     condition {"新品、未使用"}
     shipping_burden {"送料込（出品者負担"}
     shipping_method {"らくらく便"}
     prefecture_id {1}
     estimated_date {"1〜2日"}
     price {1000}
   end

  end 


# item = Item.new(name: "商品名", description: "商品説明", size: "XS(SS)", brand_id: 1, condition: "新品、未使用", shipping_burden: "送料込（出品者負担）", shipping_method: "らくらく便", prefecture_id: 1, estimated_date: "1〜2日", price: 100)
