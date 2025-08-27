import 'package:flutter/material.dart';

class TicketPopup extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final int availableCount;
  final String referenceNo;
  final VoidCallback onRedeem;

  const TicketPopup({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.availableCount,
    required this.referenceNo,
    required this.onRedeem,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 343,
        height: 412,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFAC9A58),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title & Time Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'TT Commons DemiBold',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ), // adjust this value as needed
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF958654),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          time,
                          style: const TextStyle(
                            fontFamily: 'TT Commons Regular',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Date
                Text(
                  date,
                  style: const TextStyle(
                    fontFamily: 'TT Commons Regular',
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 24),

                // Available Ticket Count Box
                Container(
                  width: double.infinity,
                  height: 62,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF958654),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        availableCount.toString(),
                        style: const TextStyle(
                          fontFamily: 'TT Commons Medium',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Available Ticket Count',
                        style: TextStyle(
                          fontFamily: 'TT Commons Regular',
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Divider(color: Colors.white),

                const SizedBox(height: 12),

                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Reference No.',
                        style: TextStyle(
                          fontFamily: 'TT Commons Regular',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        referenceNo,
                        style: const TextStyle(
                          fontFamily: 'TT Commons Medium',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: onRedeem,
                    child: const Text(
                      'Redeem',
                      style: TextStyle(
                        fontFamily: 'TT Commons Medium',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Close Icon
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/closeicon.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
