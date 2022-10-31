import 'package:bloc_state/bloc/cats_cubit.dart';
import 'package:bloc_state/bloc/cats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCatsView extends StatefulWidget {
  const BlocCatsView({super.key});

  @override
  State<BlocCatsView> createState() => _BlocCatsViewState();
}

class _BlocCatsViewState extends State<BlocCatsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatsCubit(),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Cats'),
        ),
        body: BlocConsumer<CatsCubit, CatsState>(builder: (context, state) {
          if (state is CatsInitial) {
            return Center(
              child: Column(
                children: [
                  const Text('Press the button to load cats'),
                  FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<CatsCubit>(context).loadCats( ),
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
            );
          } else if (state is CatsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CatsCompleted) {
            return buildGridView(state.response);
          } else if (state is CatsError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Unknown state'),
            );
          }
        }, listener: (context, state) {
          if (state is CatsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        }),
      );

  buildGridView(List<String> response) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: response.length,
      itemBuilder: (context, index) {
        return Image.network(response[index]);
      },
    );
  }
}
