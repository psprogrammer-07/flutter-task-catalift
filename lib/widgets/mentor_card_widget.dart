import 'package:flutter/material.dart';

class MentorCardWidget extends StatelessWidget {
  final String imagepath;
  final String name;
  final double rating;
  final String sector;
  final String experience;
  final String reviews;
  final String description;
  final int compatibility;

  const MentorCardWidget({
    super.key,
    required this.imagepath,
    required this.name,
    required this.rating,
    required this.sector,
    required this.experience,
    required this.reviews,
    required this.description,
    required this.compatibility,
  });

  static const Color primaryColor = Color(0xFF0A004A); // Dark blue
  static const Color textLightColor = Colors.grey; // For less prominent text
  static const Color sectorChipColor = Color(0xFFFFF3E0); // Light orange for IT Sector chip
  static const Color sectorChipTextColor = Color(0xFFE65100); // Dark orange for IT Sector text

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  // Use Image.asset for local images
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0), // Adjust radius to match CircleAvatar size
                    child: Image.asset(
                      imagepath,
                      width: 80.0, // Adjust size to match CircleAvatar size
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4.0),
                          Text(
                            rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 8.0),
                          Chip(
                            label: Text(
                              sector,
                              style: const TextStyle(color: sectorChipTextColor, fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            backgroundColor: sectorChipColor,
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            labelPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: textLightColor, size: 14),
                          const SizedBox(width: 4.0),
                          Text(experience, style: TextStyle(color: textLightColor, fontSize: 12)),
                          const SizedBox(width: 12.0),
                          Icon(Icons.business_center_outlined, color: textLightColor, size: 14),
                          const SizedBox(width: 4.0),
                          // Assuming 'Business Administration' is part of experience or a separate field
                          // For now, I'll use a placeholder or it can be combined with experience
                          Text('Business Administration', style: TextStyle(color: textLightColor, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 2.0),
                      Row(
                        children: [
                          Icon(Icons.rate_review_outlined, color: textLightColor, size: 14),
                          const SizedBox(width: 4.0),
                          Text(reviews, style: TextStyle(color: textLightColor, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              description,
              style: TextStyle(color: Colors.grey[700], fontSize: 13, height: 1.4),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$compatibility% compatibility',
                  style: TextStyle(
                    color: compatibility > 90 ? Colors.green.shade700 : (compatibility > 70 ? Colors.orange.shade700 : Colors.red.shade700),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // Optionally, add a button or action here if needed in the future
              ],
            ),
          ],
        ),
      ),
    );
  }
}