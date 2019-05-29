class Size < ActiveHash::Base
    self.data = [
      {id: 1, name: '---'},
      {id: 2, name: 'XXS以下'}, {id: 3, name: 'XS(SS)'}, {id: 4, name: 'S'},
      {id: 5, name: 'M'},
      {id: 6, name: 'L'}, {id: 7, name: 'XL(LL)'}, {id: 8, name: '2XL(3L)'},
      {id: 9, name: '3XL(4L)'}, {id: 10, name: '4XL(5L()以上'}, {id: 11, name: 'FREE SIZE'},
    ]
  end
  