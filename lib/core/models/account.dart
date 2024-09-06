class AccountModel {
  final String id;
  String bankName;
  String accountNumber;
  String ifscCode;
  String? logo;

  AccountModel({
    required this.id,
    required this.bankName,
    required this.accountNumber,
    required this.ifscCode,
    this.logo
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['_id'],
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      ifscCode: json['ifscCode'],
      logo: json['logo']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bankName': bankName,
      'accountNumber': accountNumber,
      'ifscCode': ifscCode,
      'logo': logo
    };
  }
}