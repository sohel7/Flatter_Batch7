import 'package:flutter/material.dart';

void main() {
  runApp(const Group20App());
}

class Group20App extends StatefulWidget {
  const Group20App({super.key});

  @override
  _Group20AppState createState() => _Group20AppState();
}

class _Group20AppState extends State<Group20App> {
  bool _isDarkMode = false;

  void _toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Group20 App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: LoginPage(onThemeToggle: _toggleTheme, isDarkMode: _isDarkMode),
    );
  }
}

class LoginPage extends StatelessWidget {
  final Function(bool) onThemeToggle;
  final bool isDarkMode;

  const LoginPage({super.key, required this.onThemeToggle, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group 20'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage(onThemeToggle: onThemeToggle, isDarkMode: isDarkMode)),
                  );
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationPage()),
                  );
                },
                child: const Text("Don't have an account? Click here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle registration logic here
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  final Function(bool) onThemeToggle;
  final bool isDarkMode;

  const DashboardPage({super.key, required this.onThemeToggle, required this.isDarkMode});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const DepositPage(),
    const DetailsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.pending),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PendingUserListPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: widget.isDarkMode,
                onChanged: (value) {
                  widget.onThemeToggle(value);
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Deposit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class DepositPage extends StatelessWidget {
  const DepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total Members: 100', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Total Deposit: \$1000', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('My Deposit: \$100', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('My Liability: \$50', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Total Month: 12', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Details Page', style: TextStyle(fontSize: 18)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page', style: TextStyle(fontSize: 18)),
    );
  }
}

class PendingUserListPage extends StatelessWidget {
  const PendingUserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pendingUsers = [
      {"name": "John Doe", "email": "john@example.com", "mobile": "1234567890", "status": "Pending"},
      {"name": "Jane Smith", "email": "jane@example.com", "mobile": "2345678901", "status": "Pending"},
      {"name": "Alice Johnson", "email": "alice@example.com", "mobile": "3456789012", "status": "Pending"},
      {"name": "Bob Brown", "email": "bob@example.com", "mobile": "4567890123", "status": "Pending"},
      {"name": "Charlie Davis", "email": "charlie@example.com", "mobile": "5678901234", "status": "Pending"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending User List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: const Row(
              children: [
                Expanded(child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Email', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Mobile', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pendingUsers.length,
              itemBuilder: (context, index) {
                final user = pendingUsers[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Text(user["name"]!)),
                        Expanded(child: Text(user["email"]!)),
                        Expanded(child: Text(user["mobile"]!)),
                        Expanded(child: Text(user["status"]!)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
