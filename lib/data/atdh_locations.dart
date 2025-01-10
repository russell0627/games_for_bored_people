enum Location {
  storyPage1(north: storyPage2),
  storyPage2(north: mainGraveyard),
  mainGraveyard(east: jungleEntrance),
  storyPage3(north: jungleEntrance),
  //Jungle Entrance north is just a placeholder for when the move function needs it to go to the Jungle Exit
  jungleEntrance(north: storyPage4),
  storyPage4(north: shop),
  shop(north: Location.field),
  field(north: storyPage5),
  storyPage5(north: dungeon),
  dungeon(north: Location.treasureRoom),
  treasureRoom(north: Location.storyPage6),
  storyPage6(north: storyPage7),
  storyPage7(north: storyPage8),
  storyPage8(north: dexterHill),
  cabin(),
  dexterHill(north: Location.cabin);

  final Location? north;
  final Location? south;
  final Location? east;
  final Location? west;

  const Location({this.north, this.east, this.south, this.west});
}

enum Direction {
  north,
  south,
  east,
  west;
}

