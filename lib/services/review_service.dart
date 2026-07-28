import '../models/program.dart';

class Review {
  final Program program;
  final String review;
  final double rating;

  Review({
    required this.program,
    required this.review,
    required this.rating,
  });
}

class ReviewService {
  ReviewService._();

  static final ReviewService instance =
      ReviewService._();

  final List<Review> _reviews = [];

  List<Review> get reviews => _reviews;

  void addReview({
    required Program program,
    required String review,
    required double rating,
  }) {
    _reviews.add(
      Review(
        program: program,
        review: review,
        rating: rating,
      ),
    );
  }
}