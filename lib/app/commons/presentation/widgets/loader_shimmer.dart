import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaderShimmer extends StatelessWidget {
  /// The background color
  final Color baseColor;

  /// The effect color
  final Color highlightColor;

  /// The widget that will be rendered
  final Widget child;

  /// The effect duration
  final Duration duration;

  final bool enabled;

  /// If the effect will last the times you pass. 0 means it will loop forever
  final int loop;

  /// The effect direction
  final ShimmerEffectDirection direction;

  const LoaderShimmer({
    Key? key,
    required this.baseColor,
    required this.highlightColor,
    this.duration = const Duration(milliseconds: 2000),
    this.enabled = true,
    this.loop = 0,
    this.direction = ShimmerEffectDirection.ltr,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return ClipRRect(
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          period: duration,
          direction: ShimmerDirection.values[direction.index],
          loop: loop,
          child: child,
        ),
      );
    }

    return child;
  }
}

enum ShimmerEffectDirection { ltr, rtl, ttb, btt }
