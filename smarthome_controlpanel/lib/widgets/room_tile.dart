import 'package:flutter/material.dart';

class RoomTile extends StatelessWidget {
  final Map<String, dynamic> room;
  final Function(String, String) onToggle;

  const RoomTile({super.key, required this.room, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final Color color = (room['color'] ?? Colors.grey);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color, width: 2),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          iconColor: Colors.black,
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.8),
            child: Icon(room['icon'], color: Colors.white),
          ),
          title: Text(
            room['name'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: room['devices'].map<Widget>((device) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: device['isOn']
                          ? color.withOpacity(0.8)
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                  ),
                  child: SwitchListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),
                    title: Text(
                      device['name'],
                      style: TextStyle(
                        fontSize: 16,
                        color: device['isOn']
                            ? Colors.black
                            : Colors.grey.shade600,
                      ),
                    ),
                    value: device['isOn'],
                    activeColor: color,
                    onChanged: (_) => onToggle(room['name'], device['name']),
                    secondary: Icon(
                      device['isOn'] ? Icons.toggle_on : Icons.toggle_off,
                      color: device['isOn']
                          ? color.withOpacity(0.9)
                          : Colors.grey.shade400,
                      size: 32,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
