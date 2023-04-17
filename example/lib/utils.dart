// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:nepali_utils/nepali_utils.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<NepaliDateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => NepaliDateTime(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(NepaliDateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [NepaliDateTime ] objects from [first] to [last], inclusive.
List<NepaliDateTime> daysInRange(NepaliDateTime first, NepaliDateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => NepaliDateTime(first.year, first.month, first.day + index),
  );
}

final kToday = NepaliDateTime.now();
final kFirstDay = NepaliDateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = NepaliDateTime(kToday.year, kToday.month + 3, kToday.day);
