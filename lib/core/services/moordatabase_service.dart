import 'package:moneymanager/core/database/moor_database.dart';

class MoorDatabaseService {
  final AppDatabase _database = AppDatabase();

  getAllTransactions(String month) async {
    List<Transaction> allTrans = List<Transaction>();

    TransactionDao transactionDao = _database.transactionDao;

    allTrans = await transactionDao.getTransactionForMonth(month).get();
    return allTrans;
  }

  getIncomeSum(String month) async {
    List<int> list = await _database.transactionDao
        .sumTheMoneyForMonth(month, "income")
        .get();

    int sumOfIncome = 0;

    if (list == null && list.length == 0) {
      return 0;
    }

    list.forEach((element) {
      if (element == null) {
        return;
      }
      sumOfIncome += element;
    });

    return sumOfIncome;
  }

  getExpenseSum(String month) async {
    List<int> list = await _database.transactionDao
        .sumTheMoneyForMonth(month, "expense")
        .get();

    int sumOfExpense = 0;

    if (list == null && list.length == 0) {
      return 0;
    }

    list.forEach((element) {
      if (element == null) {
        return;
      }
      sumOfExpense += element;
    });

    return sumOfExpense;
  }
}
