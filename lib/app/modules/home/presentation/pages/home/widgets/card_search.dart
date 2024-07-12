import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_pilar/app/commons/commons.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class CardSearch extends StatelessWidget {
  final MediaProductEntity mediaProduct;
  final GestureTapCallback? onTap;

  const CardSearch({
    super.key,
    required this.mediaProduct,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: mediaProduct.isLoading ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
        child: SizedBox(
          height: 120,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: AppTheme.boxShadowContainer,
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Expanded(
                          child: SizedBox.shrink(),
                        ),
                        Container(
                          height: 44,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEFEFEF),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(8.0),
                              right: Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: mediaProduct.isLoading
                    ? Row(
                        children: [
                          LoaderShimmer(
                            highlightColor: Colors.grey.withOpacity(0.5),
                            baseColor: AppTheme.primary.withOpacity(0.2),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: AppTheme.boxShadowContainer,
                                borderRadius: BorderRadius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12.0,
                                    ),
                                    child: LoaderShimmer(
                                      highlightColor:
                                          Colors.grey.withOpacity(0.5),
                                      baseColor:
                                          AppTheme.primary.withOpacity(0.2),
                                      child: Container(
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow:
                                              AppTheme.boxShadowContainer,
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16.0,
                                    ),
                                    child: LoaderShimmer(
                                      highlightColor:
                                          Colors.grey.withOpacity(0.5),
                                      baseColor:
                                          AppTheme.primary.withOpacity(0.2),
                                      child: Container(
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow:
                                              AppTheme.boxShadowContainer,
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            mediaProduct.urlImagePoster,
                            fit: BoxFit.cover,
                            width: 80,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mediaProduct.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    DateFormat("dd 'de' MMM 'de' yyyy")
                                        .format(mediaProduct.releaseDate),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Expanded(
                                    child: Text(
                                      mediaProduct.overview,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
