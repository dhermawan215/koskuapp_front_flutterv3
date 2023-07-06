part of 'models.dart';

enum TransactionStatus { success, pending, cancel }

class Transaction {
  int? id;
  KostModel? kost;

  User? user;
  String? transactionNumber;
  int? total;
  TransactionStatus? status;
  String? paymentMethod;
  String? paymentPicture;
  String? paymentUrl;
  DateTime? createdAt;

  Transaction({
    this.id,
    this.kost,
    this.user,
    this.transactionNumber,
    this.total,
    this.status,
    this.paymentMethod,
    this.paymentPicture,
    this.paymentUrl,
    this.createdAt,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    // print('from json: $json');

    id = json['id'];
    kost = KostModel.fromJson(json['kontrakan'], userData: json['user']);
    transactionNumber = json['transaction_number'];
    total = json['total'];
    createdAt = DateTime.parse(json['created_at']);
    paymentMethod = json['payment_method'];
    paymentUrl = json['payment_url'];

    if (json['status'] == 'SUCCESS') {
      status = TransactionStatus.success;
    } else if (json['status'] == 'PENDING') {
      status = TransactionStatus.pending;
    } else {
      status = TransactionStatus.cancel;
    }
  }

  Transaction copyWith({
    KostModel? kost,
  }) {
    return Transaction(
      kost: kost ?? this.kost,
    );
  }
}

// List<Transaction> mockTransaction = [
//   Transaction(
//     id: 1,
//     user: mockUser,
//     transactionNumber: "TRSC/2321/1312DW",
//     total: 655000,
//     status: TransactionStatus.success,
//   ),
//   Transaction(
//     id: 2,
//     user: mockUser,
//     transactionNumber: "TRSC/2342/55232DW",
//     total: 705000,
//     status: TransactionStatus.pending,
//   ),
//   Transaction(
//     id: 3,
//     user: mockUser,
//     transactionNumber: "TRSC/2345/40232DW",
//     total: 705000,
//     status: TransactionStatus.cancel,
//   ),
// ];
