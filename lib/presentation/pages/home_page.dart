


import 'package:flutter/material.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/presentation/provider/search_user_provider.dart';
import 'package:github_finder/presentation/widgets/search/result_text.dart';
import 'package:github_finder/presentation/widgets/search/search_field.dart';
import 'package:github_finder/presentation/widgets/search/user_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*TextField(
              onSubmitted: (query){
                Provider.of<SearchListNotifier>(context, listen: false).fetchUserSearch(query);
              },
              decoration: const InputDecoration(
                hintText: 'Search user github',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()
              ),
              textInputAction: TextInputAction.search,
            ),*/
            SearchField(),
            const SizedBox(height: 16),
            ResultText(),
            Consumer<SearchListNotifier>(
                builder: (context, data, child){
                  if(data.state == RequestState.Loading){
                    return const Center(child: CircularProgressIndicator(),);
                  }else if(data.state == RequestState.Loaded){
                    final result = data.searchResult;
                    return Expanded(
                        child: ListView.builder(
                          itemCount: result.length,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index){
                            final user = data.searchResult[index];
                            return UserCard(user);
                            },
                        )
                    );
                  }else{
                    return Expanded(child: Container());
                  }
                }
            )
          ],
        ),
      ),
    );
    /*return BlocProvider<SearchBloc>(
      create: (context) => getIt<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(brightness: Brightness.dark, title: Text('Search user github'), centerTitle: true,),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            SearchField(),
            ResultText(),
            UserList(),
          ],
        ),
      ),
    );*/
  }

}
