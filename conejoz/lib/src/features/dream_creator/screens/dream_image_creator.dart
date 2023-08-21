import 'dart:ffi';

import 'package:conejoz/src/controllers/dream_image_creator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageCreator extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  ImageCreator({super.key});
  @override
  Widget build(BuildContext context) {
    final DreamImageCreatorController imageCreatorController = Get.find();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Image Creator",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          leading: IconButton(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onError,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset.fromDirection(-8, 20)),
                      ],
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 361, // Set the height to be equal to the width
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Obx(() {
                            if (imageCreatorController.isLoading) {
                              return const CircularProgressIndicator();
                            } else if (imageCreatorController.imageUrl !=
                                null) {
                              return Image.network(
                                  imageCreatorController.imageUrl!);
                            } else {
                              return const SizedBox.shrink();
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Write the prompt here.',
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await imageCreatorController
                .createImage(_textEditingController.text);
          },
          child: const Icon(Icons.new_releases),
        ));
  }
}
