import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:pf_app/components/button.dart';
import 'package:pf_app/core/config/config.dart';
import 'package:pf_app/core/models/account.dart';
import 'package:pf_app/modules/account/ui/add_account_screen.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  bool _showAddDialog = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: XColors.body,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Accounts',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 50,
                    child: XButton(
                      onPressed: () {
                        setState(() {
                          _showAddDialog = true;
                        });
                      },
                      text: 'Add Account',
                      loading: false,
                      backgroundColor: XColors.dark,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                          decoration: InputDecoration(
                        labelText: 'Search',
                        labelStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: [
                      DataColumn2(
                        label: Text('Bank Name',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white)),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('Account Number',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white)),
                      ),
                      DataColumn(
                        label: Text('IFSC Code',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white)),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        100,
                        (index) => DataRow(cells: [
                              DataCell(Text('A' * (10 - index % 10))),
                              DataCell(Text('B' * (10 - (index + 5) % 10))),
                              DataCell(Text('C' * (15 - (index + 5) % 10))),
                            ]))),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Showing 1 to 10 of 100 entries',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 45,
                          child: XButton(
                            onPressed: () {},
                            text: 'Previous',
                            loading: false,
                            backgroundColor: XColors.dark,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 45,
                          child: XButton(
                            onPressed: () {},
                            text: 'Next',
                            loading: false,
                            backgroundColor: XColors.dark,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          if (_showAddDialog) const AddAccountScreen()
        ],
      ),
    );
  }
}
