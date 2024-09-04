import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GalleryPage(),
    );
  }
}

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _photos;
  List<XFile>? _videos;

  @override
  void initState() {
    super.initState();
    _loadAssets();
  }

  Future<void> _loadAssets() async {
    final pickedPhotos = await _picker.pickMultiImage();
    final pickedVideos = await _picker.pickVideo(source: ImageSource.gallery);

    setState(() {
      _photos = pickedPhotos;
      _videos = pickedVideos != null ? [pickedVideos] : [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Gallery'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'Photos'),
            Tab(text: 'Videos'),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          _buildGridView(_photos),
          _buildGridView(_videos),
        ],
      ),
    );
  }

  Widget _buildGridView(List<XFile>? files) {
    if (files == null) return Center(child: CircularProgressIndicator());
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: files.length,
      itemBuilder: (context, index) {
        return Image.file(File(files[index].path), fit: BoxFit.cover);
      },
    );
  }
}
