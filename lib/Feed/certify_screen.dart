import 'package:flutter/material.dart';
import 'feed_screen.dart';

class CertifyScreen extends StatefulWidget {
  @override
  _CertifyScreenState createState() => _CertifyScreenState();
}

class _CertifyScreenState extends State<CertifyScreen> {
  final _textController = TextEditingController();

  void _submitPost() {
    if (_textController.text.isNotEmpty) {
      // 여기에 새로운 게시글 추가하는 로직 구현
      // 예: 서버에 업로드 또는 로컬 상태에 저장

      // 현재는 그냥 콘솔에 출력
      print('Post submitted with text: ${_textController.text}');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeedScreen(school: "명지대학교"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이번주 챌린지: 텀블러 사용'),
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
              onPressed: _submitPost,
              child: Text('제출'),
            ),
          ],
        ),
      ),
    );
  }
}