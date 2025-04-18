import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  _CertificatePageState createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _diagnosisController = TextEditingController();
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const String blockchainHash = "0x7d4f8b3a2e1c9d6b5f0...";

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0DC5E8),
        elevation: 0,
        title: const Text(
          'Certificate Details',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column - Certificate Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Latest Medical Certificate',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 12),
                        InfoText(label: 'Issue Date', value: 'March 20, 2025'),
                        InfoText(
                          label: 'Issuing Doctor',
                          value: 'Dr. Sarah Smith',
                        ),
                        InfoText(
                          label: 'Purpose',
                          value: 'Excuse for Absence (3 days)',
                        ),
                        InfoText(label: 'Institution', value: 'WVSU Clinic'),
                        InfoText(
                          label: 'Status',
                          value: 'Valid',
                          isStatus: true,
                        ),
                        InfoText(
                          label: 'Validity Period',
                          value: 'March 20 – March 23, 2025',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Right Column - Verification
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Verification',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Blockchain Certificate',
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            // Optional: open explorer
                          },
                          child: Text(
                            blockchainHash,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Download PDF logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0DC5E8),
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Download PDF'),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to detailed view
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0DC5E8),
                                foregroundColor: Colors.white,
                              ),
                              child: const Row(
                                children: [
                                  Text('View Details'),
                                  Icon(Icons.arrow_right_alt),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            _uploadPrescription(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0DC5E8),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Upload Lab Results'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Enter Diagnosis Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _diagnosisController,
                      decoration: const InputDecoration(labelText: 'Diagnosis'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a diagnosis';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _doctorNameController,
                      decoration: const InputDecoration(
                        labelText: 'Doctor Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the doctor\'s name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(labelText: 'Date'),
                      keyboardType: TextInputType.datetime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(labelText: 'Notes'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await _generateAndUploadPdf();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0DC5E8),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Generate and Upload Diagnosis PDF'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateAndUploadPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Diagnosis: ${_diagnosisController.text}'),
              pw.Text('Doctor: ${_doctorNameController.text}'),
              pw.Text('Date: ${_dateController.text}'),
              pw.Text('Notes: ${_notesController.text}'),
            ],
          );
        },
      ),
    );

    // Save PDF to file
    final outputDirectory = await getTemporaryDirectory();
    final outputFile = File('${outputDirectory.path}/diagnosis.pdf');
    await outputFile.writeAsBytes(await pdf.save());

    // Upload the file to IPFS (or MongoDB)
    String ipfsHash = await _uploadToIPFS(outputFile);

    // Display the IPFS hash for reference
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Uploaded to IPFS: $ipfsHash')));
  }

  Future<String> _uploadToIPFS(File file) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://ipfs.infura.io:5001/api/v0/add'),
    );
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    var response = await request.send();
    var responseData = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      var responseJson = responseData.body;
      // Extract IPFS hash from the response
      String ipfsHash = 'ipfs://somehash'; // Extract from responseJson
      return ipfsHash;
    } else {
      throw Exception('Failed to upload file to IPFS');
    }
  }

  Future<void> _uploadPrescription(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final file = result.files.single;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Selected file: ${file.name}')));

      String ipfsHash = await _uploadToIPFS(File(file.path!));
      print('Uploaded file hash to IPFS: $ipfsHash');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No file selected')));
    }
  }
}

class InfoText extends StatelessWidget {
  final String label;
  final String value;
  final bool isStatus;

  const InfoText({
    super.key,
    required this.label,
    required this.value,
    this.isStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(color: Colors.grey)),
          isStatus
              ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              : Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        ],
      ),
    );
  }
}
