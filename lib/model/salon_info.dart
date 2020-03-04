class SalonInfo {
  final String name;
  final String location;
  final double rating;
  final int numberOfReviews;
  final String salonImageUrl;
  final List<SalonServiceModel> listOfSalonService;

  SalonInfo(this.name, this.location, this.rating, this.numberOfReviews, this.salonImageUrl, this.listOfSalonService);
}

class SalonServiceModel {
  final String serviceName;
  final String price;
  final String discountText;
  final timeToFinish;

  SalonServiceModel(this.serviceName, this.price, this.discountText, this.timeToFinish);
}
