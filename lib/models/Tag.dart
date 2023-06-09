import 'package:floor/floor.dart';

@entity
class Tag{
  @primaryKey
  final String Id;

  final String Name;
  final String Color;

  const Tag(this.Id, this.Name , this.Color);
}