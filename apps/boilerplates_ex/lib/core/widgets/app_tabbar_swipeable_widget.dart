import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';

class TabModel {
  final String text;
  String? outlinedText;
  bool isSelected;
  Widget page;

  TabModel({
    required this.text,
    this.outlinedText = '',
    this.isSelected = false,
    required this.page,
  });
}

class AppTabBarSwipeableWidget extends StatefulWidget {
  const AppTabBarSwipeableWidget(
    this.tabs, {
    super.key,
    required this.onTap,
    this.isScrollable = false,
  });

  final List<TabModel> tabs;
  final bool isScrollable;
  final Function(int index)? onTap;

  @override
  State<AppTabBarSwipeableWidget> createState() =>
      _AppTabBarSwipeableWidgetState();
}

class _AppTabBarSwipeableWidgetState extends State<AppTabBarSwipeableWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: widget.tabs.indexWhere((element) => element.isSelected),
        length: widget.tabs.length,
        vsync: this);
  }

  @override
  void didUpdateWidget(covariant AppTabBarSwipeableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabs.length == widget.tabs.length) {
      final newIndex = widget.tabs.indexWhere((element) => element.isSelected);
      _tabController?.animateTo(newIndex);
    }
    if (oldWidget.tabs.length != widget.tabs.length) {
      _tabController?.dispose();
      _tabController = null;
      _tabController = TabController(
        initialIndex: widget.tabs.indexWhere((element) => element.isSelected),
        length: widget.tabs.length,
        vsync: this,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          // physics: const NeverScrollableScrollPhysics(),
          dividerHeight: 0.1,
          controller: _tabController,
          onTap: ((value) => widget.onTap?.call(value)),
          isScrollable: widget.isScrollable,
          // labelPadding: const EdgeInsets.symmetric(horizontal: 12),
          tabs: widget.tabs
              .map((element) => _AppTabBarChildWidget(element))
              .toList(),
          indicatorColor: Theme.of(context).primaryColor,
          tabAlignment: TabAlignment.center,
          automaticIndicatorColorAdjustment: true,
        ),
      ],
    );
  }
}

class _AppTabBarChildWidget extends StatelessWidget {
  const _AppTabBarChildWidget(this.tabModel);

  final TabModel tabModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: tabModel.tabSize ?? double.infinity,
      height: 48,
      child: Center(
        child: AppTextWidget(
          tabModel.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: tabModel.isSelected
                    ? Theme.of(context).primaryColor
                    : AppColors.get().neutralColor[40],
              ),
        ),
      ),
    );
  }
}
