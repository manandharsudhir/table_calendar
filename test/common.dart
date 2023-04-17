// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/foundation.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:table_calendar/src/shared/utils.dart';

ValueKey<String> dateToKey(NepaliDateTime date, {String prefix = ''}) {
  return ValueKey('$prefix${date.year}-${date.month}-${date.day}');
}

const calendarFormatMap = const {
  CalendarFormat.month: 'Month',
  CalendarFormat.twoWeeks: 'Two weeks',
  CalendarFormat.week: 'week',
};
