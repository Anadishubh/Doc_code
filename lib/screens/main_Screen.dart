import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_medicine.dart';
import 'package:flutter_application_1/screens/profile_page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart'; // For date formatting

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 105, 178, 238),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Report',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddMedicineScreen());
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(), // Ensures circular shape
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _pages[_selectedIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, MMM d').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Richa!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '5 Medicines Left',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ProfileScreen());
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/girl.jpg'),
                      radius: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    currentDate,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _buildMedicineList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMedicineList() {
    return ListView(
      children: [
        _medicineCard("Morning 08:00 am", "Calpol 500mg Tablet",
            "Before Breakfast", "Day 01", Icons.notifications, Colors.green),
        _medicineCard("", "Calpol 500mg Tablet", "Before Breakfast", "Day 27",
            Icons.notifications, const Color.fromRGBO(244, 67, 54, 1)),
        _medicineCard("Afternoon 02:00 pm", "Calpol 500mg Tablet", "After Food",
            "Day 01", Icons.notifications, Colors.orange),
        _medicineCard("Night 09:00 pm", "Calpol 500mg Tablet", "After Food",
            "Day 03", Icons.notifications, Colors.grey),
      ],
    );
  }

  Widget _medicineCard(String time, String name, String details, String day,
      IconData icon, Color iconColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (time.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(time,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: _cardDecoration(),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/1.png')),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(details, style: const TextStyle(color: Colors.grey)),
                    Text(day, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Icon(icon, color: iconColor, size: 24),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: const Color.fromARGB(255, 242, 247, 252),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Report",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildReportSummary(),
              const SizedBox(height: 16),
              _buildDashboardCard(),
              const SizedBox(height: 16),
              _buildCheckHistory(),
              const SizedBox(height: 16),
              _buildCalendar(),
              const SizedBox(height: 26),
              Expanded(
                child: _buildMedicineList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Report",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _summaryItem("Total", "5"),
              _summaryItem("Taken", "3"),
              _summaryItem("Missed", "1"),
              _summaryItem("Snoozed", "1"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryItem(String title, String value) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 99, 176, 240))),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildDashboardCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Check Dashboard",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 4),
                Text(
                    "Here you will find everything related to your active and past medicines.",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Icon(Icons.pie_chart, color: Colors.blue, size: 80),
        ],
      ),
    );
  }

  Widget _buildCheckHistory() {
    return const Row(
      children: [
        Text("Check History", style: TextStyle(fontWeight: FontWeight.bold)),
        Spacer(),
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }

  Widget _buildCalendar() {
    return SizedBox(
      height: 100, // Adjust height to prevent overflow
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30, // Number of weeks to display
        itemBuilder: (context, index) {
          DateTime weekStart = _focusedDay
              .subtract(Duration(days: _focusedDay.weekday - 1))
              .add(Duration(days: index * 7));

          return Container(
            width: MediaQuery.of(context).size.width *
                0.9, // Adjust width for responsiveness
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: weekStart,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.week,
              availableCalendarFormats: const {CalendarFormat.week: 'Week'},
              headerVisible: false,
              daysOfWeekHeight: 30,
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                weekendStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(fontSize: 16),
                weekendTextStyle: const TextStyle(color: Colors.red),
                selectedDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMedicineList() {
    return ListView(
      children: [
        _medicineCard("Morning 08:00 am", "Calpol 500mg Tablet",
            "Before Breakfast", "Day 01", Icons.notifications, Colors.green),
        _medicineCard("", "Calpol 500mg Tablet", "Before Breakfast", "Day 27",
            Icons.notifications, Colors.red),
        _medicineCard("Afternoon 02:00 pm", "Calpol 500mg Tablet", "After Food",
            "Day 01", Icons.notifications, Colors.orange),
      ],
    );
  }

  Widget _medicineCard(String time, String name, String details, String day,
      IconData icon, Color iconColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (time.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(time,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: _cardDecoration(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.local_pharmacy,
                    color: Colors.purple, size: 30),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(details, style: const TextStyle(color: Colors.grey)),
                    Text(day, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Icon(icon, color: iconColor, size: 24),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
    );
  }
}
