import 'package:dio_sign_up/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service_locator.dart';
import '../home/bloc/home_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(HomeEventFetchUsers()),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () => null, icon: Icon(Icons.exit_to_app_rounded))
          ],
        ),
      ),
    );
  }
}
