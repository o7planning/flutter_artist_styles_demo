import 'package:flutter/material.dart';
import 'package:flutter_artist_styles_demo/showcase_screen.dart';

void main() {
  runApp(const FaColorsDemoApp());
}

/// A simple configuration notifier to handle live color scheme changes
/// during the demo showcase preview session.
class DemoThemeController extends ChangeNotifier {
  Brightness _brightness = Brightness.light;

  // Starting with a fallback default scheme from Flutter Material
  ColorScheme _currentScheme = const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.amber,
    surface: Colors.white,
    error: Colors.red,
  );

  Brightness get brightness => _brightness;

  ColorScheme get currentScheme => _currentScheme;

  /// Updates the application runtime scheme and triggers a root-level rebuild
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
