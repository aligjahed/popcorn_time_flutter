import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';

class TitleWithInfo extends StatelessWidget {
  const TitleWithInfo({Key? key , required String this.title , required String this.tooltip}) : super(key: key);

  final String title;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ).tr(),
        SizedBox(width: 5),
        Tooltip(
          message: tr(tooltip),
          style: TooltipThemeData(
              textStyle: TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.9),
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Icon(
              FluentIcons.info12,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
