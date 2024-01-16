import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/details.dart';
import 'package:dughri/widget/CustomMaterialButtom/custom_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodScreen extends StatelessWidget {
  final String paypalImageUrl =
      'https://www.paypalobjects.com/webstatic/mktg/logo/pp_cc_mark_74x46.jpg';
  final String visaImageUrl =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/1200px-Visa_Inc._logo.svg.png';
  final String mastercardImageUrl =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Mastercard-logo.png/1200px-Mastercard-logo.png';

  const PaymentMethodScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          
            children:  [
               SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children:  [
                    PaymentCard(imageUrl: paypalImageUrl, cardName: 'PayPal'),
                    PaymentCard(imageUrl: visaImageUrl, cardName: 'Visa'),
                    PaymentCard(imageUrl: mastercardImageUrl, cardName: 'Mastercard'),
                  ],
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
               CreditCard(
                      onTopRightButtonClicked: () {},
                      cardIcon: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/mastercard.png?alt=media&token=1ae51e14-5a60-4dbf-8a42-47cb9c3c1dfe",
                        width: 50.w,
                      )),
                      SizedBox(
                height: 15.sp,
              ),
             const PaymentInfoScreen(),
               
               
            ],
          ),
        ),
      ),
      
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String imageUrl;
  final String cardName;

  const PaymentCard({Key? key, required this.imageUrl, required this.cardName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: 100.w,
            height: 60.h,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text(
            cardName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
         
        ],
      ),
    );
  }
}

class PaymentInfoScreen extends StatefulWidget {
  const PaymentInfoScreen({super.key});

  @override
  State<PaymentInfoScreen> createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expirationDateController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cardNumberController,
                decoration: const InputDecoration(labelText: 'Card Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the card number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: expirationDateController,
                decoration: const InputDecoration(labelText: 'Expiration Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the expiration date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cvvController,
                decoration: const InputDecoration(labelText: 'CVV'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the CVV';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
             CustomMaterialButton(buttonText:"Pay Now" , onPressed: (){if (_formKey.currentState!.validate()) {
                    // Perform payment processing logic here
                    // You may want to integrate with a payment gateway
                    // and securely handle the entered information
                    // For now, we just print the entered information
                    print('Card Number: ${cardNumberController.text}');
                    print('Expiration Date: ${expirationDateController.text}');
                    print('CVV: ${cvvController.text}');
    }  })
            ],
          ),
        )
    );
  }
}
