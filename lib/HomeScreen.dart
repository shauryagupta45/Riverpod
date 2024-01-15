// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/main.dart';
import 'package:riverpod_project/users.dart';

//Note the difference between WidgetRef and ref is, WidgetRef allows the communication between Widget and provider, while ref allows the communication between provider and provider.
class HomeScreen
    extends ConsumerWidget //that's how we prepare this whole screen to receive the information from provider
{
  const HomeScreen({Key? key}) : super(key: key);

  void onSubmit1(WidgetRef ref, String value) {
    ref.read(nameProvider1.notifier).update((state) => value);
  }

  void onSubmit(WidgetRef ref, String value) {
    // ref.read(userProvider.notifier).updateName(value);
    ref.read(userChangeNotifierProvider).updateName(value);

    //In onSubmit1, the nameProvider was a StateProvider, so previously 'read' was a stateController but now, it is of type StateNotifier.
  }

  void onSubmitAge(WidgetRef ref, String value) {
    // ref.read(userProvider.notifier).updateAge(int.parse(value)); 
    ref.read(userChangeNotifierProvider).updateAge(int.parse(value)); 
  }

  //Now, see we couldn't change the name just like that in previous methods, but now, here, since we are using instance of stateNotifier class of user that is, UserNotifier, we get the instance of that class and we can update the name easily

  //Earlier this was string, which is immutable, but then, after adding notifier, it became a mutable object whose state can be changed like shown.

  @override
  Widget build(BuildContext context, WidgetRef ref)
//This ref is similar to the ref we used in provider, it is used by widget to communicate with the providers.
  {
    //Different way of calling/reading provider :
    // final name = ref.watch(nameProvider);
    // name = "hero";// We can't change the name outside provider just like that.
    // final nameRead = ref.read(nameProvider);
    //read is used when we have to read the value only once, while in watch, it is continously looking for the changes that occur. So it's preferred to use 'watch' function.

    // final name1 = ref.watch(nameProvider1) ??'';
    //Means if the provider return null, it will return empty string

    final user = ref.watch(userProvider);

    // Now we have 3 ways in which we can read the value : one is read , second is watch and the third is  using select method.

    final userSelect = ref.watch(userProvider.select((value) => value.name));

    //Ab hoga kya ki, pehle jab user ki koi bi property change hoti thi, tb tb screen re-build hoti thi, lekin isme jo bi attribute selected hota h na, like "name" in this, tb tb hi rebuild hoega widget.

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name.toString()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Center(
            child: Text(user.toString()),
          ),
        ],
      ),
    );
  }
}

//Another way to build Consumer for specific widget is :
//Consumer ( builder: (context,ref,child){
// final name = ref.watch(nameProvider) ;
// return Column(); (now we can use name value inside column widget only)
// }

//The difference between, Consumer and ConsumerWidget is, the whole widget tree rebuilds, when Consumerwidget is used, but using Consumer, will make code too much filled with nesting and all.

class class123 extends ConsumerStatefulWidget {
  const class123({Key? key}) : super(key: key);

  @override
  ConsumerState<class123> createState() => _class123State();
}

class _class123State extends ConsumerState<class123> {
  @override
  void initState() {
    super.initState();
    final x = ref.watch(nameProvider);
  }

  // In these functions declarations, it's good practice to use, read and not watch since watch give it a Listener that listens to change continously, while, read also works as a listener, but only one time. So it's better to use read in a function, so that it gets invoked only when it is wanted.
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//That's how we use Consumer in stful classes. We don't have to mention widgetRef, since it is already in build in 'ConsumerWidget'.That's why we can use the 'ref' in init or dispose state also
