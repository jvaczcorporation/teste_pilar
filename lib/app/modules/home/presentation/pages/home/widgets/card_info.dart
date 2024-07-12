import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../../../commons/commons.dart';

class CardInfo extends StatelessWidget {
  final MediaProductEntity mediaProduct;
  final GestureTapCallback? onTap;

  const CardInfo({
    super.key,
    required this.mediaProduct,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: mediaProduct.isLoading ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          child: mediaProduct.isLoading
              ? Column(
                  children: [
                    LoaderShimmer(
                      highlightColor: Colors.grey.withOpacity(0.5),
                      baseColor: AppTheme.primary.withOpacity(0.2),
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: AppTheme.boxShadowContainer,
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: LoaderShimmer(
                        highlightColor: Colors.grey.withOpacity(0.5),
                        baseColor: AppTheme.primary.withOpacity(0.2),
                        child: Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: AppTheme.boxShadowContainer,
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4.0,
                      ),
                      child: LoaderShimmer(
                        highlightColor: Colors.grey.withOpacity(0.5),
                        baseColor: AppTheme.primary.withOpacity(0.2),
                        child: Container(
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: AppTheme.boxShadowContainer,
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(mediaProduct.urlImagePoster),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            left: 4.0,
                            right: 4.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mediaProduct.title,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                DateFormat("dd 'de' MMM 'de' yyyy")
                                    .format(mediaProduct.releaseDate),
                                style: const TextStyle(
                                  fontSize: 11.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 6,
                      top: 140,
                      child: Container(
                        padding: const EdgeInsets.all(1.0),
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
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
