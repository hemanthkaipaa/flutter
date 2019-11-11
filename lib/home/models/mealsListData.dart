class MealsListData {
  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> meals;
  int kacl;

  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = "",
    this.endColor = "",
    this.meals,
    this.kacl = 0,
  });

  static List<MealsListData> tabIconsList = [
    MealsListData(
      imagePath: 'assets/icons/boy.png',
      titleTxt: 'Hemanth',
      kacl: 525,
      meals: ["Bread,", "Peanut butter,", "Apple"],
      startColor: "#FA7D82",
      endColor: "#FFB295",
    ),
    MealsListData(
      imagePath: 'assets/icons/boy.png',
      titleTxt: 'Kumar',
      kacl: 602,
      meals: ["Salmon,", "Mixed veggies,", "Avocado"],
      startColor: "#738AE6",
      endColor: "#5C5EDD",
    ),
    MealsListData(
      imagePath: 'assets/icons/boy.png',
      titleTxt: 'Reddy',
      kacl: 0,
      meals: ["Recommend:", "800 kcal"],
      startColor: "#FE95B6",
      endColor: "#FF5287",
    ),
    MealsListData(
      imagePath: 'assets/icons/boy.png',
      titleTxt: 'Kaipa',
      kacl: 0,
      meals: ["Recommend:", "703 kcal"],
      startColor: "#6F72CA",
      endColor: "#1E1466",
    ),
  ];
}
