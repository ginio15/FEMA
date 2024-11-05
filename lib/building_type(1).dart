import 'package:flutter/material.dart';
import 'review.dart';
import 'formData_for_global_store.dart'; // Import FormData

class BuildingTypePage extends StatefulWidget {
  final String initialBuildingType;
  final String? initialVerticalIrregularity;
  final bool? initialPlanIrregularity;
  final String initialBasicScore;
  final bool? initalPreCode;
  final bool? initalPostBenchmark;
  final String? initialFinalScore;
  final String? initialSmin;

  const BuildingTypePage({
    super.key,
    required this.initialBuildingType,
    this.initialVerticalIrregularity,
    this.initialPlanIrregularity,
    required this.initialBasicScore,
    this.initalPreCode,
    this.initalPostBenchmark,
    this.initialFinalScore,
    this.initialSmin,
  });

  @override
  _BuildingTypePageState createState() => _BuildingTypePageState();
}

class _BuildingTypePageState extends State<BuildingTypePage> {
  String selectedWood = '';
  String selectedSteel = '';
  String selectedConcrete = '';
  String selectedMissionary = '';
  String selectedHousing = '';
  String? selectedVerticalIrregularity;
  bool? hasPlanIrregularity;
  bool? isPreCode;
  bool? isPostBenchmark;
  String? finalScore;
  String? smin;
  String? exteriorSelection;
  String? interiorSelection;
  String? drawingsReviewed;
  bool? poundingPotential;
  bool? fallingHazards;
  bool? geologicHazards;
  bool? significantDamage;
  bool? unknownFEMA;
  bool? scoreLessThanCutoff;
  bool? otherHazardsPresent;
  bool? noStructuralEvaluation;
  String? nonStructuralEvaluation;
  String? soilTypeSource;
  String? geologicHazardsSource;
  String? contactPerson;

  final _basicScoreController = TextEditingController(); // Add this controller
  final _sminController =
      TextEditingController(); // Controller for Minimum Score (Smin)
  final _finalScoreController =
      TextEditingController(); // Controller for Final Level 1 Score

  @override
  void initState() {
    super.initState();
    // Get data from FormData singleton first, fallback to widget parameters
    FormData formData = FormData();

    // Initialize the correct building type
    String storedBuildingType =
        formData.inputs['selectedBuildingType'] ?? widget.initialBuildingType;
    if (['W1', 'W1A', 'W2'].contains(storedBuildingType)) {
      selectedWood = storedBuildingType;
    } else if (['S1', 'S2', 'S3', 'S4', 'S5'].contains(storedBuildingType)) {
      selectedSteel = storedBuildingType;
    } else if (['C1', 'C2', 'C3', 'PC1', 'PC2'].contains(storedBuildingType)) {
      selectedConcrete = storedBuildingType;
    } else if (['RM1', 'RM2', 'URM'].contains(storedBuildingType)) {
      selectedMissionary = storedBuildingType;
    } else if (storedBuildingType == 'MH') {
      selectedHousing = storedBuildingType;
    }

    // Initialize other fields from FormData or widget parameters
    selectedVerticalIrregularity =
        formData.inputs['selectedVerticalIrregularity'] ??
            widget.initialVerticalIrregularity;
    hasPlanIrregularity = formData.inputs['hasPlanIrregularity'] ??
        widget.initialPlanIrregularity;
    _basicScoreController.text =
        formData.inputs['basicScore'] ?? widget.initialBasicScore;
    isPreCode = formData.inputs['preCode'] ?? widget.initalPreCode;
    isPostBenchmark =
        formData.inputs['postBenchmark'] ?? widget.initalPostBenchmark;
    _finalScoreController.text =
        formData.inputs['finalScore'] ?? widget.initialFinalScore ?? '';
    _sminController.text = formData.inputs['smin'] ?? widget.initialSmin ?? '';
  }

  void _saveToFormData() {
    FormData formData = FormData();
    formData.addInput('selectedBuildingType', getSelectedBuildingType());
    formData.addInput(
        'selectedVerticalIrregularity', selectedVerticalIrregularity);
    formData.addInput('hasPlanIrregularity', hasPlanIrregularity);
    formData.addInput('basicScore', _basicScoreController.text);
    formData.addInput('preCode', isPreCode);
    formData.addInput('postBenchmark', isPostBenchmark);
    formData.addInput('finalScore', _finalScoreController.text);
    formData.addInput('smin', _sminController.text);
  }

  void _navigateToReviewPage() {
    _saveToFormData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ExtentOfReviewPage(
            // Pass existing data...
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Building Type'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _saveToFormData();
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          // Wood Section
          ExpansionTile(
            title: const Text('Wood'),
            children: [
              ListTile(
                title: const Text('Select Type'),
                trailing: DropdownButton<String>(
                  value: selectedWood.isNotEmpty ? selectedWood : null,
                  hint: const Text("Choose one"),
                  onChanged: (newValue) {
                    setState(() {
                      selectedWood = newValue!;
                      resetOtherSelections('Wood');
                    });
                  },
                  items: ['W1', 'W1A', 'W2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          // Steel Section
          ExpansionTile(
            title: const Text('Steel'),
            children: [
              ListTile(
                title: const Text('Select Type'),
                trailing: DropdownButton<String>(
                  value: selectedSteel.isNotEmpty ? selectedSteel : null,
                  hint: const Text("Choose one"),
                  onChanged: (newValue) {
                    setState(() {
                      selectedSteel = newValue!;
                      resetOtherSelections('Steel');
                    });
                  },
                  items: ['S1', 'S2', 'S3', 'S4', 'S5']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          // Concrete Section
          ExpansionTile(
            title: const Text('Concrete'),
            children: [
              ListTile(
                title: const Text('Select Type'),
                trailing: DropdownButton<String>(
                  value: selectedConcrete.isNotEmpty ? selectedConcrete : null,
                  hint: const Text("Choose one"),
                  onChanged: (newValue) {
                    setState(() {
                      selectedConcrete = newValue!;
                      resetOtherSelections('Concrete');
                    });
                  },
                  items: ['C1', 'C2', 'C3', 'PC1', 'PC2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          // Missionary Section
          ExpansionTile(
            title: const Text('Masonry'),
            children: [
              ListTile(
                title: const Text('Select Type'),
                trailing: DropdownButton<String>(
                  value:
                      selectedMissionary.isNotEmpty ? selectedMissionary : null,
                  hint: const Text("Choose one"),
                  onChanged: (newValue) {
                    setState(() {
                      selectedMissionary = newValue!;
                      resetOtherSelections('Missionary');
                    });
                  },
                  items: ['RM1', 'RM2', 'URM']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          // Manufactured Housing Section
          ExpansionTile(
            title: const Text('Manufactured Housing'),
            children: [
              ListTile(
                title: const Text('Select Type'),
                trailing: DropdownButton<String>(
                  value: selectedHousing.isNotEmpty ? selectedHousing : null,
                  hint: const Text("Choose one"),
                  onChanged: (newValue) {
                    setState(() {
                      selectedHousing = newValue!;
                      resetOtherSelections('Housing');
                    });
                  },
                  items: ['MH'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          // Basic Score Section
          const SizedBox(height: 16),
          TextFormField(
            controller: _basicScoreController,
            decoration: const InputDecoration(
              labelText: 'Basic Score',
            ),
          ),

          const SizedBox(height: 16),
          const Text('Vertical Irregularities',
              style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile<String>(
            title: const Text('None'),
            value: 'None',
            groupValue: selectedVerticalIrregularity,
            onChanged: (String? value) {
              setState(() {
                selectedVerticalIrregularity = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Moderate'),
            value: 'Moderate',
            groupValue: selectedVerticalIrregularity,
            onChanged: (String? value) {
              setState(() {
                selectedVerticalIrregularity = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Severe'),
            value: 'Severe',
            groupValue: selectedVerticalIrregularity,
            onChanged: (String? value) {
              setState(() {
                selectedVerticalIrregularity = value;
              });
            },
          ),

          // Plan Irregularity Section
          const SizedBox(height: 16),
          const Text('Plan Irregularities',
              style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile<bool>(
            title: const Text('No'),
            value: false,
            groupValue: hasPlanIrregularity,
            onChanged: (bool? value) {
              setState(() {
                hasPlanIrregularity = value;
              });
            },
          ),
          RadioListTile<bool>(
            title: const Text('Yes'),
            value: true,
            groupValue: hasPlanIrregularity,
            onChanged: (bool? value) {
              setState(() {
                hasPlanIrregularity = value;
              });
            },
          ),

// Pre-Code Section
          const SizedBox(height: 16),
          const Text('Is This Structure Pre-Code?',
              style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile<bool>(
            title: const Text('No'),
            value: false,
            groupValue: isPreCode,
            onChanged: (bool? value) {
              setState(() {
                isPreCode = value;
              });
            },
          ),
          RadioListTile<bool>(
            title: const Text('Yes'),
            value: true,
            groupValue: isPreCode,
            onChanged: (bool? value) {
              setState(() {
                isPreCode = value;
              });
            },
          ),

// Post-Benchmark Section
          const SizedBox(height: 16),
          const Text('Is This Structure Post-Benchmark?',
              style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile<bool>(
            title: const Text('No'),
            value: false,
            groupValue: isPostBenchmark,
            onChanged: (bool? value) {
              setState(() {
                isPostBenchmark = value;
              });
            },
          ),
          RadioListTile<bool>(
            title: const Text('Yes'),
            value: true,
            groupValue: isPostBenchmark,
            onChanged: (bool? value) {
              setState(() {
                isPostBenchmark = value;
              });
            },
          ),

          ExpansionTile(
            title: const Text('Final Score'),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _sminController,
                      decoration: const InputDecoration(
                        labelText: 'Minimum Score (Smin)',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _finalScoreController,
                      decoration: const InputDecoration(
                        labelText: 'Final Level 1 Score',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),

// Navigate to Extent of Review Page
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: _navigateToReviewPage,
              child: const Text('Next'),
            ),
          ),
        ], // End of children
      ),
    );
  }

  // Helper methods
  String? getSelectedBuildingType() {
    if (selectedWood.isNotEmpty) {
      return selectedWood;
    } else if (selectedSteel.isNotEmpty) {
      return selectedSteel;
    } else if (selectedConcrete.isNotEmpty) {
      return selectedConcrete;
    } else if (selectedMissionary.isNotEmpty) {
      return selectedMissionary;
    } else if (selectedHousing.isNotEmpty) {
      return selectedHousing;
    }

    return null;
  }

  void resetOtherSelections(String s) {
    setState(() {
      if (s != 'Wood') selectedWood = '';
      if (s != 'Steel') selectedSteel = '';
      if (s != 'Concrete') selectedConcrete = '';
      if (s != 'Missionary') selectedMissionary = '';
      if (s != 'Housing') selectedHousing = '';
    });
  }
}
