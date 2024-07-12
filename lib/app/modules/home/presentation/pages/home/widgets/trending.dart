import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_pilar/app/commons/presentation/widgets/switch_options.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class Trending extends StatefulWidget {
  final TrendingEntity trending;

  const Trending({super.key, required this.trending});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  late TrendingType filterSelected = TrendingType.day;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final list = filterSelected.name == TrendingType.day.name
        ? widget.trending.day
        : widget.trending.week;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  "Tendências",
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
                  options: TrendingType.values
                      .map(
                        (item) => Option(
                          label: item.label,
                          value: item.name,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      filterSelected = TrendingType.values
                          .firstWhere((element) => element.name == value.value);
                    });
                  },
                ),
              ),
            ],
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
