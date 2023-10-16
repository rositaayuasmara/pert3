import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioApp(),
    );
  }
}

class PortfolioApp extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime[200],
        centerTitle: true,
        title: Text('My Portfolio',style: TextStyle(color: Colors.black),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomeTab(),
          ProjectsTab(),
          ContactTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.lime[50],
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.green.withOpacity(0.8),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_sharp),
            label: 'Data Diri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_history),
            label: 'Riwayat Pekerjaan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assured_workload),
            label: 'Data Pendidikan',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('images/pic.jpg'),
          ),
          SizedBox(height: 20),
          Text(
            'Rosita Ayu Asmara',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('Teknik Informatika',style: TextStyle(fontSize: 25),
    ),
          SizedBox(height: 5),
      Text('20190801499',style: TextStyle(fontSize: 23),
      ),
          SizedBox(height: 20),
          _buildDataRow('Location', 'Tangerang, Banten'),
          _buildDataRow('Email', 'rositaayuasmara1@gmail.com'),
          _buildDataRow('Contact', '+6283863889644'),
        ],
      ),
    );
  }
}
Widget _buildDataRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 9.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label + ': ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    ),
  );
}


class ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text('About Me',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildDataRow('Nama ', 'Rosita Ayu Asmara'),
          _buildDataRow('Alamat', 'Tangerang, Banten'),
          _buildDataRow('Email', 'rositaayuasmara1@gmail.com'),
          _buildDataRow('Contact', '+6283863889644'),
          _buildDataRow('~ Tempat Tanggal Lahit', 'Blora,09-06-1998'),
          _buildDataRow('~ Hobi', '- Menyanyi dan Kuliner'),
          _buildDataRow('~ Pekerjaan', '- owner kreseku.id'),
        ],
      ),
    );
  }
}

class ContactTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25),
          Text('Riwayat Pekerjaan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          SizedBox(height: 1),
          SizedBox(height: 1),
          Text('Beserta Jabatan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildDataRow('Riwayat Kerja ', ''),
          _buildDataRow('~ 2016 - 2017', 'PT.VIVO MOBILE INDONESIA,Cikupa'),
          _buildDataRow('~ 2018 - 2019', 'PT.SPV, Cikupa'),
          _buildDataRow('~ 2019 - 2020', 'PT.ADR GROUP, Bitung'),
          _buildDataRow('~ 2020 - 2022', 'PT.KMK, Cikupa'),
          SizedBox(height: 20),
          _buildDataRow('Jabatan Kerja ', ''),
          _buildDataRow('PT.VIVO ', 'Admin Material ekspor'),
          _buildDataRow('PT.SPV ', 'Resepsionis & Finance petty cash'),
          _buildDataRow('PT.ADR GROUP ', 'Marketing Admin'),
          _buildDataRow('PT.KMK ', 'Leader Line Packing'),
        ],
      ),
    );
  }
}