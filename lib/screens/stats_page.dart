import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/work_in_progress.png',
              width: MediaQuery.of(context).size.width*0.5,
            ),
            SizedBox(height: 16),
            Text(
              'We\'re working to bring\nyou this functionality!',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}