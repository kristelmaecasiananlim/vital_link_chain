import 'package:flutter/material.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({super.key});

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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Medical Certificate History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildHistoryHeader(),
                  _buildHistoryRow(
                    'March 20, 2025',
                    'Dr. Smith',
                    'Excuse for Absence',
                    'Valid',
                  ),
                  _buildHistoryRow(
                    'February 15, 2025',
                    'Dr. Lee',
                    'Excuse for Absence',
                    'Expired',
                  ),
                  _buildHistoryRow(
                    'January 10, 2025',
                    'Dr. Patel',
                    'Medical Clearance',
                    'Valid',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: const [
          Expanded(
            child: Text('Date Issued', style: TextStyle(color: Colors.grey)),
          ),
          Expanded(child: Text('Doctor', style: TextStyle(color: Colors.grey))),
          Expanded(child: Text('Reason', style: TextStyle(color: Colors.grey))),
          Expanded(child: Text('Status', style: TextStyle(color: Colors.grey))),
          SizedBox(width: 50), // For View icon
        ],
      ),
    );
  }

  Widget _buildHistoryRow(
    String date,
    String doctor,
    String reason,
    String status,
  ) {
    Color statusColor = status == 'Valid' ? Colors.green : Colors.red;
    Color bgColor =
        status == 'Valid' ? Colors.greenAccent.shade100 : Colors.red.shade100;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(child: Text(date)),
          Expanded(child: Text(doctor)),
          Expanded(child: Text(reason)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Icon(Icons.remove_red_eye, color: Colors.blue),
        ],
      ),
    );
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
