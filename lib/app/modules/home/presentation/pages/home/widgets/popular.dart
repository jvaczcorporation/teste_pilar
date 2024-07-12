import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class Popular extends StatefulWidget {
  final PopularEntity popular;

  const Popular({super.key, required this.popular});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  late PopularType filterSelected = PopularType.movies;

  @override
  Widget build(BuildContext context) {
    final list = filterSelected.name == PopularType.movies.name
        ? widget.popular.movies
        : widget.popular.series;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Text(
                    "Populares",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                  ),
                  child: SwitchOptions(
                      options: PopularType.values
                          .map(
                            (item) => Option(
                              label: item.label,
                              value: item.name,
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          filterSelected = PopularType.values.firstWhere(
                              (element) => element.name == value.value);
                        });
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return CardInfo(
                  mediaProduct: item,
                  onTap: () {
                    Modular.to.pushNamed("/details", arguments: item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
