import 'package:easy_localization/easy_localization.dart';
import 'package:file_selector/file_selector.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:popcorn_time_flutter/config/Colors.dart';
import 'package:popcorn_time_flutter/widgets/title_with_info.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  bool isOrganizeCheck = false;
  bool isRandCoverChecked = false;
  String path = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Column(
        children: [
          TitleWithInfo(
            title: 'introduction.setting.body.path.title',
            tooltip: 'introduction.setting.body.path.tooltip',
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: IconButton(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    path != ""
                        ? Text(path)
                        : Text('introduction.setting.body.path.placeholder')
                            .tr(),
                    Icon(FluentIcons.folder_horizontal, size: 16),
                  ],
                ),
                onPressed: () async {
                  var dir = await getDirectoryPath();
                  if (dir != null) {
                    setState(
                      () {
                        path = dir;
                      },
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              TitleWithInfo(
                title: 'introduction.setting.body.organize.title',
                tooltip: 'introduction.setting.body.organize.tooltip',
              ),
              SizedBox(width: 6),
              Text(
                'general.experimental',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w400),
              ).tr(),
              SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(50),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: ToggleSwitch(
                  checked: isOrganizeCheck,
                  onChanged: (e) {
                    setState(() {
                      isOrganizeCheck = e;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              TitleWithInfo(
                title: 'introduction.setting.body.poster.title',
                tooltip: 'introduction.setting.body.poster.tooltip',
              ),
              SizedBox(width: 6),
              Text(
                'general.experimental',
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.w400),
              ).tr(),
              SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: ToggleSwitch(
                  checked: isRandCoverChecked,
                  onChanged: (e) {
                    setState(() {
                      isRandCoverChecked = e;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
