image_seeds = [
  ['https://images.dog.ceo/breeds/terrier-norfolk/n02094114_1330.jpg', ['norfolk terrier']],
  ['https://images.dog.ceo/breeds/spaniel-blenheim/n02086646_127.jpg', ['blenheim spaniel', 'humans???']],
  ['https://images.dog.ceo/breeds/shiba/shiba-10.jpg', ['shiba inu']],
  ['https://images.dog.ceo/breeds/dhole/n02115913_312.jpg', ['dhole']],
  ['https://images.dog.ceo/breeds/chow/n02112137_7668.jpg', ['chow']],
  ['https://images.dog.ceo/breeds/chow/n02112137_16109.jpg', ['chow']],
  ['https://avatars.githubusercontent.com/u/15284810', ['chow', 'humans???']],
  ['https://images.dog.ceo/breeds/shiba/shiba-6.jpg', ['shiba inu']],
  ['https://images.dog.ceo/breeds/mountain-bernese/n02107683_4386.jpg', ['bernese mountain']],
  ['https://images.dog.ceo/breeds/pug/n02110958_6966.jpg', ['pug']],
  ['https://images.dog.ceo/breeds/dhole/n02115913_139.jpg', ['dhole']],
  ['https://images.dog.ceo/breeds/terrier-fox/n02095314_777.jpg', ['fox terrier', 'humans???']],
  ['https://images.dog.ceo/breeds/hound-afghan/n02088094_13145.jpg', ['afghan hound']],
  ['https://images.dog.ceo/breeds/hound-afghan/n02088094_13270.jpg', ['afghan hound']],
  ['https://images.dog.ceo/breeds/greyhound-italian/n02091032_1743.jpg', ['italian greyhound', 'humans???']],
  ['https://images.dog.ceo/breeds/elkhound-norwegian/n02091467_6920.jpg', ['norwegian elkhound']],
  ['https://images.dog.ceo/breeds/deerhound-scottish/n02092002_4230.jpg', ['scottish deerhound', 'humans???']],
  ['https://images.dog.ceo/breeds/boxer/n02108089_1560.jpg', ['boxer']],
  ['https://images.dog.ceo/breeds/setter-irish/n02100877_8321.jpg', ['irish setter', 'humans???']]
]

image_seeds.each do |url, tag_list|
  Image.create!(url: url, tag_list: tag_list)
end
