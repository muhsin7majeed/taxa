const fakeCatalogVersion = 'fake-local-catalog-v1';

class SeedTaxonomyEntry {
  const SeedTaxonomyEntry({
    required this.id,
    required this.scientificName,
    required this.commonName,
    required this.category,
    required this.rarity,
    required this.habitat,
    required this.diet,
    required this.sizeDescription,
    required this.sortOrder,
  });

  final String id;
  final String scientificName;
  final String commonName;
  final String category;
  final String rarity;
  final String habitat;
  final String diet;
  final String sizeDescription;
  final int sortOrder;
}

class SeedChecklistGroup {
  const SeedChecklistGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.sortOrder,
  });

  final String id;
  final String name;
  final String description;
  final int sortOrder;
}

class SeedChecklistMembership {
  const SeedChecklistMembership({
    required this.checklistGroupId,
    required this.taxonomyEntryId,
  });

  final String checklistGroupId;
  final String taxonomyEntryId;
}

abstract final class SeedIds {
  static const backyardBirdsAndBugs = 'c36c3841-e61f-4bbb-aa61-f2e4ebea7595';
  static const freshwaterSightings = '7410efef-8a6f-4264-9d5d-e3ccf471574e';

  static const americanRobin = 'bd9ac930-1581-49df-a7d8-462ab9f055db';
  static const houseSparrow = 'ea34afce-220e-4863-9f90-cbb2ae0b9d63';
  static const monarchButterfly = 'caa69833-82ec-4d21-80fa-90ee170bedc6';
  static const convergentLadyBeetle = 'bb04b627-0d34-45f4-aec0-f2525ed94bb8';
  static const easternGraySquirrel = 'fbb2b0bd-6a9b-4bde-9f38-1c8fd83cc940';
  static const bluegill = '54f480df-3782-40c7-9575-e476e875fe0f';
  static const greenFrog = 'd2a24ad4-7428-4511-a40e-35dc56dec34c';
  static const commonCarp = '8e4044a4-3c76-4545-b933-99cb7f7408ca';
}

const seedChecklistGroups = [
  SeedChecklistGroup(
    id: SeedIds.backyardBirdsAndBugs,
    name: 'Backyard Birds and Bugs',
    description: 'Common species for the first local field pack.',
    sortOrder: 0,
  ),
  SeedChecklistGroup(
    id: SeedIds.freshwaterSightings,
    name: 'Freshwater Sightings',
    description: 'Fish and amphibian pack placeholder.',
    sortOrder: 1,
  ),
];

const seedTaxonomyEntries = [
  SeedTaxonomyEntry(
    id: SeedIds.americanRobin,
    scientificName: 'Turdus migratorius',
    commonName: 'American Robin',
    category: 'bird',
    rarity: 'common',
    habitat: 'Lawns, parks, wood edges, and gardens',
    diet: 'Earthworms, insects, and berries',
    sizeDescription: 'About 23-28 cm long',
    sortOrder: 0,
  ),
  SeedTaxonomyEntry(
    id: SeedIds.houseSparrow,
    scientificName: 'Passer domesticus',
    commonName: 'House Sparrow',
    category: 'bird',
    rarity: 'common',
    habitat: 'Neighborhoods, farms, and city edges',
    diet: 'Seeds, grains, and small insects',
    sizeDescription: 'About 14-16 cm long',
    sortOrder: 1,
  ),
  SeedTaxonomyEntry(
    id: SeedIds.monarchButterfly,
    scientificName: 'Danaus plexippus',
    commonName: 'Monarch Butterfly',
    category: 'insect',
    rarity: 'uncommon',
    habitat: 'Milkweed patches, meadows, and gardens',
    diet: 'Milkweed as larvae; nectar as adults',
    sizeDescription: 'Wingspan about 9-10 cm',
    sortOrder: 2,
  ),
  SeedTaxonomyEntry(
    id: SeedIds.convergentLadyBeetle,
    scientificName: 'Hippodamia convergens',
    commonName: 'Convergent Lady Beetle',
    category: 'insect',
    rarity: 'common',
    habitat: 'Gardens, fields, shrubs, and crops',
    diet: 'Aphids and other soft-bodied insects',
    sizeDescription: 'About 4-7 mm long',
    sortOrder: 3,
  ),
  SeedTaxonomyEntry(
    id: SeedIds.easternGraySquirrel,
    scientificName: 'Sciurus carolinensis',
    commonName: 'Eastern Gray Squirrel',
    category: 'mammal',
    rarity: 'common',
    habitat: 'Urban parks, forests, and yards',
    diet: 'Nuts, seeds, buds, fungi, and fruit',
    sizeDescription: 'Body about 23-30 cm long',
    sortOrder: 4,
  ),
  SeedTaxonomyEntry(
    id: SeedIds.bluegill,
    scientificName: 'Lepomis macrochirus',
    commonName: 'Bluegill',
    category: 'fish',
    rarity: 'common',
    habitat: 'Ponds, lakes, and slow streams',
    diet: 'Aquatic insects, small fish, and zooplankton',
    sizeDescription: 'Usually 10-25 cm long',
    sortOrder: 5,
  ),
  SeedTaxonomyEntry(
    id: SeedIds.greenFrog,
    scientificName: 'Lithobates clamitans',
    commonName: 'Green Frog',
    category: 'amphibian',
    rarity: 'common',
    habitat: 'Pond edges, marshes, and slow creeks',
    diet: 'Insects, spiders, snails, and small animals',
    sizeDescription: 'About 6-10 cm long',
    sortOrder: 6,
  ),
  SeedTaxonomyEntry(
    id: SeedIds.commonCarp,
    scientificName: 'Cyprinus carpio',
    commonName: 'Common Carp',
    category: 'fish',
    rarity: 'common',
    habitat: 'Warm lakes, ponds, and slow rivers',
    diet: 'Plants, insects, crustaceans, and detritus',
    sizeDescription: 'Often 30-60 cm long',
    sortOrder: 7,
  ),
];

const seedChecklistMemberships = [
  SeedChecklistMembership(
    checklistGroupId: SeedIds.backyardBirdsAndBugs,
    taxonomyEntryId: SeedIds.americanRobin,
  ),
  SeedChecklistMembership(
    checklistGroupId: SeedIds.backyardBirdsAndBugs,
    taxonomyEntryId: SeedIds.houseSparrow,
  ),
  SeedChecklistMembership(
    checklistGroupId: SeedIds.backyardBirdsAndBugs,
    taxonomyEntryId: SeedIds.monarchButterfly,
  ),
  SeedChecklistMembership(
    checklistGroupId: SeedIds.backyardBirdsAndBugs,
    taxonomyEntryId: SeedIds.convergentLadyBeetle,
  ),
  SeedChecklistMembership(
    checklistGroupId: SeedIds.backyardBirdsAndBugs,
    taxonomyEntryId: SeedIds.easternGraySquirrel,
  ),
  SeedChecklistMembership(
    checklistGroupId: SeedIds.freshwaterSightings,
    taxonomyEntryId: SeedIds.bluegill,
  ),
  SeedChecklistMembership(
    checklistGroupId: SeedIds.freshwaterSightings,
    taxonomyEntryId: SeedIds.greenFrog,
  ),
  SeedChecklistMembership(
    checklistGroupId: SeedIds.freshwaterSightings,
    taxonomyEntryId: SeedIds.commonCarp,
  ),
];
