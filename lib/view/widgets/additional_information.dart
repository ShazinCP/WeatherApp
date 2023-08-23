import 'package:flutter/material.dart';

  TextStyle titleFont = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

Widget additionalInformation(
    String wind, String humidity, String pressure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wind",
                  style: titleFont
                ),
                const SizedBox(height: 18.0),
                Text(
                  "pressure",
                  style: titleFont,
                  )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wind,
                  style: titleFont
                ),
                const SizedBox(height: 18.0),
                Text(
                 pressure,
                  style: titleFont,
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Humidity",
                  style: titleFont
                ),
                const SizedBox(height: 18.0),
                Text(
                  "Feels Lke",
                  style: titleFont,
                  )
              ],
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  humidity,
                  style: titleFont
                ),
                const SizedBox(height: 18.0),
                Text(
                  feels_like,
                  style: titleFont,
                  )
              ],
            )
          ],
        )
      ],
    ),
  );
}
