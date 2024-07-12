import 'package:flutter/material.dart';
import 'package:teste_pilar/app/modules/home/home.dart';
import 'package:teste_pilar/app/commons/presentation/widgets/player.dart';

class Trailers extends StatelessWidget {
  final List<MediaProductEntity> trailers;

  const Trailers({super.key, required this.trailers});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 12,
              left: 20,
            ),
            child: Text(
              "Últimos Trailers",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: trailers.length,
              itemBuilder: (context, index) {
                final item = trailers[index];
                return CardTrailer(
                  mediaProduct: item,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Player(
                          id: item.details?.videos.results.first.key ?? '',
                        );
                      },
                    );
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
