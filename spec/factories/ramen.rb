FactoryBot.define do
  factory :ramen do
		association :user
    store_name       {'test'}
		ramen_name       {'test'}
		text             {'美味しい'}
		star_id          {2}
		after(:build) do |ramen|
      ramen.image.attach(io: File.open('public/images/ラーメン.jpeg'), filename: 'ラーメン.jpeg')
    end
  end
end
