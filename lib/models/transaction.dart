class Transaction {
  String _transaction;
  String _date;
  String _amount;
  String _img;

  Transaction(this._transaction, this._date, this._amount,this._img);

  String get transaction => this._transaction;

  set transaction(String value) => this._transaction = value;

  get date => this._date;

  set date(value) => this._date = value;

  get amount => this._amount;

  set amount(value) => this._amount = value;

   String get img => this._img;

 set img(String value) => this._img = value;

  
}
