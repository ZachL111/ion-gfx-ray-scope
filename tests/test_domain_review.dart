import '../lib/domain_review.dart';

void main() {
  const item = DomainReview(75, 44, 25, 69);
  assert(DomainReviewLens.score(item) == 188);
  assert(DomainReviewLens.lane(item) == 'ship');
}
