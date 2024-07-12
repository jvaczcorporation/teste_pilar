import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/commons/presentation/keys/keys.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  final _focus = FocusNode();

  String _lastSearch = '';
  final TextEditingController _searchBarController =
      TextEditingController(text: "");

  bool get shouldCleanSearch =>
      controller.store.hasSearchData &&
      controller.store.searchText.isNotEmpty &&
      _lastSearch == controller.store.searchText;

  @override
  void initState() {
    controller.initialFetchData();

    controller.scroll.addListener(() {
      if (controller.scroll.position.atEdge && controller.store.hasSearchData) {
        bool isBottom = controller.scroll.position.pixels != 0;
        if (isBottom) {
          if (controller.store.state == StoreState.completed) {
            controller.aditionalSearch();
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppKeys.home.pageKey.toKey(),
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: const Text(
          "O que você quer assistir hoje?",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 24.0, color: Colors.white),
        ),
      ),
      backgroundColor: AppTheme.primary,
      body: Obx(
        () {
          return Center(
            child: Column(
              children: [
                _buildSearchBar,
                Expanded(
                  child: controller.store.hasError
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                          ),
                          child: Center(
                            child: Text(
                              "Ooops! Algo deu errado.. Tente novamente mais tarde!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: controller.initialFetchData,
                          child: ListView(
                            controller: controller.scroll,
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              if (!controller.store.hasSearchData)
                                _buildListDataHome,
                              if (controller.store.hasSearchData)
                                _buildListResultSearch,
                            ],
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget get _buildSearchBar => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Center(
                  child: TextField(
                    key: AppKeys.home.searchBarKey.toKey(),
                    controller: _searchBarController,
                    focusNode: _focus,
                    onChanged: controller.onChangedSearchText,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Buscar...",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  key: AppKeys.home.buttonSearchKey.toKey(),
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  onTap: controller.store.searchText.isNotEmpty
                      ? () {
                          if (shouldCleanSearch) {
                            _searchBarController.clear();
                            controller.cleanSearch();
                          } else {
                            controller.searchByText(_searchBarController.text);
                          }
                          _focus.unfocus();
                          _lastSearch = _searchBarController.text;
                        }
                      : null,
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: controller.store.searchText.isEmpty
                            ? [
                                Colors.grey,
                                Colors.black12,
                              ]
                            : shouldCleanSearch
                                ? [
                                    Colors.red,
                                    Colors.orangeAccent,
                                  ]
                                : [
                                    Colors.teal,
                                    Colors.lightBlueAccent,
                                  ],
                      ),
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        shouldCleanSearch ? "Limpar" : "Buscar",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _buildListDataHome => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Column(
          children: [
            Trending(
              trending: controller.store.dataTrending,
            ),
            Trailers(
              trailers: controller.store.dataTrailers,
            ),
            Popular(
              popular: controller.store.dataPopular,
            ),
          ],
        ),
      );

  Widget get _buildListResultSearch => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Builder(builder: (context) {
          if (controller.store.searchData != null &&
              controller.store.searchData!.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Nenhum resultado encontrado...",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.store.searchData?.length ?? 0,
            itemBuilder: (context, index) {
              final mediaProduct = controller.store.searchData![index];
              return CardSearch(
                mediaProduct: mediaProduct,
                onTap: () {
                  Modular.to.pushNamed("/details", arguments: mediaProduct);
                },
              );
            },
          );
        }),
      );
}
