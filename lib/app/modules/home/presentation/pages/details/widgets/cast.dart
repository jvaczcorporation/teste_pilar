import 'package:flutter/material.dart';
import 'package:teste_pilar/app/modules/home/domain/entities/details_entity.dart';

class Cast extends StatelessWidget {
  final List<CastEntity> cast;

  const Cast({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    final mainCast = cast.take(10).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Elenco",
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 195,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: mainCast.length,
            itemBuilder: (context, index) {
              final item = mainCast[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          item.urlImageProfile,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              left: 4.0,
                              right: 4.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  item.character,
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
