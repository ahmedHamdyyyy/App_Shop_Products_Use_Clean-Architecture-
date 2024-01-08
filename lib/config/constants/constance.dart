enum Status { initial, loading, success, error }

class AppConst {
//collections
  static const buildRunner = 'flutter packages pub run build_runner build';
  static const buildRunnerClean = 'flutter packages pub run build_runner build --delete-conflicting-outputs';

//variables
  static const id = 'id';
  static const title = 'title';
  static const price = 'price';
  static const description = 'description';
  static const category = 'category';
  static const image = 'image';
  static const rating = 'rating';
  static const rate = 'rate';
  static const count = 'count';
  static const theme = 'theme';
  static const categories = 'categories';





  static const kFeatureBoxProducts = 'kFeature_BoxProducts';
  //static const kFeatureBoxCategory = 'kFeature_BoxCategory';
 // static const kFeatureBoxAllCategory = 'kFeatureBoxAllCategory';




//screens
  static const splashScreen = '/';
  static const signInScreen = '/signInScreen';
  static const signUpScreen = '/signUpScreen';
  static const adminScreen = '/adminHomeScreen';
  static const userScreen = '/userHomeScreen';
  static const addProductScreen = '/AddProductScreen';
  static const detailsScreen = '/detailsScreen';
  static const cutomerScreen = '/customerHomeScreen';




}
