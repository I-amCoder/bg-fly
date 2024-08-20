import 'package:bg_fly/Views/Widgets/privacy_policy.dart';
import 'package:bg_fly/Views/Widgets/terms.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key, required this.child});

  final Widget child;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: Color(0XFFF5F5F5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: widget.child,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _showMarkdownModal(context, PrivacyPolicy()),
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                        fontSize: 11, color: Color.fromARGB(255, 68, 66, 66)),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      _showMarkdownModal(context, TermsConditions()),
                  child: const Text(
                    "Terms & Conditions",
                    style: TextStyle(
                        fontSize: 11, color: Color.fromARGB(255, 68, 66, 66)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showMarkdownModal(BuildContext context, Widget page) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: page,
        );
      },
    );
  }
}
