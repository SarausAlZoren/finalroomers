class Rooms {
  final String price;

  final String image;

  final String barangay;

  final String place;

  Rooms({this.price, this.place, this.barangay, this.image});

  static List<Rooms> allRooms() {
    var lstOfCities = new List<Rooms>();

    lstOfCities.add(new Rooms(
        price: "₱1200/month",
        place: "Cagayan De Oro City",
        barangay: "Lawesbra",
        image: "1.jpg"));
    lstOfCities.add(new Rooms(
        price: "₱1500/month",
        place: "Cagayan De Oro City",
        barangay: "Puntod",
        image: "2.jpg"));
    lstOfCities.add(new Rooms(
        price: "₱1100/month",
        place: "Cagayan De Oro City",
        barangay: "Patag",
        image: "3.jpg"));
    lstOfCities.add(new Rooms(
        price: "₱1200/month",
        place: "Cagayan De Oro City",
        barangay: "Bon Bon",
        image: "4.jpg"));
    lstOfCities.add(new Rooms(
        price: "₱1400/month",
        place: "Cagayan De Oro City",
        barangay: "Carmen",
        image: "5.jpg"));
    lstOfCities.add(new Rooms(
        price: "₱2200/month",
        place: "Cagayan De Oro City",
        barangay: "Iponan",
        image: "6.jpg"));
    lstOfCities.add(new Rooms(
        price: "₱3000/month",
        place: "Cagayan De Oro City",
        barangay: "Lapasan",
        image: "7.jpg"));

    lstOfCities.add(new Rooms(
        price: "₱1200/month",
        place: "Cagayan De Oro City",
        barangay: "Lawesbra",
        image: "8.jpg"));
    lstOfCities.add(new Rooms(
        price: "₱1600/month",
        place: "Cagayan De Oro City",
        barangay: "Patag",
        image: "9.jpg"));
    lstOfCities.add(new Rooms(
        price: "₱1700/month",
        place: "Cagayan De Oro City",
        barangay: "Carmen",
        image: "10.jpg"));

    return lstOfCities;
  }
}
