import 'package:flutter/material.dart';

import '../../../components/button.dart';
import '../../../core/config/config.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({Key? key}) : super(key: key);

  @override
  _AddAccountScreenState createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  bool loading = false;

  handleSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: XColors.dark,
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
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Add Account',
              style: Theme.of(context).textTheme.headlineMedium),
          Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: XColors.quatenary),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 5,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: XColors.primary),
                        child: const Center(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: InputDecoration(
                labelText: 'Bank Name',
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.5),
                    ),
                filled: true,
                fillColor: XColors.primary.withOpacity(0.1),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
              )),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: InputDecoration(
                labelText: 'Account Number',
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.5),
                    ),
                filled: true,
                fillColor: XColors.primary.withOpacity(0.1),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
              )),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: InputDecoration(
                labelText: 'IFSC Code',
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.5),
                    ),
                filled: true,
                fillColor: XColors.primary.withOpacity(0.1),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),
              )),
              const SizedBox(height: 20),
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 45,
                      child: XButton(
                        onPressed: () {},
                        text: 'CANCEL',
                        loading: loading,
                        backgroundColor: XColors.danger,
                      ),
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 45,
                      child: XButton(
                        onPressed: handleSubmit,
                        text: 'SUBMIT',
                        loading: loading,
                        backgroundColor: XColors.success,
                      ),
                    )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
