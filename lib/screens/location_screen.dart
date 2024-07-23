import 'package:flutter/material.dart';

class LocationSelectionScreen extends StatefulWidget {
  @override
  _LocationSelectionScreenState createState() => _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  String? selectedDistrict;
  String? selectedSector;
  String? selectedCell;
  String? selectedVillage;
  String houseCode = '';

  List<String> districts = ['Gasabo', 'Kicukiro', 'Nyarugenge']; // Replace with actual district names
  Map<String, List<String>> sectors = {
    'Gasabo': ['Remera', 'Kimironko', 'Gisozi'],
    'Kicukiro': ['Kicukiro', 'Nyarugunga', 'Masaka'],
    'Nyarugenge': ['Nyamirambo', 'Kimisagara', 'Kiyovu'],
  }; // Replace with actual sector names per district
  Map<String, List<String>> cells = {
    'Remera': ['Remera 1', 'Remera 2', 'Remera 3'],
    'Kimironko': ['Kimironko 1', 'Kimironko 2', 'Kimironko 3'],
    'Gisozi': ['Gisozi 1', 'Gisozi 2', 'Gisozi 3'],
    // Add cells for other sectors and districts similarly
  }; // Replace with actual cell names per sector
  Map<String, List<String>> villages = {
    'Remera 1': ['Village A', 'Village B', 'Village C'],
    'Remera 2': ['Village D', 'Village E', 'Village F'],
    'Remera 3': ['Village G', 'Village H', 'Village I'],
    // Add villages for other cells similarly
  }; // Replace with actual village names per cell

  void selectDistrict(String district) {
    setState(() {
      selectedDistrict = district;
      selectedSector = null;
      selectedCell = null;
      selectedVillage = null;
    });
  }

  void selectSector(String sector) {
    setState(() {
      selectedSector = sector;
      selectedCell = null;
      selectedVillage = null;
    });
  }

  void selectCell(String cell) {
    setState(() {
      selectedCell = cell;
      selectedVillage = null;
    });
  }

  void selectVillage(String village) {
    setState(() {
      selectedVillage = village;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdown(
              'District',
              districts,
              selectedDistrict,
                  (String? value) => selectDistrict(value ?? ''),
            ),
            SizedBox(height: 16.0),
            if (selectedDistrict != null)
              _buildDropdown(
                'Sector',
                sectors[selectedDistrict!]!,
                selectedSector,
                    (String? value) => selectSector(value ?? ''),
              ),
            SizedBox(height: 16.0),
            if (selectedSector != null)
              _buildDropdown(
                'Cell',
                cells[selectedSector!]!,
                selectedCell,
                    (String? value) => selectCell(value ?? ''),
              ),
            SizedBox(height: 16.0),
            if (selectedCell != null)
              _buildDropdown(
                'Village',
                villages[selectedCell!]!,
                selectedVillage,
                    (String? value) => selectVillage(value ?? ''),
              ),
            SizedBox(height: 16.0),
            if (selectedVillage != null)
              TextField(
                decoration: InputDecoration(
                  labelText: 'House Code',
                  hintText: 'Enter your house code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    houseCode = value;
                  });
                },
              ),
            SizedBox(height: 32.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save location logic
                  String location = '$selectedDistrict, $selectedSector, $selectedCell, $selectedVillage, $houseCode';
                  // Implement your save logic here (e.g., save to database, etc.)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Location Saved'),
                        content: Text('Your location has been saved: $location'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Save Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label,
      List<String> items,
      String? selectedValue,
      void Function(String?) onChanged,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            isExpanded: true,
            underline: SizedBox(),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
