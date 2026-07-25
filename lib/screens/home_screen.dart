import 'package:flutter/material.dart';
import '../models/program.dart';
import '../screens/program_details_screen.dart';
import '../services/program_service.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProgramService _programService = ProgramService();
  List<Program> programs = [];
  bool isLoading = true;
  String? errorMessage;
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _loadPrograms();
  }

  Future<void> _loadPrograms() async {
    try {
      final loadedPrograms = await _programService.loadPrograms();
      setState(() {
        programs = loadedPrograms;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Unable to load programs.";
        isLoading = false;
      });
    }
  }

  List<String> get categories {
    final methods = programs.map((p) => p.deliveryMethod).where((m) => m.isNotEmpty).toSet().toList();
    return ["All", ...methods];
  }

  List<Program> get filteredPrograms {
    if (selectedCategory == "All") return programs;
    return programs.where((p) =>
      p.deliveryMethod.toLowerCase().replaceAll('-', ' ') ==
      selectedCategory.toLowerCase().replaceAll('-', ' ')
    ).toList();
  }

  int get remoteCount => programs.where((p) {
    final method = p.deliveryMethod.toLowerCase();
    return method == "remote" || method == "online";
  }).length;

  void _openList() {
    Navigator.pushNamed(context, '/programs');
  }

  void _openDetails(Program p) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => ProgramDetailsScreen(program: p)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage != null
                ? Center(child: Text(errorMessage!))
                : ListView(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                    children: [
                      _heroBanner(),
                      const SizedBox(height: 16),
                      _searchBar(),
                      const SizedBox(height: 20),
                      _statsRow(),
                      const SizedBox(height: 20),
                      _categoryChips(),
                      const SizedBox(height: 20),
                      _sectionHeader("Featured Programs"),
                      const SizedBox(height: 10),
                      _featuredList(),
                      const SizedBox(height: 20),
                      _sectionHeader("Recommended For You"),
                      const SizedBox(height: 10),
                      _recommendedList(),
                      const SizedBox(height: 20),
                      const Text("Quick Actions",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      _quickActions(),
                    ],
                  ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (i) {
          if (i == 1) _openList();
          if (i == 2) Navigator.pushNamed(context, '/learnerProfile');
        },
      ),
    );
  }

  Widget _heroBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red.shade400, Colors.red.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.red.shade200, blurRadius: 12, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Welcome Back! 👋", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text("Discover internships, workshops and competitions.", style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _openList,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red.shade700,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("Explore Programs"),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return TextField(
      readOnly: true,
      onTap: _openList,
      decoration: InputDecoration(
        hintText: "Search programs...",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _statsRow() {
    final values = ["${programs.length}", "$remoteCount", "${programs.length - remoteCount}"];
    final labels = ["Programs", "Remote", "Other"];
    return Row(
      children: List.generate(values.length, (i) => Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 6, offset: const Offset(0, 2))],
          ),
          child: Column(
            children: [
              Text(values[i], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red.shade700)),
              const SizedBox(height: 2),
              Text(labels[i], style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      )),
    );
  }

  Widget _categoryChips() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final cat = categories[i];
          final selected = cat == selectedCategory;
          return FilterChip(
            label: Text(cat),
            selected: selected,
            onSelected: (_) => setState(() => selectedCategory = cat),
            selectedColor: Colors.red.shade100,
            checkmarkColor: Colors.red.shade700,
            labelStyle: TextStyle(color: selected ? Colors.red.shade700 : Colors.black87, fontWeight: selected ? FontWeight.bold : FontWeight.normal),
            backgroundColor: Colors.white,
            side: BorderSide(color: selected ? Colors.red.shade200 : Colors.grey.shade300),
          );
        },
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: _openList, child: const Text("See All")),
      ],
    );
  }

  Widget _programImage(String path, {required double w, required double h, BorderRadius? radius}) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(14),
      child: Image.asset(
        path,
        width: w,
        height: h,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => Container(
          width: w,
          height: h,
          color: Colors.grey.shade300,
          child: const Icon(Icons.image_not_supported, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _featuredList() {
    final list = filteredPrograms;
    if (list.isEmpty) {
      return const Center(child: Text("No programs found"));
    }
    return SizedBox(
      height: 210,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (BuildContext context, int i) {
          final p = list[i];
          return InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => _openDetails(p),
            child: Container(
              width: 190,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8, offset: const Offset(0, 3))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      _programImage(p.image, w: 190, h: 110, radius: const BorderRadius.vertical(top: Radius.circular(14))),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                          child: Text(p.deliveryMethod.isNotEmpty ? p.deliveryMethod : p.location, style: const TextStyle(color: Colors.white, fontSize: 11)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                            const SizedBox(width: 4),
                            Expanded(child: Text(p.startDate, style: const TextStyle(fontSize: 11, color: Colors.grey), overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _recommendedList() {
    final list = filteredPrograms;
    if (list.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: list.map((p) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => _openDetails(p),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6, offset: const Offset(0, 2))],
            ),
            child: Row(
              children: [
                _programImage(p.image, w: 64, h: 64),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(p.description, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      )).toList(),
    );
  }

  Widget _quickActions() {
    final icons = [Icons.menu_book, Icons.info_outline, Icons.person, Icons.notifications_none];
    final labels = ["Programs", "About Us", "Profile", "Alerts"];
    final taps = [
      _openList,
      () => Navigator.pushNamed(context, '/aboutUs'),
      () => Navigator.pushNamed(context, '/learnerProfile'),
      () => Navigator.pushNamed(context, '/alerts'),
    ];    return GridView.builder(
      itemCount: icons.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (_, i) => InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: taps[i],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6, offset: const Offset(0, 2))],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icons[i], color: Colors.red.shade700),
              const SizedBox(height: 6),
              Text(labels[i], style: const TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}