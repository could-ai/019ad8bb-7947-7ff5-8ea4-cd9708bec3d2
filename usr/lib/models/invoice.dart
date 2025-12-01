import 'line_item.dart';

enum InvoiceStatus { draft, sent, paid, overdue }

class Invoice {
  final String id;
  final String customerId;
  final DateTime date;
  final DateTime dueDate;
  final List<LineItem> items;
  final InvoiceStatus status;

  Invoice({
    required this.id,
    required this.customerId,
    required this.date,
    required this.dueDate,
    required this.items,
    required this.status,
  });

  double get totalAmount => items.fold(0, (sum, item) => sum + item.total);
}
