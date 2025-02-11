import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GetX Controller zur Verwaltung von Services & Kategorien
class ProductController extends GetxController {
  var services =
      <String>['Web Development', 'SEO Services', 'Graphic Design'].obs;
  var categories = <String>['Technology', 'Marketing', 'Consulting'].obs;

  void addItem(String type, String item) {
    if (type == 'Service') {
      services.add(item);
    } else {
      categories.add(item);
    }
  }

  void editItem(String type, int index, String newItem) {
    if (type == 'Service') {
      services[index] = newItem;
    } else {
      categories[index] = newItem;
    }
  }

  void deleteItem(String type, int index) {
    if (type == 'Service') {
      services.removeAt(index);
    } else {
      categories.removeAt(index);
    }
  }
}

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Our Services & Categories'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Service'),
              Tab(text: 'Category'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildListView(controller.services, 'Service'),
            _buildListView(controller.categories, 'Category'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddItemDialog();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // 🔹 Widget zur Anzeige der Listen (Service oder Category)
  Widget _buildListView(RxList<String> items, String type) {
    return Obx(() => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(items[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _showEditItemDialog(type, index, items[index]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        controller.deleteItem(type, index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  // 🔹 Dialog zum Hinzufügen eines neuen Items
  void _showAddItemDialog() {
    TextEditingController controllerText = TextEditingController();
    var selectedType = 'Service'.obs;

    Get.dialog(
      AlertDialog(
        title: const Text('Add New Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controllerText,
              decoration: const InputDecoration(hintText: 'Enter name'),
            ),
            const SizedBox(height: 10),
            Obx(() => DropdownButton<String>(
                  value: selectedType.value,
                  items: ['Service', 'Category'].map((String type) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
                  onChanged: (value) {
                    selectedType.value = value!;
                  },
                )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controllerText.text.isNotEmpty) {
                controller.addItem(selectedType.value, controllerText.text);
                Get.back();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  // 🔹 Dialog zum Bearbeiten eines Items
  void _showEditItemDialog(String type, int index, String currentText) {
    TextEditingController controllerText =
        TextEditingController(text: currentText);

    Get.dialog(
      AlertDialog(
        title: Text('Edit $type'),
        content: TextField(
          controller: controllerText,
          decoration: const InputDecoration(hintText: 'Enter new name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controllerText.text.isNotEmpty) {
                controller.editItem(type, index, controllerText.text);
                Get.back();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
