import 'package:flutter/material.dart';

import 'package:todo_app/modules/core/core.dart';

class ImageNetworkBuilder extends StatelessWidget {
  const ImageNetworkBuilder(
    this.imageUrl, {
    Key? key,
    this.boxFit,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: boxFit,
      loadingBuilder: (context, child, loadingProgress) {
        double? currentProgress;

        if (loadingProgress != null) {
          int? totalBytes = loadingProgress.expectedTotalBytes;
          if (totalBytes != null) {
            currentProgress =
                (loadingProgress.cumulativeBytesLoaded / totalBytes).toDouble();
          }
        }

        if (loadingProgress == null) {
          return child;
        } else {
          return Container(
            color: AppColors.backgroundColor(context),
            child: Center(
              child: CircularProgressIndicator(
                value: currentProgress,
              ),
            ),
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.broken_image),
              Text(
                'imagem não encontrada',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyText1(context)?.copyWith(fontSize: 10),
              ),
            ],
          ),
        );
      },
    );
  }
}
