import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'building_type(1).dart'; // Import the Building Type Form
import 'formData_for_global_store.dart'; // Import FormData

final Logger _logger = Logger('BuildingInfoForm');

void setupLogging() {
  // Set the root logger to capture all log levels
  Logger.root.level = Level.ALL;

  // Set up the logging to listen for records and print them to the console
  Logger.root.onRecord.listen((LogRecord rec) {
    // This prints log messages to the console
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class BuildingInfoForm extends StatefulWidget {
  final Map<String, dynamic> seismicityData; // Data passed from SeismicityForm
  final Map<String, dynamic> buildingInfoData; // Existing building info data

  const BuildingInfoForm({
    super.key,
    required this.seismicityData,
    required this.buildingInfoData,
  });

  @override
  BuildingInfoFormState createState() => BuildingInfoFormState();
}

class BuildingInfoFormState extends State<BuildingInfoForm> {
  // Controllers and variables to store input values
  final _formKey = GlobalKey<FormState>();
  final _aboveStoriesController = TextEditingController();
  final _belowStoriesController = TextEditingController();
  final _yearBuiltController = TextEditingController();
  final _codeYearController = TextEditingController(); // Fixed variable name
  final _totalAreaController = TextEditingController(); // Fixed variable name
  final _numberOfApartmentsController =
      TextEditingController(); // Fixed variable name
  final _otherFallingHazardsController = TextEditingController();
  String buildingType = ''; // Store the selected building type here
  String? _selectedVerticalIrregularity;
  bool? _hasPlanIrregularity;
  String? _basicScore;
  bool? _preCode;
  bool? _postBenchmark;
  String? _finalScore;
  String? _smin;

  bool _unbracedChimneys = false;
  bool _heavyCladding = false;
  bool _parapets = false;
  bool _appendages = false;
  bool _otherFallingHazards = false;
  bool _plan = false;
  bool _vertical = false;
  bool _fallingHazards = false;
  bool _pounding = false;
  String? _selectedOccupancy;
  String? _selectedSoilType;
  bool _liquefaction = false;
  bool _landslide = false;
  bool _surfaceRupture = false;
  bool _isYearEstimated = false;
  bool _additions = false;

  get result => null;

  @override
  void initState() {
    super.initState();
    // Initialize data if available
    _aboveStoriesController.text =
        widget.buildingInfoData['aboveStories']?.toString() ?? '';
    _belowStoriesController.text =
        widget.buildingInfoData['belowStories']?.toString() ?? '';
    _yearBuiltController.text =
        widget.buildingInfoData['yearBuilt']?.toString() ?? '';
    _codeYearController.text =
        widget.buildingInfoData['codeYear']?.toString() ?? '';
    _totalAreaController.text =
        widget.buildingInfoData['totalArea']?.toString() ?? '';
    _numberOfApartmentsController.text =
        widget.buildingInfoData['numberOfApartments']?.toString() ?? '';
    _otherFallingHazardsController.text =
        widget.buildingInfoData['otherFallingHazards']?.toString() ?? '';
    _unbracedChimneys = widget.buildingInfoData['unbracedChimneys'] ?? false;
    _heavyCladding = widget.buildingInfoData['heavyCladding'] ?? false;
    _parapets = widget.buildingInfoData['parapets'] ?? false;
    _appendages = widget.buildingInfoData['appendages'] ?? false;
    _otherFallingHazards =
        widget.buildingInfoData['otherFallingHazards'] ?? false;
    _plan = widget.buildingInfoData['plan'] ?? false;
    _vertical = widget.buildingInfoData['vertical'] ?? false;
    _fallingHazards = widget.buildingInfoData['fallingHazards'] ?? false;
    _pounding = widget.buildingInfoData['pounding'] ?? false;
    _selectedOccupancy = widget.buildingInfoData['selectedOccupancy'];
    _selectedSoilType = widget.buildingInfoData['selectedSoilType'];
    _liquefaction = widget.buildingInfoData['liquefaction'] ?? false;
    _landslide = widget.buildingInfoData['landslide'] ?? false;
    _surfaceRupture = widget.buildingInfoData['surfaceRupture'] ?? false;
    _isYearEstimated = widget.buildingInfoData['isYearEstimated'] ?? false;
    _additions = widget.buildingInfoData['additions'] ?? false;
    buildingType = widget.buildingInfoData['selectedBuildingType'] ??
        ''; // Get the building type if available
  }

  void _navigateToNextPage() async {
    // Save current form data to FormData
    FormData formData = FormData();
    formData.addInput('aboveStories', _aboveStoriesController.text);
    formData.addInput('belowStories', _belowStoriesController.text);
    formData.addInput('yearBuilt', _yearBuiltController.text);
    formData.addInput('isYearEstimated', _isYearEstimated);
    formData.addInput('additions', _additions);
    formData.addInput('codeYear', _codeYearController.text);
    formData.addInput('totalArea', _totalAreaController.text);
    formData.addInput('selectedOccupancy', _selectedOccupancy);
    formData.addInput('numberOfApartments', _numberOfApartmentsController.text);
    formData.addInput('selectedSoilType', _selectedSoilType);
    formData.addInput('liquefaction', _liquefaction);
    formData.addInput('landslide', _landslide);
    formData.addInput('surfaceRupture', _surfaceRupture);
    formData.addInput('pounding', _pounding);
    formData.addInput('fallingHazards', _fallingHazards);
    formData.addInput('unbracedChimneys', _unbracedChimneys);
    formData.addInput('parapets', _parapets);
    formData.addInput('heavyCladding', _heavyCladding);
    formData.addInput('appendages', _appendages);
    formData.addInput('otherFallingHazards', _otherFallingHazards);
    formData.addInput(
        'otherFallingHazardsText', _otherFallingHazardsController.text);

    // Navigate to the next page
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuildingTypePage(
          initialBuildingType: buildingType,
          initialVerticalIrregularity: _selectedVerticalIrregularity,
          initialPlanIrregularity: _hasPlanIrregularity,
          initialBasicScore: _basicScore ?? '',
          initalPreCode: _preCode,
          initalPostBenchmark: _postBenchmark,
          initialFinalScore: _finalScore,
          initialSmin: _smin,
        ),
      ),
    );

    // Handle result if needed
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        // Update form data if necessary
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Building Information Form'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Save all form inputs to FormData
            FormData formData = FormData();
            formData.addInput('aboveStories', _aboveStoriesController.text);
            formData.addInput('belowStories', _belowStoriesController.text);
            formData.addInput('yearBuilt', _yearBuiltController.text);
            formData.addInput('isYearEstimated', _isYearEstimated);
            formData.addInput('additions', _additions);
            formData.addInput('codeYear', _codeYearController.text);
            formData.addInput('totalArea', _totalAreaController.text);
            formData.addInput('selectedOccupancy', _selectedOccupancy);
            formData.addInput(
                'numberOfApartments', _numberOfApartmentsController.text);
            formData.addInput('selectedSoilType', _selectedSoilType);
            formData.addInput('liquefaction', _liquefaction);
            formData.addInput('landslide', _landslide);
            formData.addInput('surfaceRupture', _surfaceRupture);
            formData.addInput('pounding', _pounding);
            formData.addInput('fallingHazards', _fallingHazards);
            formData.addInput('unbracedChimneys', _unbracedChimneys);
            formData.addInput('parapets', _parapets);
            formData.addInput('heavyCladding', _heavyCladding);
            formData.addInput('appendages', _appendages);
            formData.addInput('otherFallingHazards', _otherFallingHazards);
            formData.addInput(
                'otherFallingHazardsText', _otherFallingHazardsController.text);
            formData.addInput('vertical', _vertical);
            formData.addInput('plan', _plan);
            formData.addInput('selectedBuildingType', buildingType);
            formData.addInput(
                'selectedVerticalIrregularity', _selectedVerticalIrregularity);
            formData.addInput('hasPlanIrregularity', _hasPlanIrregularity);
            formData.addInput('basicScore', _basicScore);
            formData.addInput('preCode', _preCode);
            formData.addInput('postBenchmark', _postBenchmark);
            formData.addInput('finalScore', _finalScore);
            formData.addInput('smin', _smin);

            // Navigate back with updated form data
            Navigator.pop(context, formData.inputs);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _aboveStoriesController,
                decoration: const InputDecoration(
                  labelText: 'No. of Stories (above grade)',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _belowStoriesController,
                decoration: const InputDecoration(
                  labelText: 'No. of Stories (below grade)',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _yearBuiltController,
                          decoration: const InputDecoration(
                            labelText: 'Year Built',
                            helperText:
                                'YYYY format required, even if estimating. If year is not known, leave blank.',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the year built';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Enter a valid number';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Year Built Is Estimated?'),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio<bool>(
                                        value: false,
                                        groupValue: _isYearEstimated,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isYearEstimated = value ?? false;
                                          });
                                        },
                                      ),
                                      const Text('No'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio<bool>(
                                        value: true,
                                        groupValue: _isYearEstimated,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isYearEstimated = value ?? false;
                                          });
                                        },
                                      ),
                                      const Text('Yes'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Additions'),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('No'),
                          leading: Radio<bool>(
                            value: false,
                            groupValue: _additions,
                            onChanged: (bool? value) {
                              setState(() {
                                _additions = value ?? false;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Yes'),
                          leading: Radio<bool>(
                            value: true,
                            groupValue: _additions,
                            onChanged: (bool? value) {
                              setState(() {
                                _additions = value ?? false;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _codeYearController,
                decoration: const InputDecoration(
                  labelText: 'Code Year',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _totalAreaController,
                decoration: const InputDecoration(
                  labelText: 'Total floor Area (square feet)',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              const Text("Occupancy:"),
              DropdownButtonFormField<String>(
                value: _selectedOccupancy,
                onChanged: (newValue) {
                  setState(() {
                    _selectedOccupancy = newValue;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'A', child: Text('Assembly (A)')),
                  DropdownMenuItem(value: 'B', child: Text('Industrial (B)')),
                  DropdownMenuItem(value: 'C', child: Text('Utility (C)')),
                  DropdownMenuItem(value: 'D', child: Text('Commercial (D)')),
                  DropdownMenuItem(value: 'E', child: Text('Office (E)')),
                  DropdownMenuItem(value: 'F', child: Text('Warehouse (F)')),
                  DropdownMenuItem(
                      value: 'G', child: Text('Emer. Services (G)')),
                  DropdownMenuItem(value: 'H', child: Text('Residential (H)')),
                  DropdownMenuItem(value: 'I', child: Text('Historic (I)')),
                  DropdownMenuItem(value: 'J', child: Text('School (J)')),
                  DropdownMenuItem(value: 'K', child: Text('Shelter (K)')),
                  DropdownMenuItem(value: 'L', child: Text('Government (L)')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Select Occupancy',
                ),
              ),
              if (_selectedOccupancy == 'H')
                TextFormField(
                  controller: _numberOfApartmentsController,
                  decoration: const InputDecoration(
                    labelText: 'Number of Apartments',
                  ),
                  keyboardType: TextInputType.number,
                ),
              const SizedBox(height: 16),
              const Text("Soil Type:"),
              DropdownButtonFormField<String>(
                value: _selectedSoilType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedSoilType = newValue;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'A', child: Text('Hard Rock (A)')),
                  DropdownMenuItem(value: 'B', child: Text('Average Rock (B)')),
                  DropdownMenuItem(value: 'C', child: Text('Dense Soil (C)')),
                  DropdownMenuItem(value: 'D', child: Text('Stiff Soil (D)')),
                  DropdownMenuItem(value: 'E', child: Text('Soft Soil (E)')),
                  DropdownMenuItem(value: 'F', child: Text('Poor Soil (F)')),
                  DropdownMenuItem(
                      value: 'DNK', child: Text('DNK (If DNK, assume Type D)')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Select Soil Type',
                ),
              ),
              const SizedBox(height: 16),
              const Text("Geologic Hazards:"),
              CheckboxListTile(
                title: const Text('Liquefaction'),
                value: _liquefaction,
                onChanged: (bool? newValue) {
                  setState(() {
                    _liquefaction = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Landslide'),
                value: _landslide,
                onChanged: (bool? newValue) {
                  setState(() {
                    _landslide = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Surface Rupture'),
                value: _surfaceRupture,
                onChanged: (bool? newValue) {
                  setState(() {
                    _surfaceRupture = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text("Adjacency:"),
              CheckboxListTile(
                title: const Text('Pounding'),
                value: _pounding,
                onChanged: (bool? newValue) {
                  setState(() {
                    _pounding = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title:
                    const Text('Falling Hazards from taller Adjacent Building'),
                value: _fallingHazards,
                onChanged: (bool? newValue) {
                  setState(() {
                    _fallingHazards = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text("Exterior falling hazards:"),
              CheckboxListTile(
                title: const Text('Unbraced Chimneys'),
                value: _unbracedChimneys,
                onChanged: (bool? newValue) {
                  setState(() {
                    _unbracedChimneys = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Parapets'),
                value: _parapets,
                onChanged: (bool? newValue) {
                  setState(() {
                    _parapets = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Heavy Cladding or Heavy Veneer'),
                value: _heavyCladding,
                onChanged: (bool? newValue) {
                  setState(() {
                    _heavyCladding = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Appendages'),
                value: _appendages,
                onChanged: (bool? newValue) {
                  setState(() {
                    _appendages = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Other'),
                value: _otherFallingHazards,
                onChanged: (bool? newValue) {
                  setState(() {
                    _otherFallingHazards = newValue!;
                  });
                },
              ),
              if (_otherFallingHazards)
                TextFormField(
                  controller: _otherFallingHazardsController,
                  decoration: const InputDecoration(
                    labelText: 'Other Falling Hazards',
                  ),
                ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _navigateToNextPage,
                child: const Text('Next'),
              ),
            ], // children
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _aboveStoriesController.dispose();
    _belowStoriesController.dispose();
    _yearBuiltController.dispose();
    _codeYearController.dispose();
    _totalAreaController.dispose();
    _numberOfApartmentsController.dispose();
    _otherFallingHazardsController.dispose();

    super.dispose();
  }
}
