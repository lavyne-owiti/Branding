
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AccountType { individual, business }

final accountTypeProvider =
    StateNotifierProvider.autoDispose<AccountTypeController, AccountType>(
        (ref) {
  return AccountTypeController();
});

class AccountTypeController extends StateNotifier<AccountType> {
  AccountTypeController() : super(AccountType.individual);

  void updateAccountType(AccountType? accountType) {
    if (accountType != null) state = accountType;
  }
}