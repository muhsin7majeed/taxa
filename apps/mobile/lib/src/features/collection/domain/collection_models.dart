class ChecklistProgress {
  const ChecklistProgress({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.found,
    required this.total,
    required this.sortOrder,
  });

  final String id;
  final String title;
  final String subtitle;
  final int found;
  final int total;
  final int sortOrder;

  double get progress => total == 0 ? 0 : found / total;
}

class CollectionOverview {
  const CollectionOverview({
    required this.foundSpecies,
    required this.totalSpecies,
    required this.localDiscoveryCount,
    required this.packs,
  });

  final int foundSpecies;
  final int totalSpecies;
  final int localDiscoveryCount;
  final List<ChecklistProgress> packs;

  int get lockedSpecies => totalSpecies - foundSpecies;
}
