FactoryBot.define do

    factory :user do
     nickname {"abe"}
     email {"kkk@gmail.com"}
     password {"111aaa@@@"}
     password_confirmation {"111aaa@@@"}
     family_name {"田中"} 
     first_name {"徹"}
     family_name_kana {"タナカ"}
     first_name_kana {"トオル"}
     birth_year {2000}
     birth_month {1}
     birth_date {1}
     city {"東京都"}
     address {"渋谷"}
     street {"あああ"}
   end

  end 
