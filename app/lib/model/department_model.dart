class Department {
  final int id;
  final String name;
  final int numberStaff;
  final bool? isDeleted; // Dùng nullable vì giá trị có thể là null
  final String rentService;
  final DateTime dueDate;
  final String description;
  final String? phoneNumber; // Dùng nullable vì giá trị có thể là null
  final DateTime createdAt;
  final DateTime updatedAt;

  Department({
    required this.id,
    required this.name,
    required this.numberStaff,
    this.isDeleted,
    required this.rentService,
    required this.dueDate,
    required this.description,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  // Phương thức để chuyển đổi từ JSON sang Department
  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      name: json['name'],
      numberStaff: json['number_staff'],
      isDeleted: json['is_deleted'], // Có thể null
      rentService: json['rent_service'],
      dueDate: DateTime.parse(json['due_date']),
      description: json['description'],
      phoneNumber: json['phone_number'], // Có thể null
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }


}
