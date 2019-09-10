

class Restaurant{
  String title;
  String thumbnail;
  String category;
  int pricePerPerson;
  int deliveryDuration;
  String discountOption;
  double rating;
  int noOfRatings;
  String id;
  Restaurant(this.title, this.thumbnail, this.category, this.pricePerPerson,
      this.deliveryDuration, this.discountOption,this.rating,this.noOfRatings,this.id);

  Restaurant.named({this.title, this.thumbnail, this.category,
    this.pricePerPerson, this.deliveryDuration, this.discountOption,this.rating,this.noOfRatings,this.id});

}