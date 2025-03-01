import 'package:flutter/material.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  int selectedCompartment = 1;
  Color selectedColor = Colors.pink;
  String selectedFrequency = 'Everyday';
  String selectedTimesPerDay = 'Three Time';
  bool isActive = false;
  bool isBeforeFoodActive = false;
  bool isAfterFoodActive = false;
  bool isBeforeSleepActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Add Medicines',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Medicine Name',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Compartment',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(8, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text('${index + 1}'),
                        selected: selectedCompartment == index + 1,
                        selectedColor: Colors.red.withOpacity(0.5),
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.black),
                        ),
                        showCheckmark: false,
                        onSelected: (selected) {
                          setState(() {
                            selectedCompartment =
                                (selected ? index + 1 : null)!;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Colour',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Colors.pink,
                  Colors.purple,
                  Colors.red,
                  Colors.green,
                  Colors.orange,
                  Colors.blue
                ].map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: selectedColor == color
                            ? Border.all(color: Colors.black, width: 2)
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Text("Type"),
              Row(
                children: [].map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: selectedColor == color
                            ? Border.all(color: Colors.black, width: 2)
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Set Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Today'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('End Date'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Frequency of Days',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField(
                value: selectedFrequency,
                items: ['Everyday', 'Alternate Days', 'Weekly']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedFrequency = value as String;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'How many times a Day',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField(
                value: selectedTimesPerDay,
                items: ['Once', 'Twice', 'Three Time']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTimesPerDay = value as String;
                  });
                },
              ),
              Column(
                children: List.generate(3, (index) {
                  return ListTile(
                    leading: const Icon(Icons.timer),
                    title: Text('Dose ${index + 1}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isBeforeFoodActive = !isBeforeFoodActive;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isBeforeFoodActive ? Colors.blue : Colors.grey,
                    ),
                    child: const Text(
                      'Before Food',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAfterFoodActive = !isAfterFoodActive;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isAfterFoodActive ? Colors.blue : Colors.grey,
                    ),
                    child: const Text(
                      'After Food',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isBeforeSleepActive = !isBeforeSleepActive;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isBeforeSleepActive ? Colors.blue : Colors.grey,
                    ),
                    child: const Text(
                      'Before Sleep',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 81, 176, 253),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
