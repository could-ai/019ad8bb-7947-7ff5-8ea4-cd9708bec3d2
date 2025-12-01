import 'line_item.dart';

enum QuoteStatus { draft, sent, accepted, rejected }

class Quote {
  final String id;
  final String customerId;
  final DateTime date;
  final DateTime validUntil;
  final List<LineItem> items;
  final QuoteStatus status;

  Quote({
    required this.id,
    required this.customerId,
    required this.date,
    required this.validUntil,
    required this.items,
    required this.status,
  });

  double get totalAmount => items.fold(0, (sum, item) => sum + item.total);
}
