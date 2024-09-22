import 'package:chatbox/features/chat/widgets/svg_icon_botton.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});
  static const String id = 'qrcode_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
        centerTitle: true,
        leading: SvgIconButton(
            svgIcon: Assets.svgsBackArrow,
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
          child: Card(
        child: Padding(
          padding: EdgeInsets.all(SizeConfing.defaultSize! * 2),
          child: Card(
            color: Theme.of(context).colorScheme.primary,
            child: QrImageView(
              data: 'Ahmed',
              version: 5,
              size: SizeConfing.defaultSize! * 20,
            ),
          ),
        ),
      )),
    );
  }
}
