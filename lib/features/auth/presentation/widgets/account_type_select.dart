
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/account_type_controller.dart';

class AccountTypeSelectView extends ConsumerWidget {
  const AccountTypeSelectView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var accountType = ref.watch(accountTypeProvider);
    var accountTypeController = ref.read(accountTypeProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: RadioListTile(
            dense: true,
            value: AccountType.individual,
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            groupValue: accountType,
            visualDensity:
                const VisualDensity(horizontal: VisualDensity.minimumDensity),
            onChanged: accountTypeController.updateAccountType,
            title: const Text(
              "Individual",
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: RadioListTile(
            dense: true,
            value: AccountType.business,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            visualDensity:
                const VisualDensity(horizontal: VisualDensity.minimumDensity),
            groupValue: accountType,
            onChanged: accountTypeController.updateAccountType,
            title: const Text(
              "Business",
            ),
          ),
        ),
      ],
    );
  }
}
