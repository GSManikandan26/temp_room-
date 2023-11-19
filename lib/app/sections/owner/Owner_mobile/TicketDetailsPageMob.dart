import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VendorTicketListPageMobile extends StatefulWidget {
  const VendorTicketListPageMobile({super.key});

  @override
  _VendorTicketListPageMobileState createState() => _VendorTicketListPageMobileState();
}

class _VendorTicketListPageMobileState extends State<VendorTicketListPageMobile> {
  List<Ticket> tickets = [
    Ticket(
      tenantName: 'John Doe',
      subject: 'Maintenance Request',
      message: 'The faucet in my apartment is leaking. Please fix it.',
    ),
    Ticket(
      tenantName: 'Jane Smith',
      subject: 'Noise Complaint',
      message: 'My neighbors are being too loud late at night.',
    ),
    Ticket(
      tenantName: 'John Doe',
      subject: 'Maintenance Request',
      message: 'The faucet in my apartment is leaking. Please fix it.',
    ),
    Ticket(
      tenantName: 'John Doe',
      subject: 'Maintenance Request',
      message: 'The faucet in my apartment is leaking. Please fix it.',
    ),
    Ticket(
      tenantName: 'John Doe',
      subject: 'Maintenance Request',
      message: 'The faucet in my apartment is leaking. Please fix it.',
    ),
    // Add more tickets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Raised Tickets',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          return Card(
            elevation: 5.0,
            color: Colors.grey.shade100,
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              title: Text(
                ticket.subject,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tenant: ${ticket.tenantName}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Message: ${ticket.message}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketDetailsPage(ticket: ticket),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Ticket {
  final String tenantName;
  final String subject;
  final String message;

  Ticket({
    required this.tenantName,
    required this.subject,
    required this.message,
  });
}

class TicketDetailsPage extends StatelessWidget {
  final Ticket ticket;

  const TicketDetailsPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Ticket Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Tenant: ${ticket.tenantName}',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Subject: ${ticket.subject}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Message:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              ticket.message,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _resolved();
                  // Implement your action here (e.g., mark as resolved, reply)
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color.fromRGBO(33, 37, 41, 1.0);
                      }
                      return const Color.fromRGBO(33, 84, 115, 1.0);
                    },
                  ),
                ),
                child: const Text(
                  'Mark as Resolved',
                  style: TextStyle(fontSize: 16.0,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _resolved() {
    Fluttertoast.showToast(
      msg: 'Marked as Resolved!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      webShowClose: true,
      webBgColor: "linear-gradient(to right, #ffaa00, #ff7700)",
    );
  }
}
