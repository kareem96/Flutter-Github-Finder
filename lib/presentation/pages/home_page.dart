


import 'package:flutter/material.dart';
import 'package:github_finder/common/state_enum.dart';
import 'package:github_finder/presentation/provider/search_user_provider.dart';
import 'package:github_finder/presentation/widgets/search/result_text.dart';
import 'package:github_finder/presentation/widgets/search/user_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode _txtNode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Github user finder'),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query){
                Provider.of<SearchListNotifier>(context, listen: false).fetchUserSearch(query);
              },
              decoration: const InputDecoration(
                hintText: 'Search user github',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()
              ),
              textInputAction: TextInputAction.search,
            ),
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
  }
}
