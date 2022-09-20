import 'package:flutter/material.dart';
import 'package:shagher/packages/components/image/cache_user.dart';
import 'package:shagher/themes/app_colors.dart';

// TODO: check for similar

class EditableImage extends StatelessWidget {
  const EditableImage({
    Key? key,
    required this.imagePath,
    required this.onClicked,
    double width = 128,
    double height = 128,
  })  : _width = width,
        _height = height,
        super(key: key);

  final String? imagePath;
  final VoidCallback onClicked;
  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          CachedUser(
            imageUser: imagePath!,
            height: _height,
            width: _width,
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: editImageIcon(color),
          ),
        ],
      ),
    );
  }

  Widget editImageIcon(Color color) => buildCircle(
        color: AppColors.white,
        padding: 3,
        child: buildCircle(
          color: color,
          padding: 8,
          child: const Icon(
            Icons.add_a_photo,
            color: AppColors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double padding,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(padding),
          color: color,
          child: child,
        ),
      );
}
