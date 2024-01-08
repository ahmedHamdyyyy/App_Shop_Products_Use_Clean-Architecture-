class ApiConstance{
  static const baseUrl="https://fakestoreapi.com/";
  static const products="${baseUrl}products";
  static const categories="${baseUrl}products/categories";
  //static const getCategories="products/category/:";
    static    getCategories(String categories)=>"${baseUrl}products/category/$categories";

/*  static const register="auth/register";
  static const login="auth/login";
  static const logout="auth/logout";
  static const user="user/profile";*/


}