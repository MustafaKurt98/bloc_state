class GlobalModel {
  final String title;
  final int value;

  GlobalModel(this.title, this.value);

  static List<GlobalModel> mockItems =
      List.generate(10, (index) => GlobalModel("$index ----",index));
}
