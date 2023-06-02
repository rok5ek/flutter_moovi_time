import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovi_time/presentation/app_bloc.dart';
import 'package:moovi_time/presentation/app_event.dart';
import 'package:moovi_time/presentation/core/resources/app_text_styles.dart';
import 'package:moovi_time/presentation/core/widgets/setting_section_view.dart';
import 'package:moovi_time/presentation/core/widgets/settings_item_view.dart';
import 'package:moovi_time/presentation/screens/profile/profile_bloc.dart';
import 'package:moovi_time/presentation/screens/profile/profile_event.dart';
import 'package:moovi_time/presentation/screens/profile/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // disables keyboard overflow issue
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: AppTextStyles.toolbarTitle,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (BuildContext context, ProfileState state) {
        if (state.isDarkMode) {
          context.read<AppBloc>().add(const AppEvent.themeMode(themeMode: ThemeMode.dark));
        } else {
          context.read<AppBloc>().add(const AppEvent.themeMode(themeMode: ThemeMode.light));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const SettingsSection(title: "App"),
              SettingsItem(
                title: "Dark mode",
                type: SettingsItemType.SWITCH,
                switchValue: state.isDarkMode,
                onTap: () {
                  debugPrint("[App] [_ProfileScreenState] {buildBody} appBloc:${context.read<AppBloc>()}");
                  context.read<ProfileBloc>().add(ProfileEvent.darkMode(isDarkMode: !state.isDarkMode));
                },
                onSwitchTap: (bool value) {
                  context.read<ProfileBloc>().add(ProfileEvent.darkMode(isDarkMode: value));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
