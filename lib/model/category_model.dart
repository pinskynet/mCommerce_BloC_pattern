import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String name;
  final String imgUrl;

  const CategoryModel({
    required this.name,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [name, imgUrl];

  static CategoryModel fromSnapshot(DocumentSnapshot snapshot) {
    CategoryModel category = CategoryModel(
      name: snapshot['name'],
      imgUrl: snapshot['imageUrl'],
    );

    return category;
  }

  static List<CategoryModel> categories = [
    const CategoryModel(
      name: 'Soft drink',
      imgUrl:
          'https://media.istockphoto.com/photos/group-of-hands-toasting-with-softdrinks-at-a-sidewalk-caf-picture-id467308575?b=1&k=20&m=467308575&s=170667a&w=0&h=2efyTXqFAdTVs3QVmrr9AJ-mo6_EWjiDrg3tEjLKZlk=',
    ),
    const CategoryModel(
      name: 'Smoothies',
      imgUrl:
          'https://media.istockphoto.com/photos/triple-fruity-smoothie-treat-peach-strawberry-and-blackberry-picture-id150506636?b=1&k=20&m=150506636&s=170667a&w=0&h=96nHSbf_3mlTkfklkcz0qPYDESow9F9DboyEfcgT2fc=',
    ),
    const CategoryModel(
      name: 'Water',
      imgUrl:
          'https://media.istockphoto.com/photos/bottled-water-with-ice-cubes-picture-id1264007263?b=1&k=20&m=1264007263&s=170667a&w=0&h=E0YUR6LvaJBQArQKKXh008kWWuajX82suKtFMpGTZGs=',
    ),
  ];
}
