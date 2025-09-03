import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const PieChartApp());
}

class PieChartApp extends StatelessWidget {
  const PieChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DaisyDisk Style Pie Chart',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      ),
      home: const Scaffold(
        body: Center(
          child: DaisyDiskPieChart(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DaisyDiskPieChart extends StatefulWidget {
  const DaisyDiskPieChart({super.key});

  @override
  State<DaisyDiskPieChart> createState() => _DaisyDiskPieChartState();
}

class _DaisyDiskPieChartState extends State<DaisyDiskPieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  DiskSegment? _hoveredSegment;
  final double _totalDiskSize = 512.0; // 512GB total disk space

  final List<DiskSegment> segments = [
  DiskSegment(
  name: "Reports",
  size: 12.5,
  color: const Color(0xFF90FFFF),
  children: [
    DiskSegment(
      name: "2025",
      size: 6.3,
      color: const Color(0xFFA0FFFF),
      children: [
        DiskSegment(
          name: "Q1",
          size: 3.2,
          color: const Color(0xFFB0FFFF),
          children: [
            DiskSegment(
              name: "Drafts",
              size: 1.6,
              color: const Color(0xFFC0FFFF),
              children: [
                DiskSegment(name: "Draft1.docx", size: 0.5, color: const Color(0xFFD0FFFF)),
                DiskSegment(name: "Draft2.docx", size: 0.6, color: const Color(0xFFE0FFFF)),
                DiskSegment(name: "Notes.txt", size: 0.5, color: const Color(0xFFF0FFFF)),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
),
    DiskSegment(
      name: "System",
      size: 42.7,
      color: const Color(0xFF7ED321),
      children: [
        DiskSegment(
          name: "macOS",
          size: 18.2,
          color: const Color(0xFF8EE331),
          children: [
            DiskSegment(name: "Core Services", size: 8.7, color: const Color(0xFF9EF341)),
            DiskSegment(name: "Frameworks", size: 6.3, color: const Color(0xFFAEF651)),
            DiskSegment(name: "Drivers", size: 3.2, color: const Color(0xFFBEF961)),
          ],
        ),
        DiskSegment(
          name: "Preferences",
          size: 12.4,
          color: const Color(0xFF9EF341),
          children: [
            DiskSegment(name: "User Settings", size: 8.1, color: const Color(0xFFAEF651)),
            DiskSegment(name: "System Config", size: 4.3, color: const Color(0xFFBEF961)),
          ],
        ),
        DiskSegment(
          name: "Caches",
          size: 12.1,
          color: const Color(0xFFAEF651),
          children: [
            DiskSegment(name: "System Caches", size: 7.8, color: const Color(0xFFBEF961)),
            DiskSegment(name: "App Caches", size: 4.3, color: const Color(0xFFCEFC71)),
          ],
        ),
      ],
    ),
    DiskSegment(
      name: "Applications",
      size: 63.4,
      color: const Color(0xFF4A90E2),
      children: [
        DiskSegment(
          name: "Creative Apps",
          size: 28.7,
          color: const Color(0xFF5BA0F2),
          children: [
            DiskSegment(name: "Design Suite", size: 15.2, color: const Color(0xFF6BB0FF)),
            DiskSegment(name: "Video Editing", size: 9.8, color: const Color(0xFF7BC0FF)),
            DiskSegment(name: "Audio Production", size: 3.7, color: const Color(0xFF8BD0FF)),
          ],
        ),
        DiskSegment(
          name: "Development",
          size: 22.5,
          color: const Color(0xFF6BB0FF),
          children: [
            DiskSegment(name: "IDEs", size: 12.3, color: const Color(0xFF7BC0FF)),
            DiskSegment(name: "SDKs", size: 7.4, color: const Color(0xFF8BD0FF)),
            DiskSegment(name: "Tools", size: 2.8, color: const Color(0xFF9BE0FF)),
          ],
        ),
        DiskSegment(
          name: "Productivity",
          size: 12.2,
          color: const Color(0xFF7BC0FF),
          children: [
            DiskSegment(name: "Office Suite", size: 8.1, color: const Color(0xFF8BD0FF)),
            DiskSegment(name: "Utilities", size: 4.1, color: const Color(0xFF9BE0FF)),
          ],
        ),
      ],
    ),
    DiskSegment(
      name: "Documents",
      size: 78.9,
      color: const Color(0xFF50E3C2),
      children: [
        DiskSegment(
          name: "Projects",
          size: 42.3,
          color: const Color(0xFF60F3D2),
          children: [
            DiskSegment(name: "Work", size: 28.7, color: const Color(0xFF70FFE2)),
            DiskSegment(name: "Personal", size: 13.6, color: const Color(0xFF80FFF2)),
          ],
        ),
        DiskSegment(
          name: "Media",
          size: 25.4,
          color: const Color(0xFF70FFE2),
          children: [
            DiskSegment(name: "Photos", size: 16.2, color: const Color(0xFF80FFF2)),
            DiskSegment(name: "Videos", size: 9.2, color: const Color(0xFF90FFFF)),
          ],
        ),
        DiskSegment(
          name: "Archives",
          size: 11.2,
          color: const Color(0xFF80FFF2),
          children: [
            DiskSegment(name: "Backups", size: 7.8, color: const Color(0xFF90FFFF)),
            DiskSegment(name: "Old Files", size: 3.4, color: const Color(0xFFA0FFFF)),
          ],
        ),
      ],
    ),
    DiskSegment(
      name: "Other",
      size: 18.6,
      color: const Color(0xFFBD10E0),
      children: [
        DiskSegment(
          name: "Downloads",
          size: 9.8,
          color: const Color(0xFFCD20F0),
          children: [
            DiskSegment(name: "Software", size: 6.4, color: const Color(0xFFDD30FF)),
            DiskSegment(name: "Media Files", size: 3.4, color: const Color(0xFFED40FF)),
          ],
        ),
        DiskSegment(
          name: "Temporary",
          size: 8.8,
          color: const Color(0xFFDD30FF),
          children: [
            DiskSegment(name: "Cache", size: 5.7, color: const Color(0xFFED40FF)),
            DiskSegment(name: "Temp Files", size: 3.1, color: const Color(0xFFFD50FF)),
          ],
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get totalUsedSize => segments.fold(0, (sum, segment) => sum + segment.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          // Background glow
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          
          // Layer 4: Outermost ring (level 3 - detailed items)
          _buildRing(
            segments: _getSegmentsAtLevel(3),
            innerRadius: 0.75,
            outerRadius: 0.95,
            ringIndex: 3,
          ),
          
          // Layer 3: Third ring (level 2 - subcategories)
          _buildRing(
            segments: _getSegmentsAtLevel(2),
            innerRadius: 0.55,
            outerRadius: 0.75,
            ringIndex: 2,
          ),
          
          // Layer 2: Second ring (level 1 - main categories)
          _buildRing(
            segments: _getSegmentsAtLevel(1),
            innerRadius: 0.35,
            outerRadius: 0.55,
            ringIndex: 1,
          ),
          
          // Layer 1: Center space with info
          Positioned.fill(
            child: Center(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF2A2A2A),
                      const Color(0xFF1A1A1A),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 15,
                
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${totalUsedSize.toStringAsFixed(1)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'GB used',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'of ${_totalDiskSize.toInt()} GB',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Hover info overlay
          if (_hoveredSegment != null)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _hoveredSegment!.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${_hoveredSegment!.size.toStringAsFixed(1)} GB',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<DiskSegment> _getSegmentsAtLevel(int level) {
    List<DiskSegment> result = [];
    
    void traverse(DiskSegment segment, int currentLevel) {
      if (currentLevel == level) {
        result.add(segment);
      } else if (currentLevel < level && segment.children.isNotEmpty) {
        for (var child in segment.children) {
          traverse(child, currentLevel + 1);
        }
      }
    }
    
    for (var segment in segments) {
      traverse(segment, 1);
    }
    
    // Add strategic transparent spaces to create fragmentation
    return _addTransparentSpaces(result, level);
  }

  List<DiskSegment> _addTransparentSpaces(List<DiskSegment> segments, int level) {
    List<DiskSegment> result = [];
    final random = Random(level * 42); // Consistent seed for each level
    
    for (int i = 0; i < segments.length; i++) {
      result.add(segments[i]);
      
      // Add transparent spaces strategically
      double spaceFrequency = level == 1 ? 0.3 : (level == 2 ? 0.5 : 0.7);
      int maxSpaces = level == 1 ? 2 : (level == 2 ? 4 : 6);
      
      if (random.nextDouble() < spaceFrequency) {
        int numSpaces = 1 + random.nextInt(maxSpaces);
        for (int j = 0; j < numSpaces; j++) {
          result.add(DiskSegment(
            name: "Free Space",
            size: 0.1 + random.nextDouble() * (level * 0.3),
            color: Colors.transparent,
          ));
        }
      }
      
      // Add larger gaps between major categories (level 1)
      if (level == 1 && i < segments.length - 1) {
        if (random.nextDouble() < 0.6) {
          result.add(DiskSegment(
            name: "Major Gap",
            size: 0.5 + random.nextDouble() * 1.5,
            color: Colors.transparent,
          ));
        }
      }
    }
    
    return result;
  }

  Widget _buildRing({
    required List<DiskSegment> segments,
    required double innerRadius,
    required double outerRadius,
    required int ringIndex,
  }) {
    final total = segments.isNotEmpty 
      ? segments.fold<double>(0, (sum, segment) => sum + segment.size)
      : 1.0;

    return MouseRegion(
      onHover: (event) {
        // Handle hover detection here if needed
      },
      child: CustomPaint(
        painter: _RingPainter(
          segments: segments,
          total: total,
          innerRadius: innerRadius,
          outerRadius: outerRadius,
          ringIndex: ringIndex,
          animation: _controller,
          onSegmentHover: (segment) {
            setState(() {
              _hoveredSegment = segment;
            });
          },
        ),
        size: const Size(500, 500),
      ),
    );
  }
}

class DiskSegment {
  final String name;
  final double size;
  final Color color;
  final List<DiskSegment> children;

  DiskSegment({
    required this.name,
    required this.size,
    required this.color,
    this.children = const [],
  });
}

class _RingPainter extends CustomPainter {
  final List<DiskSegment> segments;
  final double total;
  final double innerRadius;
  final double outerRadius;
  final int ringIndex;
  final Animation<double> animation;
  final Function(DiskSegment)? onSegmentHover;

  _RingPainter({
    required this.segments,
    required this.total,
    required this.innerRadius,
    required this.outerRadius,
    required this.ringIndex,
    required this.animation,
    this.onSegmentHover,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    if (segments.isEmpty) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * 0.9;
    double currentStartAngle = -pi / 2;

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final sweepAngle = 2 * pi * (segment.size / total) * animation.value;
      
      _drawDataSegment(canvas, center, radius, currentStartAngle, sweepAngle, segment, ringIndex);
      
      // Only draw separation lines for non-transparent segments and between different segment types
      if (segment.color != Colors.transparent && i > 0) {
        final prevSegment = segments[i - 1];
        if (prevSegment.color != Colors.transparent) {
          _drawSeparationLine(canvas, center, radius, currentStartAngle, innerRadius, outerRadius);
        }
      }

      currentStartAngle += sweepAngle;
    }

    // Draw ring outlines
    _drawRingOutlines(canvas, center, radius);
  }

  void _drawDataSegment(Canvas canvas, Offset center, double radius, 
                       double startAngle, double sweepAngle, DiskSegment segment, int ringIndex) {
    
    // Handle transparent segments
    if (segment.color == Colors.transparent) {
      _drawTransparentSegment(canvas, center, radius, startAngle, sweepAngle, ringIndex);
      return;
    }
    
    // Create sophisticated radial gradient
    final gradient = RadialGradient(
      center: Alignment.center,
      colors: [
        segment.color.withOpacity(0.9),
        segment.color,
        Color.lerp(segment.color, Colors.black, 0.2)!,
      ],
      stops: const [0.0, 0.6, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromCircle(
        center: center,
        radius: radius * outerRadius,
      ))
      ..style = PaintingStyle.fill;

    // Create path for the segment
    final path = Path()
      ..moveTo(
        center.dx + cos(startAngle) * radius * innerRadius,
        center.dy + sin(startAngle) * radius * innerRadius,
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius * outerRadius),
        startAngle,
        sweepAngle,
        false,
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius * innerRadius),
        startAngle + sweepAngle,
        -sweepAngle,
        false,
      )
      ..close();

    canvas.drawPath(path, paint);

    // Add realistic lighting effects
    _addLightingEffects(canvas, center, radius, startAngle, sweepAngle, segment);

    // Add texture lines for fragmentation effect
    _addTextureLines(canvas, center, radius, startAngle, sweepAngle);
  }

  void _drawTransparentSegment(Canvas canvas, Offset center, double radius, 
                              double startAngle, double sweepAngle, int ringIndex) {
    // Draw subtle background pattern for transparent segments
    final backgroundPaint = Paint()
      ..color = const Color(0xFF1A1A1A).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(
        center.dx + cos(startAngle) * radius * innerRadius,
        center.dy + sin(startAngle) * radius * innerRadius,
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius * outerRadius),
        startAngle,
        sweepAngle,
        false,
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius * innerRadius),
        startAngle + sweepAngle,
        -sweepAngle,
        false,
      )
      ..close();

    canvas.drawPath(path, backgroundPaint);

    // Add subtle grid pattern to empty spaces
    final patternPaint = Paint()
      ..color = Colors.white.withOpacity(0.02)
      ..strokeWidth = 0.2
      ..style = PaintingStyle.stroke;

    // Draw concentric arcs for pattern
    for (int i = 1; i < 4; i++) {
      final patternRadius = innerRadius + ((outerRadius - innerRadius) * i / 4);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius * patternRadius),
        startAngle,
        sweepAngle,
        false,
        patternPaint,
      );
    }

    // Draw radial lines
    final lineCount = max(1, (sweepAngle / (pi / 20)).floor());
    for (int i = 0; i <= lineCount; i++) {
      final lineAngle = startAngle + (sweepAngle * i / lineCount);
      canvas.drawLine(
        Offset(
          center.dx + cos(lineAngle) * radius * innerRadius,
          center.dy + sin(lineAngle) * radius * innerRadius,
        ),
        Offset(
          center.dx + cos(lineAngle) * radius * outerRadius,
          center.dy + sin(lineAngle) * radius * outerRadius,
        ),
        patternPaint,
      );
    }
  }

  void _addLightingEffects(Canvas canvas, Offset center, double radius, 
                          double startAngle, double sweepAngle, DiskSegment segment) {
    // Top highlight
    final highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.5);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * outerRadius - 1),
      startAngle + 0.02,
      sweepAngle - 0.04,
      false,
      highlightPaint,
    );

    // Inner shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.0);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * innerRadius + 1),
      startAngle + 0.02,
      sweepAngle - 0.04,
      false,
      shadowPaint,
    );

    // Glossy reflection effect
    final glossPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final glossPath = Path()
      ..moveTo(
        center.dx + cos(startAngle) * radius * (innerRadius + 0.05),
        center.dy + sin(startAngle) * radius * (innerRadius + 0.05),
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius * (outerRadius - 0.05)),
        startAngle,
        sweepAngle * 0.3,
        false,
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius * (innerRadius + 0.05)),
        startAngle + sweepAngle * 0.3,
        -sweepAngle * 0.3,
        false,
      )
      ..close();

    canvas.drawPath(glossPath, glossPaint);
  }

  void _addTextureLines(Canvas canvas, Offset center, double radius, 
                       double startAngle, double sweepAngle) {
    // Add radial lines to simulate file fragmentation
    final Random random = Random(startAngle.hashCode);
    final lineCount = max(2, (sweepAngle / (pi / 24)).floor());
    
    for (int i = 1; i < lineCount; i++) {
      if (random.nextDouble() > 0.7) continue; // Skip some lines randomly
      
      final lineAngle = startAngle + (sweepAngle * i / lineCount);
      final opacity = 0.02 + random.nextDouble() * 0.06;
      
      final linePaint = Paint()
        ..color = Colors.white.withOpacity(opacity)
        ..strokeWidth = 0.3 + random.nextDouble() * 0.4
        ..style = PaintingStyle.stroke;

      final startRadius = innerRadius + random.nextDouble() * 0.1;
      final endRadius = outerRadius - random.nextDouble() * 0.1;

      canvas.drawLine(
        Offset(
          center.dx + cos(lineAngle) * radius * startRadius,
          center.dy + sin(lineAngle) * radius * startRadius,
        ),
        Offset(
          center.dx + cos(lineAngle) * radius * endRadius,
          center.dy + sin(lineAngle) * radius * endRadius,
        ),
        linePaint,
      );
    }
  }

  void _drawSeparationLine(Canvas canvas, Offset center, double radius, 
                          double angle, double innerRadius, double outerRadius) {
    // Only draw separation lines between actual data segments, not transparent ones
    final linePaint = Paint()
      ..color = Colors.black.withOpacity(0.6)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.2);

    canvas.drawLine(
      Offset(
        center.dx + cos(angle) * radius * innerRadius,
        center.dy + sin(angle) * radius * innerRadius,
      ),
      Offset(
        center.dx + cos(angle) * radius * outerRadius,
        center.dy + sin(angle) * radius * outerRadius,
      ),
      linePaint,
    );
  }

  void _drawRingOutlines(Canvas canvas, Offset center, double radius) {
    // Outer ring with glow
    final outerGlowPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);

    canvas.drawCircle(center, radius * outerRadius, outerGlowPaint);

    // Sharp outer outline
    final outerOutlinePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    canvas.drawCircle(center, radius * outerRadius, outerOutlinePaint);

    // Inner ring outline
    final innerOutlinePaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.6;

    canvas.drawCircle(center, radius * innerRadius, innerOutlinePaint);
  }

  void _drawEmptySpaceSegments(Canvas canvas, Offset center, double radius, double currentAngle) {
    final remainingAngle = 2 * pi - currentAngle - (-pi / 2);
    if (remainingAngle > 0.1) {
      // Draw empty space with subtle pattern
      final emptyPaint = Paint()
        ..color = const Color(0xFF2A2A2A)
        ..style = PaintingStyle.fill;

      final emptyPath = Path()
        ..moveTo(
          center.dx + cos(currentAngle) * radius * innerRadius,
          center.dy + sin(currentAngle) * radius * innerRadius,
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius * outerRadius),
          currentAngle,
          remainingAngle,
          false,
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius * innerRadius),
          currentAngle + remainingAngle,
          -remainingAngle,
          false,
        )
        ..close();

      canvas.drawPath(emptyPath, emptyPaint);

      // Add subtle pattern to empty space
      final patternPaint = Paint()
        ..color = Colors.white.withOpacity(0.02)
        ..strokeWidth = 0.3
        ..style = PaintingStyle.stroke;

      for (int i = 0; i < 10; i++) {
        final patternAngle = currentAngle + (remainingAngle * i / 10);
        canvas.drawLine(
          Offset(
            center.dx + cos(patternAngle) * radius * innerRadius,
            center.dy + sin(patternAngle) * radius * innerRadius,
          ),
          Offset(
            center.dx + cos(patternAngle) * radius * outerRadius,
            center.dy + sin(patternAngle) * radius * outerRadius,
          ),
          patternPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.segments != segments ||
           oldDelegate.animation != animation;
  }
}