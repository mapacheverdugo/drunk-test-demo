class CreditCardModel {
  CreditCardModel(
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode, {
    this.isCvvFocused = false,
  });

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused;
}
