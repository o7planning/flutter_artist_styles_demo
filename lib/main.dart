import 'package:flutter/material.dart';
import 'package:flutter_artist_styles_demo/showcase_screen.dart';

void main() {
  runApp(const FaColorsDemoApp());
}

/// A simple configuration notifier to handle live color scheme changes
/// during the demo showcase preview session.
class DemoThemeController extends ChangeNotifier {
  Brightness _brightness = Brightness.light;
  ColorScheme _currentScheme = const ColorScheme.light(
    primary: Color(0xFF355CA8),
    secondary: Color(0xFF06B6D4),
    error: Color(0xFFDC2626),
    background: Color(0xFFF8FAFC),
    surface: Color(0xFFF1F5F9),
    surfaceContainer: Color(0xFFE2E8F0),
    surfaceContainerHigh: Color(0xFFCBD5E1),
    surfaceContainerHighest: Color(0xFF94A3B8),
    onSurface: Color(0xFF0F172A),
    onSurfaceVariant: Color(0xFF475569),
  );

  Brightness get brightness => _brightness;
  ColorScheme get currentScheme => _currentScheme;

  void updateTheme(ColorScheme newScheme, Brightness newBrightness) {
    _currentScheme = newScheme;
    _brightness = newBrightness;
    notifyListeners();
  }
}


/// The global shared controller instance for simplicity in this small demo app
final demoThemeController = DemoThemeController();

class FaColorsDemoApp extends StatefulWidget {
  const FaColorsDemoApp({super.key});

  @override
  State<FaColorsDemoApp> createState() => _FaColorsDemoAppState();
}

class _FaColorsDemoAppState extends State<FaColorsDemoApp> {
  @override
  void initState() {
    super.initState();
    // Listen to runtime color modifications made inside the Inspector panel
    demoThemeController.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    demoThemeController.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaColors Adaptive System Demo',
      debugShowCheckedModeBanner: false,

      // Injecting the active runtime configurations managed by the inspector
      theme: ThemeData(
        useMaterial3: true,
        brightness: demoThemeController.brightness,
        colorScheme: demoThemeController.currentScheme,
      ),

      // Points directly to our main layout playground
      home: const ShowcaseScreen(),
    );
  }
}
