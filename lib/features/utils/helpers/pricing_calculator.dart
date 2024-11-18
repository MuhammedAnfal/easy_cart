
class AppPricingCalculator {
    /// -- Calculate Price based on tax and shipping
    static double calculateTotalPrice(double productPrice, String location) {
      double taxRate = getTaxRateForLocation(location);
      double taxAmount = productPrice * taxRate;
      double shippingCost = getShippingCost(location);
      double totalPrice = productPrice + taxAmount + shippingCost;
      return totalPrice;
    }
    ///--Calculate shipping \cost
    static String calculateShippingCost (double productPrice, String location) {
      double shippingCost = getShippingCost (location);
     return shippingCost.toStringAsFixed(2);
    }
    /// -Calculate tax
    static String calculateTax (double productPrice, String location) {
      double taxRate = getTaxRateForLocation(location);
      double taxAmount = productPrice * taxRate;
      return taxAmount.toStringAsFixed(2);
    }

    static double getTaxRateForLocation(String location){
      // look up the tax rate for given location from a tax rate database or API
      // return the appropriate taxrate
      return 0.10;
    }
    static double getShippingCost(String location){
      // look up the shipping cost for given location using a shipping rate  or API
      // calculate the shipping cost based on the various factors like distance, weight ....etc
      return 5.0;
    }


/// ---sum all the cart values and return the total amount
// static double calculateTheCartTotoal((CartModel cart){
// retunTheCartItems.map((e) => e.price).fold(0,(previousPrice,currentPrice) => previousPrice +(currentPrice ?? 0));
//}
}