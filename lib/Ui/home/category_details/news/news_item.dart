import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/Ui/widget/main_loading_widget.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/utils/size_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../api/model/news/Articles.dart';

class NewsItem extends StatelessWidget {
  final News news;

  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.04,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).splashColor, width: 2),
      ),
      child: Column(
        spacing: height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              height: height * 0.25,
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => MainLoadingWidget(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
          Row(
            children: [
              Expanded(
                child: Text(
                  'By : ${news.author}',
                  style: AppStyles.medium12Gray,
                ),
              ),
              Text(
                news.publishedAt != null
                    ? DateFormat('dd/MM/yyyy').format(DateTime.parse(news.publishedAt!))
                    : '',
                style: AppStyles.medium12Gray,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
