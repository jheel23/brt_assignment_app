class ApiEndpoints {
  static const String baseUrl = "https://dummyjson.com";
  static const String products = "/products";
  static const String searchProducts = "/products/search";
  static const String categories = "/products/categories";
  static String categoryProducts(String category) =>
      "/products/category/$category";
}
