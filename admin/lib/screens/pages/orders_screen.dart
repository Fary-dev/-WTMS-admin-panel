import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Suche nach Bestellungen (Funktionalität kann hier hinzugefügt werden)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Suchleiste für Bestellungen
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search Orders',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                // Hier kann die Logik zum Filtern der Bestellungen implementiert werden
              },
            ),
            const SizedBox(height: 20),

            // Auftragsliste
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Beispiel für 10 Bestellungen
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text('Order #${index + 1}'),
                      subtitle: const Text('Status: Processing'),
                      leading: const Icon(Icons.shopping_cart),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        // Logik zum Öffnen der Auftragsdetails
                        _showOrderDetails(context, index + 1);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Beispiel für die Anzeige der Bestelldetails
  void _showOrderDetails(BuildContext context, int orderId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Order #$orderId Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Order ID: #$orderId'),
              const Text('Status: Processing'),
              const Text('Date: 2025-02-11'),
              const Text('Customer: John Doe'),
              // Weitere Bestellinformationen können hier hinzugefügt werden
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                // Logik für das Bearbeiten oder Löschen der Bestellung hinzufügen
                Navigator.of(context).pop();
              },
              child: const Text('Edit Order'),
            ),
          ],
        );
      },
    );
  }
}
