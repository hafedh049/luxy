import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:luxy/utils/methods.dart';
import 'package:luxy/views/loading_screen.dart';
import 'package:luxy/views/red_screen.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:luxy/models/audio_message_model.dart';
import 'package:luxy/models/file_message_model.dart';
import 'package:luxy/models/image_message_module.dart';
import 'package:luxy/models/text_message_model.dart';
import 'package:luxy/utils/globals.dart';
import 'package:voice_message_package/voice_message_package.dart';

class CustomerService extends StatefulWidget {
  const CustomerService({super.key});

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  final String _uid = "123456789";
  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<State> _sendButtonKey = GlobalKey<State>();

  late final List<Map<String, dynamic>> _attachments;
  late final List<Map<String, dynamic>> _deletions;
  final List<VoiceController> _audios = <VoiceController>[];

  @override
  void dispose() {
    for (final VoiceController voiceController in _audios) {
      if (voiceController.isPlaying) {
        voiceController.stopPlaying();
      }
      voiceController.dispose();
    }
    _audios.clear();
    _inputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _attachments = <Map<String, dynamic>>[
      <String, dynamic>{"icon": FontAwesome.image, "title": "Pictures", "callback": _handleImageSelection},
      <String, dynamic>{"icon": FontAwesome.file, "title": "Files", "callback": _handleFileSelection},
      <String, dynamic>{"icon": FontAwesome.leaf_solid, "title": "Cancel", "callback": () => Navigator.pop(context)},
    ];
    _deletions = <Map<String, dynamic>>[
      <String, dynamic>{
        "icon": Icons.delete_forever,
        "title": "Delete Forever",
        "callback": (BuildContext context, QueryDocumentSnapshot<Map<String, dynamic>> doc, Map<String, dynamic> data) async {
          if (data["type"] == "audio") {
            final int index = _audios.indexWhere((VoiceController element) => element.audioSrc == data['content']);
            if (_audios[index].isPlaying) {
              _audios[index].stopPlaying();
            }
            _audios[index].dispose();
            _audios.removeAt(index);
          }
          if (data["type"] == "audio" || data["type"] == "image" || data["type"] == "file") {
            await FirebaseStorage.instance.refFromURL(data["content"]).delete();
          }

          await doc.reference.delete();
          showToast("Mensaje borrado");
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      },
      <String, dynamic>{"icon": FontAwesome.leaf_solid, "title": "Cancel", "callback": () => Navigator.pop(context)},
    ];
    super.initState();
  }

  Future<void> _handleAttachmentPressed() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 145,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  for (final Map<String, dynamic> item in _attachments)
                    InkWell(
                      hoverColor: transparent,
                      splashColor: transparent,
                      highlightColor: transparent,
                      onTap: () {
                        item["callback"]();
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(item["icon"], size: 15, color: white),
                          const SizedBox(height: 10),
                          Text(item["title"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              SocialMediaRecorder(
                slideToCancelText: '',
                slideToCancelTextStyle: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w400),
                cancelTextStyle: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w400),
                counterTextStyle: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w400),
                recordIconBackGroundColor: transparent,
                recordIconWhenLockBackGroundColor: transparent,
                recordIconWhenLockedRecord: const Icon(FontAwesome.stop_solid, color: white, size: 20),
                counterBackGroundColor: transparent,
                lockButton: const Icon(FontAwesome.microphone_solid, color: white, size: 20),
                sendButtonIcon: const Icon(FontAwesome.microphone_solid, color: white, size: 20),
                cancelTextBackGroundColor: transparent,
                backGroundColor: transparent,
                recordIcon: const Icon(FontAwesome.microphone_solid, color: white, size: 20),
                maxRecordTimeInSecond: 120,
                sendRequestFunction: (File soundFile, String time) async {
                  try {
                    final String id = List<int>.generate(20, (int index) => Random().nextInt(10)).join();
                    await FirebaseStorage.instance.ref().child("/audios/$id.aac").putFile(soundFile, SettableMetadata(contentType: lookupMimeType(soundFile.path)!)).then(
                      (TaskSnapshot snap) async {
                        final AudioMessageModel message = AudioMessageModel(
                          uid: _uid,
                          createdAt: DateTime.now().millisecondsSinceEpoch,
                          name: "$id.aac",
                          size: await soundFile.length(),
                          content: await snap.ref.getDownloadURL(),
                          duration: timeStringToDuration(time),
                          mimeType: lookupMimeType(soundFile.path)!,
                        );
                        await FirebaseFirestore.instance.collection("chats").doc(_uid).collection("messages").add(message.toJson());
                      },
                    );
                  } catch (e) {
                    showToast(e.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null && result.files.single.path != null) {
      final String id = List<int>.generate(20, (int index) => Random().nextInt(10)).join();
      showToast("Espere por favor");
      await FirebaseStorage.instance.ref().child("/files/${id}__${result.files.single.name}").putFile(File(result.files.single.path!), SettableMetadata(contentType: lookupMimeType(result.files.single.path!)!)).then(
        (TaskSnapshot snap) async {
          final FileMessageModel message = FileMessageModel(
            uid: _uid,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            mimeType: lookupMimeType(result.files.single.path!)!,
            name: "${id}__${result.files.single.name}",
            size: result.files.single.size,
            content: await snap.ref.getDownloadURL(),
          );
          await FirebaseFirestore.instance.collection("chats").doc(_uid).collection("messages").add(message.toJson());
        },
      );
    }
  }

  void _handleImageSelection() async {
    final XFile? result = await ImagePicker().pickImage(imageQuality: 70, source: ImageSource.gallery);
    if (result != null) {
      final Uint8List bytes = await result.readAsBytes();
      final String id = List<int>.generate(20, (int index) => Random().nextInt(10)).join();
      showToast("Espere por favor");
      await FirebaseStorage.instance.ref().child("/images/${id}__${result.name}").putFile(File(result.path), SettableMetadata(contentType: lookupMimeType(result.path)!)).then(
        (TaskSnapshot snap) async {
          final ImageMessageModel message = ImageMessageModel(
            uid: _uid,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            name: "${id}__${result.name}",
            size: bytes.length,
            content: await snap.ref.getDownloadURL(),
            mimeType: lookupMimeType(result.path)!,
          );
          await FirebaseFirestore.instance.collection("chats").doc(_uid).collection("messages").add(message.toJson());
        },
      );
    }
  }

  void _handleMessageTap(Map<String, dynamic> message) async {
    if (message['type'] == "file") {
      String localPath = message['content'];
      if (message['content'].startsWith('http')) {
        final Client client = Client();
        final Response request = await client.get(Uri.parse(message['content']));
        final Uint8List bytes = request.bodyBytes;
        final String documentsDir = (await getApplicationDocumentsDirectory()).path;
        localPath = '$documentsDir/${message['name']}';

        if (!File(localPath).existsSync()) {
          final File file = File(localPath);
          await file.writeAsBytes(bytes);
        }
      }
      await Clipboard.setData(ClipboardData(text: message['content']));
      showToast("URL del archivo copiada al portapapeles");
      await OpenFilex.open(localPath);
    } else if (message['type'] == "text") {
      await Clipboard.setData(ClipboardData(text: message['content']));
      showToast("Texto copiado al portapapeles");
    } else if (message['type'] == "image") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Stack(
              children: <Widget>[
                InteractiveViewer(alignment: Alignment.center, minScale: 1, child: Image.network(message['content'], fit: BoxFit.cover, width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height)),
                Positioned(top: 36, child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(FontAwesome.chevron_left_solid, size: 20, color: Colors.green))),
              ],
            ),
          ),
        ),
      );
      await Clipboard.setData(ClipboardData(text: message['content']));
      showToast("URL de la imagen copiada al portapapeles");
    }
  }

  void _handleSendPressed() async {
    final textMessage = TextMessageModel(uid: _uid, createdAt: DateTime.now().millisecondsSinceEpoch, content: _inputController.text.trim());
    _inputController.clear();
    _sendButtonKey.currentState!.setState(() {});
    await FirebaseFirestore.instance.collection("chats").doc(_uid).collection("messages").add(textMessage.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: transparent,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white)),
          title: const Text("Customer Service", style: TextStyle(color: white, fontSize: 16)),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: FirestoreListView(
                reverse: true,
                padding: const EdgeInsets.all(16),
                loadingBuilder: (BuildContext context) => const LoadingScreen(),
                query: FirebaseFirestore.instance.collection("chats").doc(_uid).collection("messages").orderBy("createdAt", descending: true),
                emptyBuilder: (BuildContext context) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      LottieBuilder.asset("assets/lotties/empty.json", width: 200, height: 200),
                      const SizedBox(height: 10),
                      const Text("EMPTY CONVERSATION", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: white)),
                    ],
                  ),
                ),
                errorBuilder: (BuildContext context, Object error, StackTrace stackTrace) => RedScreenOfDeath(error: error.toString()),
                itemBuilder: (BuildContext context, QueryDocumentSnapshot<Map<String, dynamic>> doc) {
                  final Map<String, dynamic> data = doc.data();
                  if (data["type"] == "audio") {
                    _audios.add(
                      VoiceController(
                        audioSrc: data["content"],
                        maxDuration: Duration(milliseconds: data["duration"]),
                        isFile: false,
                        onComplete: () {},
                        onPause: () {},
                        onPlaying: () {},
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () => _handleMessageTap(data),
                    onLongPress: data['uid'] != _uid
                        ? null
                        : () async {
                            await showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) => SafeArea(
                                child: SizedBox(
                                  height: 145,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      for (final Map<String, dynamic> item in _deletions)
                                        InkWell(
                                          hoverColor: transparent,
                                          splashColor: transparent,
                                          highlightColor: transparent,
                                          onTap: () => item["title"] == "REMOVE" ? item["callback"](context, doc, data) : item["callback"](),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(item["icon"], size: 15, color: white),
                                              const SizedBox(height: 10),
                                              Text(item["title"], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w400)),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                    child: (data["type"] == "text")
                        ? Align(
                            alignment: data["uid"] == _uid ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .7),
                              decoration: BoxDecoration(color: data["uid"] == _uid ? white : const Color.fromARGB(255, 200, 200, 200), borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(8),
                              child: Text(data["content"], style: const TextStyle(fontSize: 16, color: black, fontWeight: FontWeight.w400)),
                            ),
                          )
                        : (data["type"] == "image")
                            ? Align(
                                alignment: data["uid"] == _uid ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(5), border: Border.all(color: white, width: 2)),
                                  child: CachedNetworkImage(imageUrl: data["content"], width: 200, height: 350, fit: BoxFit.cover),
                                ),
                              )
                            : (data["type"] == "audio")
                                ? Align(
                                    alignment: data["uid"] == _uid ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: white, width: 2)),
                                      child: VoiceMessageView(
                                        isSender: data["uid"] == _uid,
                                        backgroundColor: transparent,
                                        activeSliderColor: white,
                                        circlesColor: grey,
                                        notActiveSliderColor: transparent,
                                        controller: _audios.last,
                                        innerPadding: 4,
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment: data["uid"] == _uid ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                                    child: Container(
                                      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .7),
                                      padding: const EdgeInsets.all(16),
                                      margin: const EdgeInsets.symmetric(vertical: 8),
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(15),
                                          bottomRight: Radius.circular(data["uid"] == _uid ? 0 : 15),
                                          bottomLeft: Radius.circular(data["uid"] == _uid ? 15 : 0),
                                          topRight: const Radius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Icon(FontAwesome.file, size: 15, color: white),
                                          const SizedBox(width: 10),
                                          Flexible(child: Text(data["name"], style: const TextStyle(color: white))),
                                        ],
                                      ),
                                    ),
                                  ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: white.withOpacity(.3),
                border: Border.all(color: white),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(onPressed: _handleAttachmentPressed, icon: const Icon(FontAwesome.folder_solid, size: 15, color: white)),
                  Flexible(
                    child: TextField(
                      controller: _inputController,
                      onChanged: (String value) {
                        if (_inputController.text.trim().length <= 1) {
                          _sendButtonKey.currentState!.setState(() {});
                        }
                      },
                      decoration: const InputDecoration(border: InputBorder.none, hintText: "Type Something...", hintStyle: TextStyle(color: white)),
                    ),
                  ),
                  StatefulBuilder(
                    key: _sendButtonKey,
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return AnimatedOpacity(
                        opacity: _inputController.text.trim().isEmpty ? 0 : 1,
                        duration: 500.ms,
                        child: IconButton(
                          onPressed: _inputController.text.trim().isEmpty ? null : _handleSendPressed,
                          icon: const Icon(FontAwesome.paper_plane, size: 15, color: white),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
