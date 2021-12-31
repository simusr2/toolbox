import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final paddding = const EdgeInsets.symmetric(horizontal: 20.0);
  @override
  Widget build(BuildContext context) {
    const double normalSizedBoxHeight = 48.0;
    const double smallSizedBoxHeight = 16.0;
    const double dividerSizedBoxHeight = 24.0;

    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: paddding, // TODO: valutare rimozione padding
          children: <Widget>[
            const SizedBox(height: normalSizedBoxHeight),
            buildMenuItem(
              text: 'People',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: smallSizedBoxHeight),
            buildMenuItem(
              text: 'Favourites',
              icon: Icons.favorite_border,
            ),
            const SizedBox(height: smallSizedBoxHeight),
            buildMenuItem(
              text: 'Workflow',
              icon: Icons.workspaces_outline,
            ),
            const SizedBox(height: smallSizedBoxHeight),
            buildMenuItem(
              text: 'Updates',
              icon: Icons.update,
            ),
            const SizedBox(height: dividerSizedBoxHeight),
            const Divider(color: Colors.white70),
            const SizedBox(height: dividerSizedBoxHeight),
            buildMenuItem(
              text: 'Plugins',
              icon: Icons.account_tree_outlined,
            ),
            const SizedBox(height: smallSizedBoxHeight),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notifications_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const Color color = Colors.white;
    const Color hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PeoplePage(),
        ));
        break;
    }
    //Navigator.of(context).pop();
  }
}
