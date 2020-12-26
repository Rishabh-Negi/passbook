import '../model/account.dart';
import '../style/style.dart';
import '../size_config.dart';
import 'package:flutter/material.dart';

class DueTile extends StatelessWidget {
  final Account due;
  final Function checkBoxToggle;

  const DueTile({
    this.due,
    this.checkBoxToggle,
  })  : assert(due != null),
        assert(checkBoxToggle != null);

  @override
  Widget build(BuildContext context) {
    ///
    /// This Allows [DueTile] to be Tapped
    ///
    return GestureDetector(
      ///
      /// [onTap] function to call CRUD with Histoy of [Dues]
      ///
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Column(
          children: [
            Row(
              children: [
                ///
                /// Discription of the [Due]
                /// used [ktestStyle] from [text_style] file
                ///
                Container(
                  width: SizeConfig.width * 0.5,
                  child: Text(
                    due.name,
                    style: kTextStyle,
                  ),
                ),

                ///
                /// Amount left in [Due]
                /// used [ktestStyle] from [text_style] file
                ///
                Container(
                  width: SizeConfig.width * 0.25,
                  child: Text(
                    '${due.amount.abs()}',
                    style: kTextStyle.copyWith(
                      decoration:
                          due.isCleared ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),

                ///
                /// displays [CheckBox] at the end of the [DueTile]
                ///
                Container(
                  width: SizeConfig.width * 0.15,
                  alignment: Alignment.centerRight,
                  child: Checkbox(
                    value: due.isCleared,
                    onChanged: checkBoxToggle,
                  ),
                ),
              ],
            ),
            Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
