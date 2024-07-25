import 'package:flutter/material.dart';
import 'post_card.dart';

class FeedScreen extends StatelessWidget {
  final String school;

  FeedScreen({required this.school});

  final List<Map<String, String>> posts = [
    {
      'username': '닉네임입니다',
      'post': '오늘은 아메리카노~',
      'userImage': 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEwMjFfMTMy%2FMDAxNjAzMjY3MDkyNDE4.bT_OAF2J3Hv-7YmRkXdN1dNeQ3BiyU8_4fJBDnHpRYog.9HAuFd_WCPMWngFxL8PpEOjcmsgzZL_Sq2it3YK-waYg.JPEG.dlwldms989%2F1603267093274.jpg&type=a340',
      'postImage': 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MjBfMTM0%2FMDAxNjE4ODg1NDUzMjI2.XJ-cxRNJyN3NL76Tog3j_HoToS9kpq7g53WgxL4IkUQg.sAIq-CFv2EvGaXOSBRGtE_40FJlY4WFSuz6mAnt3o2Ig.JPEG.jks_snr_0310%2FKakaoTalk_20210420_105357263_21.jpg&type=a340',
      'carbonSavings': '9.59gCO2'
    },
    {
      'username': '사용자123',
      'post': '텀블러 사용 인증!',
      'userImage': 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMDRfMjA4%2FMDAxNjY0ODczNDEwMTA4.DzuwESknWa1sqoauR8u7MSFUsu9Po2Pxtd2l7T6istUg.TIcuhkxc4iOWIA7HmHeejlfDCP1-ZXhMRmXTR2R60iIg.PNG.ppuriacademy%2Fimage.png&type=a340',
      'postImage': 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTAyMjBfODEg%2FMDAxNTUwNjYzMTAwNzg2.3gPD5SD5kWsbHewjVo0-2X8XV2I-rhHwBLTdHpDKzLwg.ucY27XJ2QddHLTT-clhRBWyEZfRt0rnWCDhIqywBSUUg.JPEG.successeuna%2FP20190220_045154880_43EEA82F-9DF8-49F7-8593-4BAAB67BE024.JPG&type=a340',
      'carbonSavings': '7.25gCO2'
    },
    {
      'username': '사용자456',
      'post': '좋은 하루 되세요!',
      'userImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5s_xTz_bBMs7yiNyyt7j2XJTjgY_2BVCQOA&s',
      'postImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH8HzhB0iIqogLN6HqHtlfXI9P2dOKaB9jVA&s',
      'carbonSavings': '5.50gCO2'
    },
    {
      'username': '사용자789',
      'post': '텀블러로 환경 보호!',
      'userImage': 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMDZfOTMg%2FMDAxNzA0NTM5NDQ1MDcz.MrON84zvb8gYXkanBBKqeRHBbzAXZPp0woUpCDxwPYcg.KEGVL4HBNtQcllf2qpTnaXMf_QhvqkLkP64CJL8CtkMg.PNG.bkson701%2F0005.png&type=a340',
      'postImage': 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTVfMTE3%2FMDAxNjcxMDc0OTM5MTI0.MfqPVZVaK7S3fFudbHvreTV7rMWyMII_It6eAsxsndYg.WrM1UHsaM8oqRBOWSPpmIILYDn0iB_8UxAE8aVZ4KFAg.JPEG.fbekgps%2F20221214%25A3%25DF205335.jpg&type=a340',
      'carbonSavings': '8.00gCO2'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(school),
              background: Container(
                color: Colors.white,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxODAxMDlfMjM0%2FMDAxNTE1NDk3OTc3MDUx.2lBAlnRwiG2hHOkbHx9k8gm_XJO9coFqvsaN9dp8kM0g.LRRjqsyktyHQXoRM77Tyha4pvYQ7Adcbi1D5y0XTXkog.PNG.kmj_teacher%2F%25B8%25ED%25C1%25F6%25B4%25EB.png&type=a340', // 로고 이미지 URL을 여기에 입력하세요
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return PostCard(
                  username: posts[index]['username']!,
                  post: posts[index]['post']!,
                  userImage: posts[index]['userImage']!,
                  postImage: posts[index]['postImage']!,
                  carbonSavings: posts[index]['carbonSavings']!,
                );
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}