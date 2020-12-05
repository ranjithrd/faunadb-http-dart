import 'result.dart';

enum CursorType { EMPTY }

class FQLPage {
  final Object before;
  final Object after;
  final List data;

  FQLPage(this.before, this.after, this.data);

  factory FQLPage.fromResource({Object before, Object after, Object data}) {
    var beforeCursor = before;
    if (before is List) {
      beforeCursor = List.from(before).map((element) {
        if (element is RefResult) {
          return element.asRef();
        }
        return element;
      }).toList(growable: false);
    }

    var afterCursor = after;
    if (after is List) {
      afterCursor = List.from(after).map((element) {
        if (element is RefResult) {
          return element.asRef();
        }
        return element;
      }).toList(growable: false);
    }

    return FQLPage(beforeCursor, afterCursor, data);
  }

  @override
  String toString() {
    return 'FQLPage(${{
      'before': before,
      'after': after,
      'size': data.length
    }.toString()})';
  }
}
