import 'package:bg_fly/Controllers/home_cotroller.dart';
import 'package:bg_fly/Controllers/removebg_controller.dart';
import 'package:bg_fly/Models/image_model.dart';
import 'package:bg_fly/Views/BgRemoved/bg_removed.dart';
import 'package:bg_fly/Views/Widgets/gradient_button.dart';
import 'package:bg_fly/utils/enums.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bg_fly/Views/Home/Widgets/image_preview.dart';
import 'package:bg_fly/Views/styles/text_styles.dart';

class ImageUploader extends StatelessWidget {
  const ImageUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: const [10, 10],
            color: Colors.grey,
            strokeWidth: 4,
            padding: const EdgeInsets.all(8),
            child: Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () => controller.pickImage(),
                child: const ImagePreview(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        const Text(
          "Background Remover",
          style: titleStyle,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        GradientElevatedButton(
            onPressed: () => controller.pickImage(),
            child: Text(controller.isSelected ? "Change" : "Select")),
        Visibility(
          visible: controller.isSelected,
          child: Column(
            children: [
              GradientElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => RemoveBgController(
                          ImageModel(controller.image, RemovalType.manual),
                        ),
                        child: const BgRemoved(),
                      ),
                    ),
                  );
                },
                child: const Text("Manually Erase"),
              ),
              GradientElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => RemoveBgController(
                          ImageModel(controller.image, RemovalType.automatic),
                        ),
                        child: const BgRemoved(),
                      ),
                    ),
                  );
                },
                child: const Text("Remove Background"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
