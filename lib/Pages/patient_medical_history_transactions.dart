import 'package:flutter/material.dart';

class MedicalAccessPage extends StatelessWidget {
  const MedicalAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0DC5E8),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // Handle profile tap
              },
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 20, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Medical History Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            _transactionCard(
              icon: Icons.visibility,
              title: 'Record Viewed',
              doctor: 'Dr. Sarah Smith',
              affiliation: 'WVSU Clinic',
              hash: '0x4d3f...3fdfg7r',
              date: 'March 21, 2025',
              onHashTap: () {},
              onMoreTap: () {},
              onReportTap: () {},
            ),
            const SizedBox(height: 12),
            _transactionCard(
              icon: Icons.verified,
              title: 'Record Shared',
              doctor: 'Dr. Sarah Smith',
              affiliation: 'WVSU Clinic',
              hash: '0x4d3f...3fdfg7r',
              date: 'March 21, 2025',
              onHashTap: () {},
              onMoreTap: () {},
              onReportTap: () {},
            ),
            const SizedBox(height: 32),
            const Text(
              'Active Access Permissions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _accessPermissionCard(
              name: 'Dr. Sarah Smith',
              clinic: 'WVSU Clinic',
              expiresIn: '7 days',
              onGrantAccess: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionCard({
    required IconData icon,
    required String title,
    required String doctor,
    required String affiliation,
    required String hash,
    required String date,
    required VoidCallback onHashTap,
    required VoidCallback onMoreTap,
    required VoidCallback onReportTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF0DC5E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          // Main content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doctor: $doctor',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: onReportTap,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.description,
                                  size: 16,
                                  color: Colors.lightBlue,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Diagnosis Report',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Affiliation: $affiliation',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: onHashTap,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.link,
                                  size: 16,
                                  color: Colors.lightBlue,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  hash,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: onMoreTap,
                child: const Icon(Icons.more_horiz, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _accessPermissionCard({
    required String name,
    required String clinic,
    required String expiresIn,
    required VoidCallback onGrantAccess,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(clinic, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text(
                  'Access Expires in $expiresIn',
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onGrantAccess,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0DC5E8),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Grant Access'),
          ),
        ],
      ),
    );
  }
}
