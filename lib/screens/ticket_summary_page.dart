import 'package:bawatrust_app/utils/app_colours.dart';
import 'package:flutter/material.dart';
import 'ticketscan_page.dart';
import 'ticket_txid_page.dart';

class TicketSummaryPage extends StatefulWidget {
  final String title;
  final String date;
  final String time;

  const TicketSummaryPage({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  State<TicketSummaryPage> createState() => _TicketSummaryPageState();
}

class _TicketSummaryPageState extends State<TicketSummaryPage> {
  int _selectedIndex = 2;
  bool showTicketSummary = true; // New toggle state

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TicketScanPage(
            title: widget.title,
            date: widget.date,
            time: widget.time,
          ),
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TicketTxIdPage(
            title: widget.title,
            date: widget.date,
            time: widget.time,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(96),
        child: Container(
          color: AppColours.gold,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, color: AppColours.white),
                Image.asset('assets/images/gbt_logo_white.png', height: 40),
                const Icon(Icons.sync, color: AppColours.white),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColours.black,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/session1.jpeg',
                  width: 60,
                  height: 79,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontFamily: 'TT Commons Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: AppColours.white,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        widget.date,
                        style: const TextStyle(
                          fontFamily: 'TT Commons Regular',
                          fontSize: 12,
                          color: AppColours.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColours.gold,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    widget.time,
                    style: const TextStyle(
                      fontFamily: 'TT Commons Regular',
                      fontSize: 14,
                      color: AppColours.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),

          // Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColours.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showTicketSummary = true),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: showTicketSummary
                            ? AppColours.gold
                            : AppColours.goldOpacity40,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Ticket Summary",
                        style: TextStyle(
                          fontFamily: 'TT Commons Medium',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColours.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showTicketSummary = false),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: !showTicketSummary
                            ? AppColours.gold
                            : AppColours.goldOpacity40,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Today's Reservations",
                        style: TextStyle(
                          fontFamily: 'TT Commons Medium',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColours.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          // Table (Switch between two views)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: showTicketSummary
                ? _buildTicketSummaryTable()
                : _buildReservationsTable(),
          ),
        ],
      ),

      // Bottom Nav Bar
      bottomNavigationBar: Container(
        color: AppColours.black,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavButton(0, Icons.qr_code, "QR", AppColours.gold),
            _buildNavButton(1, Icons.text_snippet, "TX ID", AppColours.gold),
            _buildNavButton(2, Icons.article, "Summary", AppColours.gold),
          ],
        ),
      ),
    );
  }

  Table _buildTicketSummaryTable() {
    return Table(
      columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
      border: TableBorder.symmetric(
        inside: BorderSide(color: AppColours.white, width: 2),
      ),
      children: [
        _buildTableRow(
          "Ticket Type",
          "Total Redeemed  Tickets Count",
          isHeader: true,
          bgColor: AppColours.gold,
        ),
        _buildTableRow(
          "Foreign",
          "5",
          bgColor: AppColours.goldOpacity40,
          isTotal: true,
        ),
        _buildTableRow(
          "Local (Adult)",
          "6",
          bgColor: AppColours.cream,
          isTotal: true,
        ),
        _buildTableRow(
          "Local (Child)",
          "4",
          bgColor: AppColours.goldOpacity40,
          isTotal: true,
        ),
        _buildTableRow("Total", "15", isTotal: true, bgColor: AppColours.gold),
      ],
    );
  }

  Table _buildReservationsTable() {
    return Table(
      border: TableBorder.all(color: AppColours.white, width: 1),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
      },
      children: [
        _buildReservationRow(
          "TXN ID",
          "Name",
          "Ticket Type",
          isHeader: true,
          bgColor: AppColours.gold,
        ),
        _buildReservationRow(
          "TXN00001",
          "Nirosha Kodithuwakku",
          "Adults\nChild",
          bgColor: AppColours.goldOpacity40,
        ),
        _buildReservationRow(
          "TXN00002",
          "Lahiru Dissanayake",
          "Adults\nChild",
          bgColor: AppColours.goldOpacity40,
        ),
        _buildReservationRow(
          "TXN00003",
          "Dhinusha Ravi",
          "Adults\nChild",
          bgColor: AppColours.goldOpacity40,
        ),
        _buildReservationRow(
          "TOTAL RESERVATIONS :",
          "",
          "",
          isFooter: true,
          bgColor: AppColours.gold,
        ),
      ],
    );
  }

  TableRow _buildTableRow(
    String col1,
    String col2, {
    bool isHeader = false,
    bool isTotal = false,
    required Color bgColor,
  }) {
    final textStyle = TextStyle(
      fontFamily: 'TT Commons Medium',
      fontSize: 14,
      fontWeight: isHeader || isTotal ? FontWeight.w600 : FontWeight.bold,
      color: AppColours.black,
    );

    return TableRow(
      decoration: BoxDecoration(color: bgColor),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: Text(col1, style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: Text(col2, style: textStyle, textAlign: TextAlign.center),
        ),
      ],
    );
  }

  TableRow _buildReservationRow(
    String col1,
    String col2,
    String col3, {
    bool isHeader = false,
    bool isFooter = false,
    Color bgColor = Colors.transparent,
  }) {
    const textStyle = TextStyle(
      fontFamily: 'TT Commons Medium',
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColours.black,
    );
    final boldStyle = textStyle.copyWith(fontWeight: FontWeight.w600);

    return TableRow(
      decoration: BoxDecoration(color: bgColor),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Text(
            col1,
            style: isHeader || isFooter ? boldStyle : textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Text(col2, style: isHeader ? boldStyle : textStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Text(col3, style: isHeader ? boldStyle : textStyle),
        ),
      ],
    );
  }

  Widget _buildNavButton(
    int index,
    IconData icon,
    String label,
    Color goldColor,
  ) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onNavTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? goldColor : Colors.transparent,
          border: Border.all(color: AppColours.white),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColours.white, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'TT Commons Regular',
                fontSize: 15,
                color: AppColours.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
