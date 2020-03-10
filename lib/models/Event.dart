import 'package:AdminPanelDemo/models/EventCagory.dart';
import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String name;
  final String startDate;
  final String endDate;
  final String theme;
  final List<EventCategory> eventCategories;
  Event({
    @required this.id,
    @required this.name,
    @required this.startDate,
    @required this.endDate,
    this.theme,
    @required this.eventCategories
  });
}