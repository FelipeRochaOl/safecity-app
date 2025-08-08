import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safecity/ui/styles/colors.dart';
import 'package:video_player/video_player.dart';

class AppMediaInput extends StatefulWidget {
  final String label;
  final bool isVideo;
  final void Function(XFile file) onMediaSelected;

  const AppMediaInput({
    super.key,
    required this.label,
    required this.onMediaSelected,
    this.isVideo = false,
  });

  @override
  State<AppMediaInput> createState() => _AppMediaInputState();
}

class _AppMediaInputState extends State<AppMediaInput> {
  XFile? _selectedFile;
  VideoPlayerController? _videoController;

  Future<void> _pickMedia() async {
    final picker = ImagePicker();
    final XFile? file = widget.isVideo
        ? await picker.pickVideo(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.camera);

    if (file != null) {
      setState(() {
        _selectedFile = file;
      });

      if (widget.isVideo) {
        _videoController = VideoPlayerController.file(File(file.path));
        await _videoController!.initialize();
        _videoController!.setLooping(true);
        _videoController!.play();
      }

      widget.onMediaSelected(file);
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton.icon(
          onPressed: _pickMedia,
          icon: Icon(widget.isVideo ? Icons.videocam : Icons.camera_alt),
          label: Text(widget.label),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: AppColors.backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            minimumSize: Size(double.infinity, 50.0),
          ),
        ),
        const SizedBox(height: 10),
        if (_selectedFile != null)
          widget.isVideo
              ? _videoController != null &&
                        _videoController!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoController!.value.aspectRatio,
                        child: VideoPlayer(_videoController!),
                      )
                    : const CircularProgressIndicator()
              : Image.file(
                  File(_selectedFile!.path),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
      ],
    );
  }
}
