import 'package:flutter/material.dart';
import 'package:teste_pilar/app/modules/home/home.dart';

class HeaderDetails extends StatefulWidget {
  final MediaProductEntity mediaProduct;

  const HeaderDetails({
    super.key,
    required this.mediaProduct,
  });

  @override
  State<HeaderDetails> createState() => _HeaderDetailsState();
}

class _HeaderDetailsState extends State<HeaderDetails>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(
      milliseconds: 1000,
    ),
    vsync: this,
  )..forward();

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.5, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    ),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.mediaProduct.urlImageBlackdrop,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        _buildImagePoster,
      ],
    );
  }

  Widget get _buildImagePoster => Positioned.fill(
        child: Align(
          alignment: Alignment.centerLeft,
          child: SlideTransition(
            position: _offsetAnimation,
            child: Container(
              height: 150,
              width: 100,
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.mediaProduct.urlImagePoster,
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 8.0,
                    offset: const Offset(8, 8),
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
            ),
          ),
        ),
      );
}
