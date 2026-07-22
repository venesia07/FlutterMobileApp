import 'package:flutter/material.dart';
import '../models/program.dart'; // Using the existing model
import '../services/json_service.dart';

class ProgramManagementScreen extends StatefulWidget {
  const ProgramManagementScreen({super.key});

  @override
  State<ProgramManagementScreen> createState() =>
      _ProgramManagementScreenState();
}

class _ProgramManagementScreenState extends State<ProgramManagementScreen> {
  List<Program> _allPrograms = [];
  List<Program> _filteredPrograms = [];
  bool _isLoading = true;
  String _errorMessage = '';
  String _selectedFilter = 'All';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadPrograms();
  }

  // LOAD DATA FROM JSON
  Future<void> _loadPrograms() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final programs = await JsonService.loadPrograms();
      print('✅ Loaded ${programs.length} programs'); // Debug
      setState(() {
        _allPrograms = programs;
        _filteredPrograms = programs;
        _isLoading = false;
      });
    } catch (e) {
      print('❌ Error: $e'); // Debug
      setState(() {
        _errorMessage = 'Failed to load programs. Please try again.';
        _isLoading = false;
      });
    }
  }

  // FILTER AND SEARCH FUNCTIONS
  void _filterPrograms(String filter) {
    setState(() {
      _selectedFilter = filter;
      _applyFilters();
    });
  }

  void _searchPrograms(String query) {
    setState(() {
      _searchQuery = query;
      _applyFilters();
    });
  }

  void _applyFilters() {
    List<Program> result = _allPrograms;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      result = result.where((program) {
        return program.title.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            ) ||
            program.location.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            ) ||
            program.description.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
      }).toList();
    }

    // Apply category filter (using location as filter)
    if (_selectedFilter != 'All') {
      result = result.where((program) {
        return program.location == _selectedFilter;
      }).toList();
    }

    setState(() {
      _filteredPrograms = result;
    });
  }

  // Helper to determine status based on dates
  String _getProgramStatus(Program program) {
    final now = DateTime.now();
    final start = DateTime.tryParse(program.startDate);
    final end = DateTime.tryParse(program.endDate);

    if (start == null || end == null) return 'Upcoming';

    if (now.isBefore(start)) {
      return 'Upcoming';
    } else if (now.isAfter(end)) {
      return 'Completed';
    } else {
      return 'Ongoing';
    }
  }

  // Helper to get category/skills as a string
  String _getCategoryString(Program program) {
    // Check if skills has values (which might come from category)
    if (program.skills.isNotEmpty) {
      return program.skills.join(', ');
    }
    return 'No category listed';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Manage Programs',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadPrograms),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(),
          const SizedBox(height: 12),
          // Filter Chips
          _buildFilterChips(),
          const SizedBox(height: 12),
          // Content (Loading, Error, or List)
          Expanded(child: _buildContent()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // SEARCH BAR
  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[400], size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: _searchPrograms,
              decoration: InputDecoration(
                hintText: 'Search programs...',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.grey[600], size: 22),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // FILTER CHIPS
  Widget _buildFilterChips() {
    final filters = ['All', 'Online', 'In-Person', 'Hybrid'];
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = _selectedFilter == filter;
          return FilterChip(
            label: Text(
              filter,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
            ),
            selected: isSelected,
            onSelected: (_) => _filterPrograms(filter),
            backgroundColor: Colors.grey[100],
            selectedColor: Colors.green[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected ? Colors.green[700]! : Colors.transparent,
                width: 0,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          );
        },
      ),
    );
  }

  // DYNAMIC CONTENT (Loading, Error, Empty, or List)
  Widget _buildContent() {
    if (_isLoading) {
      return _buildLoadingIndicator();
    } else if (_errorMessage.isNotEmpty) {
      return _buildErrorWidget();
    } else if (_filteredPrograms.isEmpty) {
      return _buildEmptyState();
    } else {
      return _buildProgramList();
    }
  }

  // LOADING INDICATOR
  Widget _buildLoadingIndicator() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              color: Colors.green,
              strokeWidth: 3,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Loading programs...',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ERROR HANDLING
  Widget _buildErrorWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 60, color: Colors.red[300]),
            const SizedBox(height: 16),
            Text(
              _errorMessage,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadPrograms,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // EMPTY STATE
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 60, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No programs found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filter',
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  // PROGRAM LIST
  Widget _buildProgramList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _filteredPrograms.length,
      itemBuilder: (context, index) {
        final program = _filteredPrograms[index];
        return _buildProgramCard(program);
      },
    );
  }

  // PROGRAM CARD (Dynamic Data using existing Program model)
  Widget _buildProgramCard(Program program) {
    final status = _getProgramStatus(program);
    final statusColors = {
      'Upcoming': Colors.blue,
      'Ongoing': Colors.green,
      'Completed': Colors.orange,
    };
    final statusColor = statusColors[status] ?? Colors.grey;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  program.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Description (truncated)
          Text(
            program.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 6),
          // Date Range
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14, color: Colors.grey[500]),
              const SizedBox(width: 5),
              Text(
                '${program.startDate} - ${program.endDate}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Location
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Colors.grey[500],
              ),
              const SizedBox(width: 5),
              Text(
                program.location,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Category/Skills
          Row(
            children: [
              Icon(Icons.category_outlined, size: 14, color: Colors.grey[500]),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  _getCategoryString(program),
                  style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Edit and Delete Buttons
          Row(
            children: [
              IconButton(
                onPressed: () => _showEditDialog(context, program),
                icon: const Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: () => _showDeleteDialog(context, program),
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // BOTTOM NAVIGATION
  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {},
      ),
    );
  }

  // DIALOGS
  void _showEditDialog(BuildContext context, Program program) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit ${program.title}'),
        content: const Text('Edit functionality coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Program program) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Program'),
        content: Text('Are you sure you want to delete "${program.title}"?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${program.title} deleted successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
