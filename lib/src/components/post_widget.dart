import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/src/components/avatar_widget.dart';
import 'package:flutter_insta/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  //게시글의 프로필 사진, 아이디, 더보기
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            thumbPath: "https://picsum.photos/250?image=5",
            type: AvatarType.TYPE3,
            nickname: "이예나",
            size: 40,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  //업로드한 이미지
  Widget _image() {
    return CachedNetworkImage(
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/ko/thumb/4/4a/신짱구.png/230px-신짱구.png',
      height: 300,
    );
  }

  //좋아요 개수
  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 65,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.replyIcon,
                width: 60,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.directMessage,
                width: 55,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 50,
          ),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '좋아요 15개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText(
            '콘텐츠 1입니다!!콘텐츠 1입니다\n콘텐츠 1입니다!!콘텐츠 1입니다\n콘텐츠1\n콘텐츠 1\n콘텐츠 1\n',
            prefixText: '이예나', //아이디
            onPrefixTap: () {
              //아이디 누르면 동작 함수
            },
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기', //더보기 누르면 펼쳐짐
            collapseText: '접기',
            maxLines: 3, //3번째줄부터 숨기기
            expandOnTextTap: true, //텍스트 눌러도 펼쳐지기
            collapseOnTextTap: true, //텍스트 눌러도 접어지기
            linkColor: Colors.grey, //expandText 글자색 정하기
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '댓글 10개 모두 보기',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1일전',
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _header(),
        const SizedBox(height: 15),
        _image(),
        const SizedBox(height: 15),
        _infoCount(),
        const SizedBox(height: 5),
        _infoDescription(),
        const SizedBox(height: 5),
        _replyTextBtn(),
        const SizedBox(height: 5),
        _dateAgo(),
      ]),
    );
  }
}
