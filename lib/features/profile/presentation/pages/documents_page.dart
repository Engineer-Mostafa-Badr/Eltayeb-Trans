import 'package:flutter/material.dart';

import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/enum/enums.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/res/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/document_widgets/document_card.dart';
import '../widgets/document_widgets/documents_header_banner.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final docs = _dummyDocuments;

    return SharedHomeScaffold(
      title: 'documents',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding14,
          vertical: AppPadding.padding16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DocumentsHeaderBanner(),
            AppPadding.padding24.sizedHeight,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: docs.length,
              separatorBuilder: (_, _) => AppPadding.padding16.sizedHeight,
              itemBuilder: (context, index) {
                return DocumentCard(document: docs[index]);
              },
            ),
            AppPadding.padding24.sizedHeight,
          ],
        ),
      ),
    );
  }
}

final List<DocumentModel> _dummyDocuments = [
  DocumentModel(
    titleKey: 'driving_license',
    status: DocumentStatus.valid,
    expiryLabel: '10 نوفمبر 2025',
    imagePath: AssetImagesPath.appLogo,
  ),
  DocumentModel(
    titleKey: 'personal_id',
    status: DocumentStatus.expired,
    expiryLabel: '10 نوفمبر 2025',
    imagePath: AssetImagesPath.appLogo,
  ),
  DocumentModel(
    titleKey: 'car_license',
    status: DocumentStatus.underReview,
    expiryLabel: '10 نوفمبر 2025',
    imagePath: AssetImagesPath.appLogo,
  ),
  DocumentModel(
    titleKey: 'operation_permit',
    status: DocumentStatus.valid,
    expiryLabel: 'no_expiry_date',
    hasFileIcon: true,
  ),
];
