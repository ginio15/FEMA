import 'package:flutter/material.dart';
import 'formData_for_global_store.dart'; // Import FormData

class ExtentOfReviewPage extends StatefulWidget {
  final String exteriorSelection;
  final String interiorSelection;
  final String drawingsReviewed;
  final bool poundingPotential;
  final bool fallingHazards;
  final bool geologicHazards;
  final bool significantDamage;
  final bool unknownFEMA;
  final bool scoreLessThanCutoff;
  final bool otherHazardsPresent;
  final bool noStructuralEvaluation;
  final String? nonStructuralEvaluation;
  final String soilTypeSource;
  final String geologicHazardsSource;
  final String contactPerson;

  const ExtentOfReviewPage({
    super.key,
    this.exteriorSelection = '',
    this.interiorSelection = '',
    this.drawingsReviewed = '',
    this.poundingPotential = false,
    this.fallingHazards = false,
    this.geologicHazards = false,
    this.significantDamage = false,
    this.unknownFEMA = false,
    this.scoreLessThanCutoff = false,
    this.otherHazardsPresent = false,
    this.noStructuralEvaluation = false,
    this.nonStructuralEvaluation,
    this.soilTypeSource = '',
    this.geologicHazardsSource = '',
    this.contactPerson = '',
  });

  @override
  _ExtentOfReviewPageState createState() => _ExtentOfReviewPageState();
}

class _ExtentOfReviewPageState extends State<ExtentOfReviewPage> {
  String _exteriorSelection = '';
  String _interiorSelection = '';
  String _drawingsReviewed = '';
  bool poundingPotential = false;
  bool fallingHazards = false;
  bool geologicHazards = false;
  bool significantDamage = false;
  bool unknownFEMA = false;
  bool scoreLessThanCutoff = false;
  bool otherHazardsPresent = false;
  bool noStructuralEvaluation = false;
  String? nonStructuralEvaluation;
  TextEditingController soilTypeController = TextEditingController();
  TextEditingController geologicHazardsController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FormData formData = FormData();

    // Initialize with FormData first, fallback to widget parameters
    _exteriorSelection =
        formData.inputs['exteriorSelection'] ?? widget.exteriorSelection;
    _interiorSelection =
        formData.inputs['interiorSelection'] ?? widget.interiorSelection;
    _drawingsReviewed =
        formData.inputs['drawingsReviewed'] ?? widget.drawingsReviewed;
    poundingPotential =
        formData.inputs['poundingPotential'] ?? widget.poundingPotential;
    fallingHazards = formData.inputs['fallingHazards'] ?? widget.fallingHazards;
    geologicHazards =
        formData.inputs['geologicHazards'] ?? widget.geologicHazards;
    significantDamage =
        formData.inputs['significantDamage'] ?? widget.significantDamage;
    unknownFEMA = formData.inputs['unknownFEMA'] ?? widget.unknownFEMA;
    scoreLessThanCutoff =
        formData.inputs['scoreLessThanCutoff'] ?? widget.scoreLessThanCutoff;
    otherHazardsPresent =
        formData.inputs['otherHazardsPresent'] ?? widget.otherHazardsPresent;
    noStructuralEvaluation = formData.inputs['noStructuralEvaluation'] ??
        widget.noStructuralEvaluation;
    nonStructuralEvaluation = formData.inputs['nonStructuralEvaluation'] ??
        widget.nonStructuralEvaluation;
    soilTypeController.text =
        formData.inputs['soilTypeSource'] ?? widget.soilTypeSource;
    geologicHazardsController.text = formData.inputs['geologicHazardsSource'] ??
        widget.geologicHazardsSource;
    contactPersonController.text =
        formData.inputs['contactPerson'] ?? widget.contactPerson;
  }

  void _saveToFormData() {
    FormData formData = FormData();
    formData.addInput('exteriorSelection', _exteriorSelection);
    formData.addInput('interiorSelection', _interiorSelection);
    formData.addInput('drawingsReviewed', _drawingsReviewed);
    formData.addInput('poundingPotential', poundingPotential);
    formData.addInput('fallingHazards', fallingHazards);
    formData.addInput('geologicHazards', geologicHazards);
    formData.addInput('significantDamage', significantDamage);
    formData.addInput('unknownFEMA', unknownFEMA);
    formData.addInput('scoreLessThanCutoff', scoreLessThanCutoff);
    formData.addInput('otherHazardsPresent', otherHazardsPresent);
    formData.addInput('noStructuralEvaluation', noStructuralEvaluation);
    formData.addInput('nonStructuralEvaluation', nonStructuralEvaluation);
    formData.addInput('soilTypeSource', soilTypeController.text);
    formData.addInput('geologicHazardsSource', geologicHazardsController.text);
    formData.addInput('contactPerson', contactPersonController.text);
  }

  void _submitSelections() {
    _saveToFormData();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extent of Review'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _submitSelections,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Exterior Review Section
              ExpansionTile(
                title: const Text('Exterior'),
                children: <Widget>[
                  RadioListTile(
                    title: const Text('Partial'),
                    value: 'Partial',
                    groupValue: _exteriorSelection,
                    onChanged: (value) {
                      setState(() {
                        _exteriorSelection = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('All Sides'),
                    value: 'All Sides',
                    groupValue: _exteriorSelection,
                    onChanged: (value) {
                      setState(() {
                        _exteriorSelection = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Aerial'),
                    value: 'Aerial',
                    groupValue: _exteriorSelection,
                    onChanged: (value) {
                      setState(() {
                        _exteriorSelection = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Interior Review Section
              ExpansionTile(
                title: const Text('Interior'),
                children: <Widget>[
                  RadioListTile(
                    title: const Text('None'),
                    value: 'None',
                    groupValue: _interiorSelection,
                    onChanged: (value) {
                      setState(() {
                        _interiorSelection = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Visible'),
                    value: 'Visible',
                    groupValue: _interiorSelection,
                    onChanged: (value) {
                      setState(() {
                        _interiorSelection = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Entered'),
                    value: 'Entered',
                    groupValue: _interiorSelection,
                    onChanged: (value) {
                      setState(() {
                        _interiorSelection = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Drawings Reviewed Section
              ExpansionTile(
                title: const Text('Drawings Reviewed'),
                children: <Widget>[
                  RadioListTile(
                    title: const Text('No'),
                    value: 'No',
                    groupValue: _drawingsReviewed,
                    onChanged: (value) {
                      setState(() {
                        _drawingsReviewed = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Yes'),
                    value: 'Yes',
                    groupValue: _drawingsReviewed,
                    onChanged: (value) {
                      setState(() {
                        _drawingsReviewed = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Hazards Section
              ExpansionTile(
                title: const Text('Other Hazards and Action Required'),
                children: <Widget>[
                  CheckboxListTile(
                    title: const Text(
                        'Pounding potential (unless SL2 > cut-off, if known)'),
                    value: poundingPotential,
                    onChanged: (bool? value) {
                      setState(() {
                        poundingPotential = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                        'Falling hazards from taller adjacent building'),
                    value: fallingHazards,
                    onChanged: (bool? value) {
                      setState(() {
                        fallingHazards = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Geologic hazards or Soil Type F'),
                    value: geologicHazards,
                    onChanged: (bool? value) {
                      setState(() {
                        geologicHazards = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                        'Significant damage/deterioration to the structural system'),
                    value: significantDamage,
                    onChanged: (bool? value) {
                      setState(() {
                        significantDamage = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Structural Evaluation Section
              ExpansionTile(
                title: const Text('Detailed Structural Evaluation Required?'),
                children: <Widget>[
                  CheckboxListTile(
                    title: const Text(
                        'Yes, unknown FEMA building type or other building'),
                    value: unknownFEMA,
                    onChanged: (bool? value) {
                      setState(() {
                        unknownFEMA = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Yes, score less than the cut-off'),
                    value: scoreLessThanCutoff,
                    onChanged: (bool? value) {
                      setState(() {
                        scoreLessThanCutoff = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Yes, other hazards present'),
                    value: otherHazardsPresent,
                    onChanged: (bool? value) {
                      setState(() {
                        otherHazardsPresent = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('No'),
                    value: noStructuralEvaluation,
                    onChanged: (bool? value) {
                      setState(() {
                        noStructuralEvaluation = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Nonstructural Evaluation Section
              ExpansionTile(
                title: const Text(
                    'Detailed Nonstructural Evaluation Recommended?'),
                children: <Widget>[
                  RadioListTile<String>(
                    title: const Text(
                        'Yes, nonstructural hazards identified that should be evaluated'),
                    value: 'YesHazards',
                    groupValue: nonStructuralEvaluation,
                    onChanged: (String? value) {
                      setState(() {
                        nonStructuralEvaluation = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text(
                        'No, nonstructural hazards exist but evaluation is not necessary'),
                    value: 'NoButMitigation',
                    groupValue: nonStructuralEvaluation,
                    onChanged: (String? value) {
                      setState(() {
                        nonStructuralEvaluation = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title:
                        const Text('No, no nonstructural hazards identified'),
                    value: 'NoHazards',
                    groupValue: nonStructuralEvaluation,
                    onChanged: (String? value) {
                      setState(() {
                        nonStructuralEvaluation = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Do Not Know'),
                    value: 'DoNotKnow',
                    groupValue: nonStructuralEvaluation,
                    onChanged: (String? value) {
                      setState(() {
                        nonStructuralEvaluation = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Text Field: Soil Type Source
              TextField(
                controller: soilTypeController,
                decoration: const InputDecoration(
                  labelText: 'Soil Type Source',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Text Field: Geologic Hazards Source
              TextField(
                controller: geologicHazardsController,
                decoration: const InputDecoration(
                  labelText: 'Geologic Hazards Source',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Text Field: Contact Person
              TextField(
                controller: contactPersonController,
                decoration: const InputDecoration(
                  labelText: 'Contact Person',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Submit Button
              const SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  _saveToFormData();
                  // Save current form inputs to FormData
                  FormData formData = FormData();
                  formData.addInput('exteriorSelection', _exteriorSelection);
                  formData.addInput('interiorSelection', _interiorSelection);
                  formData.addInput('drawingsReviewed', _drawingsReviewed);
                  formData.addInput('poundingPotential', poundingPotential);
                  formData.addInput('fallingHazards', fallingHazards);
                  formData.addInput('geologicHazards', geologicHazards);
                  formData.addInput('significantDamage', significantDamage);
                  formData.addInput('unknownFEMA', unknownFEMA);
                  formData.addInput('scoreLessThanCutoff', scoreLessThanCutoff);
                  formData.addInput('otherHazardsPresent', otherHazardsPresent);
                  formData.addInput(
                      'noStructuralEvaluation', noStructuralEvaluation);
                  formData.addInput(
                      'nonStructuralEvaluation', nonStructuralEvaluation);

                  formData.addInput('soilTypeSource', soilTypeController.text);
                  formData.addInput(
                      'geologicHazardsSource', geologicHazardsController.text);
                  formData.addInput(
                      'contactPerson', contactPersonController.text);

                  // Print all collected data to the terminal in a categorized way
                  print('--- All Collected Form Data ---');

                  // Seismicity Form Data
                  print('--- Seismicity Form ---');
                  print('address: ${formData.inputs['address']}');
                  print('zip: ${formData.inputs['zip']}');
                  print(
                      'otherIdentifiers: ${formData.inputs['otherIdentifiers']}');
                  print('buildingName: ${formData.inputs['buildingName']}');
                  print('use: ${formData.inputs['use']}');
                  print('latitude: ${formData.inputs['latitude']}');
                  print('longitude: ${formData.inputs['longitude']}');
                  print('ss: ${formData.inputs['ss']}');
                  print('s1: ${formData.inputs['s1']}');
                  print('screeners: ${formData.inputs['screeners']}');
                  print('dateTime: ${formData.inputs['dateTime']}');

                  // Building Info Form Data
                  print('--- Building Info Form ---');
                  print('aboveStories: ${formData.inputs['aboveStories']}');
                  print('belowStories: ${formData.inputs['belowStories']}');
                  print('yearBuilt: ${formData.inputs['yearBuilt']}');
                  print(
                      'isYearEstimated: ${formData.inputs['isYearEstimated']}');
                  print('additions: ${formData.inputs['additions']}');
                  print('codeYear: ${formData.inputs['codeYear']}');
                  print('totalArea: ${formData.inputs['totalArea']}');
                  print(
                      'selectedOccupancy: ${formData.inputs['selectedOccupancy']}');
                  print(
                      'numberOfApartments: ${formData.inputs['numberOfApartments']}');
                  print(
                      'selectedSoilType: ${formData.inputs['selectedSoilType']}');
                  print('liquefaction: ${formData.inputs['liquefaction']}');
                  print('landslide: ${formData.inputs['landslide']}');
                  print('surfaceRupture: ${formData.inputs['surfaceRupture']}');
                  print('pounding: ${formData.inputs['pounding']}');
                  print('fallingHazards: ${formData.inputs['fallingHazards']}');
                  print(
                      'unbracedChimneys: ${formData.inputs['unbracedChimneys']}');
                  print('parapets: ${formData.inputs['parapets']}');
                  print('heavyCladding: ${formData.inputs['heavyCladding']}');
                  print('appendages: ${formData.inputs['appendages']}');
                  print(
                      'otherFallingHazards: ${formData.inputs['otherFallingHazards']}');
                  print(
                      'otherFallingHazardsText: ${formData.inputs['otherFallingHazardsText']}');

                  // Building Type Form Data
                  print('--- Building Type Form ---');
                  print(
                      'selectedBuildingType: ${formData.inputs['selectedBuildingType']}');
                  print(
                      'selectedVerticalIrregularity: ${formData.inputs['selectedVerticalIrregularity']}');
                  print(
                      'hasPlanIrregularity: ${formData.inputs['hasPlanIrregularity']}');
                  print('basicScore: ${formData.inputs['basicScore']}');
                  print('preCode: ${formData.inputs['preCode']}');
                  print('postBenchmark: ${formData.inputs['postBenchmark']}');
                  print('finalScore: ${formData.inputs['finalScore']}');
                  print('smin: ${formData.inputs['smin']}');

                  // Extent of Review Form Data
                  print('--- Extent of Review Form ---');
                  print(
                      'exteriorSelection: ${formData.inputs['exteriorSelection']}');
                  print(
                      'interiorSelection: ${formData.inputs['interiorSelection']}');
                  print(
                      'drawingsReviewed: ${formData.inputs['drawingsReviewed']}');
                  print(
                      'poundingPotential: ${formData.inputs['poundingPotential']}');
                  print('fallingHazards: ${formData.inputs['fallingHazards']}');
                  print(
                      'geologicHazards: ${formData.inputs['geologicHazards']}');
                  print(
                      'significantDamage: ${formData.inputs['significantDamage']}');
                  print('unknownFEMA: ${formData.inputs['unknownFEMA']}');
                  print(
                      'scoreLessThanCutoff: ${formData.inputs['scoreLessThanCutoff']}');
                  print(
                      'otherHazardsPresent: ${formData.inputs['otherHazardsPresent']}');
                  print(
                      'noStructuralEvaluation: ${formData.inputs['noStructuralEvaluation']}');
                  print(
                      'nonStructuralEvaluation: ${formData.inputs['nonStructuralEvaluation']}');
                  print('soilTypeSource: ${formData.inputs['soilTypeSource']}');
                  print(
                      'geologicHazardsSource: ${formData.inputs['geologicHazardsSource']}');
                  print('contactPerson: ${formData.inputs['contactPerson']}');

                  print('--------------------------------');

                  // Optionally, show a confirmation to the user
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: ExtentOfReviewPage(),
    ));
