import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'watchlist_viewmodel.dart';

class WatchlistView extends StackedView<WatchlistViewModel> {
  const WatchlistView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WatchlistViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: StreamBuilder(
          stream: viewModel.stream,
          builder: (context, snapshot) => Text('Hello'),
        ));
  }

  @override
  WatchlistViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WatchlistViewModel();
}
