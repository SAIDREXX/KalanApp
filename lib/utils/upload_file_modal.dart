import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kalanapp/constants/colors.dart';

class UploadFileModal extends StatefulWidget {
  const UploadFileModal({super.key});

  @override
  State<UploadFileModal> createState() => _UploadFileModalState();
}

class _UploadFileModalState extends State<UploadFileModal> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        width: width / 1.1,
        height: height / 3,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: ColorConstants.jazPalette4,
          borderRadius: BorderRadius.circular(32),
          image: const DecorationImage(
              image: AssetImage('assets/MayanBackground5.png'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Cargar Documento',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              SizedBox(
                width: width / 1.4,
                height: 160,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.jazPalette4,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                        color: ColorConstants.jazPalette1,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: ColorConstants.jazPalette1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cargar Documento',
                          style: TextStyle(
                            color: ColorConstants.jazPalette1,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );
                    if (result != null) {
                      PlatformFile file = result.files.first;
                      print(file.name);
                      print(file.bytes);
                      print(file.size);
                      print(file.extension);
                      print(file.path);
                    } else {
                      // User canceled the picker
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
