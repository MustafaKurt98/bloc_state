import 'package:bloc_state/bloc/cats_cubit.dart';
import 'package:bloc_state/bloc/cats_repoitory.dart';
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
      create: (context) => CatsCubit(SampleCatsRepository()),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Cats'),
        ),
        body: BlocConsumer<CatsCubit, CatsState>(builder: (context, state) {
          if (state is CatsInitial) {
            return buildInitialChild(context);
          } else if (state is CatsLoading) {
            return buildProgressIndicator();
          } else if (state is CatsCompleted) {
            return buildGridView(state);
          } else if (state is CatsError) {
            return buildErrorChild(state);
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

  Center buildErrorChild(CatsError state) {
    return Center(
      child: Text(state.message),
    );
  }

  Center buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center buildInitialChild(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Press the button to load cats'),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CatsCubit>(context).loadCats(),
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  buildGridView(CatsCompleted response) {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: Image.network(response.response[index].imageUrl!),
        subtitle: Text(response.response[index].description!),
      );
    });
  }
}
