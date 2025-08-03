class ProductModel {
  final String image;
  final String name;
  final String description;
  final String rating;
  final String price;
  bool isFavorite;
  final String bigdesc;
  final String timed;
  ProductModel({
    required this.image,
    required this.description,
    required this.rating,
    required this.price,
    required this.name,
    required this.isFavorite,
    required this.bigdesc,
    required this.timed,
  });
  static List<ProductModel> products = [
    ProductModel(
      image: "assets/image 3.png",
      description: "Wendy's Burger",
      rating: "4.9",
      price: "\$5",
      name: 'Cheeseburger',
      isFavorite: false,
      bigdesc:
          "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      timed: '26 mins',
    ),
    ProductModel(
      image: "assets/image 4.png",
      description: "Veggie Burger",
      rating: "4.8",
      price: "\$8",
      name: 'Hamburger',
      isFavorite: false,
      bigdesc:
          "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ",
      timed: '23 mins',
    ),
    ProductModel(
      image: "assets/image 5.png",
      description: "Chicken Burger",
      rating: "4.7",
      price: "\$6",
      name: 'Hamburger',
      isFavorite: false,
      bigdesc:
          "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
      timed: '23 mins',
    ),
    ProductModel(
      image: "assets/image 6.png",
      description: "Fried Chicken Burger",
      rating: "4.6",
      price: "\$9",
      name: 'Hamburger',
      isFavorite: false,
      bigdesc:
          "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      timed: '14 mins',
    ),
  ];
}
