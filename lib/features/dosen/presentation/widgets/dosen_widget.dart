import 'package:flutter/material.dart';
import 'package:d4tivokasi/core/constants/constants.dart';
import 'package:d4tivokasi/features/dosen/data/models/dosen_model.dart';

class ModernDosenCard extends StatefulWidget {
  final DosenModel dosen;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const ModernDosenCard({
    Key? key,
    required this.dosen,
    this.onTap,
    this.gradientColors,
  }) : super(key: key);

  @override
  State<ModernDosenCard> createState() => _ModernDosenCardState();
}

class _ModernDosenCardState extends State<ModernDosenCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    ); // AnimationController
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors =
        widget.gradientColors ??
        [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(0.7),
        ];

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, gradientColors[0].withOpacity(0.05)],
            ), // LinearGradient
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: gradientColors[0].withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ), // BoxShadow
            ],
            border: Border.all(
              color: gradientColors[0].withOpacity(0.1),
              width: 1,
            ), // Border.all
          ), // BoxDecoration
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar with Gradient
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ), // LinearGradient
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: gradientColors[0].withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ), // BoxShadow
                    ],
                  ), // BoxDecoration
                  child: Center(
                    child: Text(
                      widget.dosen.nama.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ), // TextStyle
                    ), // Text
                  ), // Center
                ), // Container
                const SizedBox(width: 16),

                // Dosen Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.dosen.nama,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.3,
                        ), // TextStyle
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ), // Text
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.badge_outlined,
                        'NIP: ${widget.dosen.nip}',
                      ),
                      const SizedBox(height: 4),
                      _buildInfoRow(
                        Icons.email_outlined,
                        widget.dosen.email,
                      ),
                      const SizedBox(height: 4),
                      _buildInfoRow(
                        Icons.school_outlined,
                        widget.dosen.jurusan,
                      ),
                    ],
                  ), // Column
                ), // Expanded

                // Arrow Icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: gradientColors[0].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ), // BoxDecoration
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: gradientColors[0],
                  ), // Icon
                ), // Container
              ],
            ), // Row
          ), // Padding
        ), // Container
      ), // ScaleTransition
    ); // GestureDetector
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ), // Text
        ), // Expanded
      ],
    ); // Row
  }
}

/// DosenListView Widget
class DosenListView extends StatelessWidget {
  final List<DosenModel> dosenList;
  final VoidCallback? onRefresh;
  final bool useModernCard;

  const DosenListView({
    super.key,
    required this.dosenList,
    this.onRefresh,
    this.useModernCard = true,
  });

  @override
  Widget build(BuildContext context) {
    if (dosenList.isEmpty) {
      return const Center(child: Text('Tidak ada data dosen'));
    }

    final gradients = AppConstants.dashboardGradients;

    return RefreshIndicator(
      onRefresh: () async {
        onRefresh?.call();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: dosenList.length,
        itemBuilder: (context, index) {
          final dosen = dosenList[index];
          return ModernDosenCard(
            dosen: dosen,
            gradientColors: gradients[index % gradients.length],
            onTap: () {
              _showDosenDetail(context, dosen, gradients[index % gradients.length]);
            },
          );
        },
      ),
    );
  }

  void _showDosenDetail(
    BuildContext context,
    DosenModel dosen,
    List<Color> gradientColors,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _DosenDetailSheet(
        dosen: dosen,
        gradientColors: gradientColors,
      ),
    );
  }
}

class _DosenDetailSheet extends StatelessWidget {
  final DosenModel dosen;
  final List<Color> gradientColors;

  const _DosenDetailSheet({
    required this.dosen,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradientColors),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                dosen.nama.substring(0, 1).toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            dosen.nama,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildDetailRow(Icons.badge_outlined, 'NIP', dosen.nip),
          const Divider(),
          _buildDetailRow(Icons.email_outlined, 'Email', dosen.email),
          const Divider(),
          _buildDetailRow(Icons.school_outlined, 'Jurusan', dosen.jurusan),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: gradientColors[0], size: 20),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}