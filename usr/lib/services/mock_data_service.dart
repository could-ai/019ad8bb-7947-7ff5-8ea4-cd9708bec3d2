import '../models/customer.dart';
import '../models/invoice.dart';
import '../models/quote.dart';
import '../models/line_item.dart';

class MockDataService {
  static final MockDataService _instance = MockDataService._internal();

  factory MockDataService() {
    return _instance;
  }

  MockDataService._internal() {
    _seedData();
  }

  final List<Customer> _customers = [];
  final List<Quote> _quotes = [];
  final List<Invoice> _invoices = [];

  List<Customer> get customers => List.unmodifiable(_customers);
  List<Quote> get quotes => List.unmodifiable(_quotes);
  List<Invoice> get invoices => List.unmodifiable(_invoices);

  void _seedData() {
    // Seed Customers
    _customers.addAll([
      Customer(
        id: '1',
        name: 'Alice Smith',
        email: 'alice@techcorp.com',
        phone: '555-0101',
        company: 'TechCorp Inc.',
        address: '123 Tech Blvd, Silicon Valley',
      ),
      Customer(
        id: '2',
        name: 'Bob Jones',
        email: 'bob@designstudio.com',
        phone: '555-0102',
        company: 'Bob Design Studio',
        address: '456 Art Ave, New York',
      ),
    ]);

    // Seed Quotes
    _quotes.add(
      Quote(
        id: 'Q-1001',
        customerId: '1',
        date: DateTime.now().subtract(const Duration(days: 2)),
        validUntil: DateTime.now().add(const Duration(days: 12)),
        status: QuoteStatus.sent,
        items: [
          LineItem(description: 'Consulting Services', quantity: 10, unitPrice: 150.0),
          LineItem(description: 'Project Setup', quantity: 1, unitPrice: 500.0),
        ],
      ),
    );

    // Seed Invoices
    _invoices.add(
      Invoice(
        id: 'INV-2001',
        customerId: '2',
        date: DateTime.now().subtract(const Duration(days: 5)),
        dueDate: DateTime.now().add(const Duration(days: 25)),
        status: InvoiceStatus.paid,
        items: [
          LineItem(description: 'Logo Design', quantity: 1, unitPrice: 800.0),
          LineItem(description: 'Brand Guidelines', quantity: 1, unitPrice: 400.0),
        ],
      ),
    );
  }

  void addCustomer(Customer customer) {
    _customers.add(customer);
  }

  void addQuote(Quote quote) {
    _quotes.add(quote);
  }

  void addInvoice(Invoice invoice) {
    _invoices.add(invoice);
  }

  Customer? getCustomerById(String id) {
    try {
      return _customers.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }
}
