import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class DetailPage extends StatefulWidget {
  final MediaProductEntity mediaProduct;

  const DetailPage({
    super.key,
    required this.mediaProduct,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controller = Modular.get<DetailsController>();

  MediaProductEntity get mediaProduct => controller.store.mediaProduct!;

  @override
  void initState() {
    controller.fetchDetails(widget.mediaProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: widget.mediaProduct.backgroundColor,
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: controller.store.hasError
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: Center(
                          child: Text(
                            "Ooops! Algo deu errado.. Tente novamente mais tarde!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18.0,
                              color: widget.mediaProduct.ligthColor,
                            ),
                          ),
                        ),
                      )
                    : controller.store.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: widget.mediaProduct.ligthColor,
                            ),
                          )
                        : ListView(
                            children: [
                              HeaderDetails(
                                mediaProduct: mediaProduct,
                              ),
                              _buildContent
                            ],
                          ),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: Modular.to.pop,
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }

  Widget get _buildContent => Container(
        padding: const EdgeInsets.all(8.0),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: widget.mediaProduct.backgroundColor,
          boxShadow: AppTheme.boxShadowContainer,
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: mediaProduct.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: " (${mediaProduct.releaseDate.year})",
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: CircularPercentIndicator(
                        radius: 18.0,
                        lineWidth: 3.0,
                        fillColor: Colors.black,
                        percent: mediaProduct.percentVoteAverage,
                        center: Text(
                          "${(mediaProduct.percentVoteAverage * 100).toStringAsFixed(0)}%",
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        progressColor: AppHelper.getColorByRate(
                          mediaProduct.voteAverage,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Avaliação \ndos usuários",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ),
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                  ),
                  Expanded(
                      child: mediaProduct.details!.genres.isNotEmpty
                          ? Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              runSpacing: 6.0,
                              spacing: 6.0,
                              children: mediaProduct.details!.genres
                                  .map(
                                    (genre) => Container(
                                      decoration: BoxDecoration(
                                        color: widget.mediaProduct.ligthColor,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 2.0),
                                        child: Text(
                                          genre['name'],
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: widget
                                                .mediaProduct.backgroundColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          : const SizedBox()),
                ],
              ),
            ),
            if (mediaProduct.details!.tagline.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  mediaProduct.details!.tagline,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            const Padding(
              padding: EdgeInsets.only(
                top: 12,
              ),
              child: Text(
                "Sinopse",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
              ),
              child: Text(
                mediaProduct.overview,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Cast(
              cast: mediaProduct.details!.credits.cast,
            ),
            if (mediaProduct.details?.hasVideos ?? false) ...[
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Trailer",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: CardTrailer(
                      mediaProduct: mediaProduct,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Player(
                              id: mediaProduct
                                  .details!.videos.results.first.key,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            ]
          ],
        ),
      );
}
