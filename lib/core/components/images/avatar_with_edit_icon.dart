import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/core/components/images/cache_image_reuse.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';

class AvatarWithEditIcon extends StatefulWidget {
  const AvatarWithEditIcon({
    super.key,
    required this.imageUrl,
    this.onImageChanged,
    this.containerSize = 82,
    this.imageSize = 82,
    this.padding = 8,
    this.borderColor = Colors.black,
    this.containerColor = Colors.transparent,
  });

  final String? imageUrl;
  final Function(String)? onImageChanged;
  final double containerSize;
  final double imageSize;
  final double padding;
  final Color borderColor;
  final Color containerColor;

  @override
  State<AvatarWithEditIcon> createState() => _AvatarWithEditIconState();
}

class _AvatarWithEditIconState extends State<AvatarWithEditIcon> {

  void _pickImage() async {
    // await FilePicker.platform.pickFiles(type: FileType.image).then((value) {
    //   if (value != null) {
    //     _imagePath = value.files.first.path!;
    //     widget.onImageChanged?.call(_imagePath);
    //   }
    // });
    //context.navigateToPage(const PhotosLibraryPage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 4, color: Colors.white),
      ),
      child: CacheImageReuse(
        imageUrl: widget.imageUrl ?? '',
        loadingWidth: widget.imageSize,
        loadingHeight: widget.imageSize,
        avatarError: true,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: widget.containerSize.h,
            height: widget.containerSize.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.containerColor,
              shape: BoxShape.circle,
              border: Border.all(width: .8, color: widget.borderColor),
            ),
            padding: EdgeInsets.all(widget.padding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image(
                image: imageProvider,
                width: widget.imageSize.h,
                height: widget.imageSize.w,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ).addAction(onTap: widget.onImageChanged != null ? _pickImage : null),
    );
  }
}
