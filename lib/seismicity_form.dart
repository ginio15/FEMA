import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'building_info_form.dart'; // Import the Building Information Form
import 'formData_for_global_store.dart'; // Import FormData

final Logger _logger = Logger('SeismicityForm');

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class SeismicityForm extends StatefulWidget {
  const SeismicityForm({super.key});

  @override
  SeismicityFormState createState() => SeismicityFormState();
}

class SeismicityFormState extends State<SeismicityForm> {
  // Controllers for input fields
  final _addressController = TextEditingController();
  final _zipController = TextEditingController();
  final _otherIdentifiersController = TextEditingController();
  final _buildingNameController = TextEditingController();
  final _useController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _ssController = TextEditingController(); // Ss value
  final _s1Controller = TextEditingController(); // S1 value
  final _screenersController = TextEditingController();
  final _dateTimeController = TextEditingController();

  Map<String, dynamic> _buildingInfoData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seismicity Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _zipController,
                decoration: const InputDecoration(
                  labelText: 'Zip',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _otherIdentifiersController,
                decoration: const InputDecoration(
                  labelText: 'Other Identifiers',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _buildingNameController,
                decoration: const InputDecoration(
                  labelText: 'Building Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _useController,
                decoration: const InputDecoration(
                  labelText: 'Use',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _latitudeController,
                      decoration: const InputDecoration(
                        labelText: 'Latitude',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _longitudeController,
                      decoration: const InputDecoration(
                        labelText: 'Longitude',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ssController,
                      decoration: const InputDecoration(
                        labelText: 'Ss',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _s1Controller,
                      decoration: const InputDecoration(
                        labelText: 'S1',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _screenersController,
                decoration: const InputDecoration(
                  labelText: 'Screener(s)',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateTimeController,
                decoration: const InputDecoration(
                  labelText: 'Date/Time',
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Save all form inputs to FormData
                  FormData formData = FormData();
                  formData.addInput('address', _addressController.text);
                  formData.addInput('zip', _zipController.text);
                  formData.addInput(
                      'otherIdentifiers', _otherIdentifiersController.text);
                  formData.addInput(
                      'buildingName', _buildingNameController.text);
                  formData.addInput('use', _useController.text);
                  formData.addInput('latitude', _latitudeController.text);
                  formData.addInput('longitude', _longitudeController.text);
                  formData.addInput('ss', _ssController.text);
                  formData.addInput('s1', _s1Controller.text);
                  formData.addInput('screeners', _screenersController.text);
                  formData.addInput('dateTime', _dateTimeController.text);

                  // Pass current data and navigate to BuildingInfoForm
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuildingInfoForm(
                        seismicityData: {
                          'address': _addressController.text,
                          'zip': _zipController.text,
                          'otherIdentifiers': _otherIdentifiersController.text,
                          'buildingName': _buildingNameController.text,
                          'use': _useController.text,
                          'latitude': _latitudeController.text,
                          'longitude': _longitudeController.text,
                          'ss': _ssController.text,
                          's1': _s1Controller.text,
                          'screeners': _screenersController.text,
                          'dateTime': _dateTimeController.text,
                        },
                        buildingInfoData: _buildingInfoData,
                      ),
                    ),
                  );

                  // Handle result when navigating back from BuildingInfoForm
                  if (result != null) {
                    setState(() {
                      _buildingInfoData = result;
                    });
                  }
                },
                child: const Text('Next'),
              ),
            ], // children
          ),
        ),
      ),
    );
  } // build

  @override
  void dispose() {
    _addressController.dispose();
    _zipController.dispose();
    _otherIdentifiersController.dispose();
    _buildingNameController.dispose();
    _useController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _ssController.dispose();
    _s1Controller.dispose();
    _screenersController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }
}
