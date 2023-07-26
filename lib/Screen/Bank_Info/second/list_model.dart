class Bank {
  final image, name;

  Bank(this.image, this.name);
}

final List<Bank> BanklList = List.generate(
    image.length,
    (index) => Bank(
          image[index],
          name[index],
        ));

List image = [
  'asset/image/bank-balance-icon.png',
  'asset/image/statement-icon.png',
  'asset/image/customer-care-icon.png'
];

List name = [
  'Bank Balance',
  'Mini Statement',
  'Customer Care Number',
];
