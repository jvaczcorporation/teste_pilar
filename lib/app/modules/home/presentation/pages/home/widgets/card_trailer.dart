import 'package:flutter/material.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

import '../../../../../../commons/commons.dart';

class CardTrailer extends StatelessWidget {
  final MediaProductEntity mediaProduct;
  final GestureTapCallback? onTap;

  const CardTrailer({
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
            width: 290,
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
                : Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    mediaProduct.urlImageBlackdrop),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.2),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 4.0,
                          right: 4.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              mediaProduct.title,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0,
                                height: 1,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              mediaProduct.details?.videos.results.first.name ??
                                  "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
