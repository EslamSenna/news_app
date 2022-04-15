import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'web_view.dart';

Widget buildArticleItem( list, index, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(url: list[index].url)));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 100.h,
                width: 130.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  list![index].urlToImage == null
                      ? 'https://maxler.com/local/templates/maxler/assets/img/not-found.png'
                      : list[index].urlToImage.toString(),
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: SizedBox(
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        list[index].title,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    Text(
                      list[index].publishedAt,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list,) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list, index, context),
    separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
    itemCount: list!.length);

class DefaultFormField extends StatelessWidget {
  final prefixIcon;
  final labelText;
  final onTap;
  final onChange;
  final controller;
  final validator;
  final type;

  //final enabled;

  const DefaultFormField(
      {Key? key,
      this.prefixIcon,
      this.labelText,
      this.onTap,
      this.controller,
      this.validator,
      this.type,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        onChanged: onChange,
        keyboardType: type,
        validator: (String? value) {
          if (value!.isEmpty) {
            return validator;
          }
          return null;
        },
        controller: controller,
        onTap: onTap,
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIcon,
            ),
            labelText: labelText,
            border: OutlineInputBorder()),
      ),
    );
  }
}
