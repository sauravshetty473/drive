import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wallet',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 30,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ETH',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '25.554398',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Text(
                  'Account ID',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Add account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Ride profiles',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.black,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Personal',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Vouchers',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 20,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.square,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Vouchers',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Add Voucher Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Promotions',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Add Promo Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
