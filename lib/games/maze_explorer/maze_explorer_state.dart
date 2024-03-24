class MazeExplorerState {
  //Maps are a 5x5 grid.
  static const Map<String, List<List<MapTile>>> mapsMap = {
    "1": [
      [
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 1, rowIndex: 1)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 1, rowIndex: 2)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 1, rowIndex: 3)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 1, rowIndex: 4)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 1, rowIndex: 5)),
      ],
      [
        MapTile(tileType: TileType.open, mapIndex: MapIndex(rowNumber: 2, rowIndex: 1)),
        MapTile(tileType: TileType.open, mapIndex: MapIndex(rowNumber: 2, rowIndex: 2)),
        MapTile(tileType: TileType.open, mapIndex: MapIndex(rowNumber: 2, rowIndex: 3)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 2, rowIndex: 4)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 2, rowIndex: 5)),
      ],
      [
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 3, rowIndex: 1)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 3, rowIndex: 2)),
        MapTile(tileType: TileType.open, mapIndex: MapIndex(rowNumber: 3, rowIndex: 3)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 3, rowIndex: 4)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 3, rowIndex: 5)),
      ],
      [
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 4, rowIndex: 1)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 4, rowIndex: 2)),
        MapTile(tileType: TileType.open, mapIndex: MapIndex(rowNumber: 4, rowIndex: 3)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 4, rowIndex: 4)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 4, rowIndex: 5)),
      ],
      [
        MapTile(tileType: TileType.treasure, mapIndex: MapIndex(rowNumber: 5, rowIndex: 1)),
        MapTile(tileType: TileType.open, mapIndex: MapIndex(rowNumber: 5, rowIndex: 2)),
        MapTile(tileType: TileType.open, mapIndex: MapIndex(rowNumber: 5, rowIndex: 3)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 5, rowIndex: 4)),
        MapTile(tileType: TileType.wall, mapIndex: MapIndex(rowNumber: 5, rowIndex: 5)),
      ],
    ]
  };
  final MapIndex playerLocation;

  final int mapNumber;
  final List<List<MapTile>> currentMap;

  const MazeExplorerState({
    required this.playerLocation,
    required this.currentMap,
    this.mapNumber = 1,
  });
}

class MapTile {
  final TileType tileType;

  final MapIndex mapIndex;

  const MapTile({
    required this.tileType,
    required this.mapIndex,
  });
}

class MapIndex {
  final int rowNumber;
  final int rowIndex;

  const MapIndex({
    required this.rowNumber,
    required this.rowIndex,
  });
}

enum TileType {
  wall,
  open,
  treasure;
}
