class Restaurant {
  final String name;
  final String image;
  final String location;
  final double rating;
  final int deliveryTime;
  final String priceRange;
  final List<String> foodTypes;

  Restaurant({
    required this.name,
    required this.image,
    required this.location,
    required this.rating,
    required this.deliveryTime,
    required this.priceRange,
    required this.foodTypes,
  });
}

class MenuItem {
  final String title;
  final String description;
  final String image;
  final String price;
  final String category;

  MenuItem({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
  });
}

List<String> demoBanners = [
  "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=800&q=80",
  "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=800&q=80",
  "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?auto=format&fit=crop&w=800&q=80",
];

List<Restaurant> demoPartners = [
  Restaurant(
    name: "McDonald's",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=80",
    location: "San Francisco",
    rating: 4.5,
    deliveryTime: 25,
    priceRange: "\$\$",
    foodTypes: ["Chinese", "American"],
  ),
  Restaurant(
    name: "Daylight Coffee",
    image: "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=800&q=80",
    location: "San Francisco",
    rating: 4.5,
    deliveryTime: 25,
    priceRange: "\$\$",
    foodTypes: ["Coffee", "Bakery"],
  ),
];

List<MenuItem> demoMenus = [
  MenuItem(
    title: "Cookie Sandwich",
    description: "Shortbread, chocolate turtle cookies, and red velvet.",
    image: "https://images.unsplash.com/photo-1558961363-fa8fdf82db35?auto=format&fit=crop&w=500&q=80",
    price: "USD7.4",
    category: "Chinese",
  ),
  MenuItem(
    title: "Cookie Sandwich",
    description: "Shortbread, chocolate turtle cookies, and red velvet.",
    image: "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?auto=format&fit=crop&w=500&q=80",
    price: "USD7.4",
    category: "Chinese",
  ),
  MenuItem(
    title: "Cookie Sandwich",
    description: "Shortbread, chocolate turtle cookies, and red velvet.",
    image: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=500&q=80",
    price: "USD7.4",
    category: "Chinese",
  ),
];