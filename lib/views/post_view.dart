import '../controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Products API',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen.shade600,
        scrolledUnderElevation: 0,
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              shadowColor: Colors.black.withOpacity(1),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    post.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  post.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price: \$${post.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Category: ${post.category}',
                      style: TextStyle(
                        color: Colors.lightGreen.shade800,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.lightGreen,
                  size: 18,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
