import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'feed_screen.dart';

class CertifyScreen extends StatefulWidget {
  @override
  _CertifyScreenState createState() => _CertifyScreenState();
}

class _CertifyScreenState extends State<CertifyScreen> {
  final _textController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  void _submitFeed() async {
    if (_textController.text.isNotEmpty) {
      await _databaseHelper.insertFeed(_textController.text, 1, 1); // 예시로 userId와 challengeId를 1로 설정

      // 콘솔에 출력
      print('Feed submitted with content: ${_textController.text}');
      _textController.clear(); // 입력 필드 초기화

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeedScreen(school: "명지대학교"),
        ),
      );
    } else {
      print('Text field is empty');
    }
  }

  void _showFeeds() async {
    List<Map<String, dynamic>> feeds = await _databaseHelper.getFeeds();
    for (var feed in feeds) {
      print('Feed: ${feed['feed_content']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이번주 챌린지: 텀블러 사용'),
        actions: [
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: _showFeeds,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // 아무 동작도 하지 않음
              },
              child: Container(
                color: Colors.grey[300],
                height: 200,
                child: Center(child: Text('클릭하여 사진 업로드')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: '문구를 작성해주세요',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _submitFeed,
              child: Text('제출'),
            ),
          ],
        ),
      ),
    );
  }
}