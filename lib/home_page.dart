import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nameUser = Provider((ref) => 'Vinícius');
final counterProvider = StateProvider((ref) => 0);
final counterUpProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameUserWatch = ref.watch(nameUser);
    final counter = ref.watch(counterProvider.state);
    final counterUp = ref.watch(counterUpProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Estate Notifier - Riverpod')),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              nameUserWatch,
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              counterUp.toString(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //counter.state++;
          ref.read(counterUpProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }
}
