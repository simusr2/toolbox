import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolbox/model/NavigationItem.dart';
import 'package:toolbox/page/FavouritesPage.dart';
import 'package:toolbox/page/PeoplePage.dart';
import 'package:toolbox/provider/NavigationProvider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final paddding = const EdgeInsets.symmetric(horizontal: 20.0);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double normalSizedBoxHeight = 48.0;
    const double smallSizedBoxHeight = 16.0;
    const double dividerSizedBoxHeight = 24.0;

    const String name = 'Simone';
    const String email = 'simone.com';
    const String urlImage =
        'https://avatars.githubusercontent.com/u/23080613?s=400&u=33f7fa84d6931941ba024cd06299ab791c774c30&v=4';

    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavouritesPage()));
                }),
            Container(
              padding: paddding,
              child: Column(
                children: [
                  const SizedBox(height: normalSizedBoxHeight),
                  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.people,
                    text: 'People',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: smallSizedBoxHeight),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.favourites,
                    text: 'Favourites',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: smallSizedBoxHeight),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.workflow,
                    text: 'Workflow',
                    icon: Icons.workspaces_outline,
                  ),
                  const SizedBox(height: smallSizedBoxHeight),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.updates,
                    text: 'Updates',
                    icon: Icons.update,
                  ),
                  const SizedBox(height: dividerSizedBoxHeight),
                  const Divider(color: Colors.white70),
                  const SizedBox(height: dividerSizedBoxHeight),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.plugins,
                    text: 'Plugins',
                    icon: Icons.account_tree_outlined,
                  ),
                  const SizedBox(height: smallSizedBoxHeight),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.notifications,
                    text: 'Notifications',
                    icon: Icons.notifications_outlined,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader(
      {required String urlImage,
      required String name,
      required String email,
      required VoidCallback onClicked}) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: paddding.add(const EdgeInsets.symmetric(vertical: 40.0)),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(urlImage),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              child: Icon(Icons.add_comment_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchField() {
    const Color color = Colors.white;
    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white30,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem navigationItem,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final NavigationProvider provider =
        Provider.of<NavigationProvider>(context);
    final NavigationItem currentItem = provider.navigationItem;
    final bool isSelected = currentItem == navigationItem;
    //const Color color = Colors.white;
    final Color color = isSelected ? Colors.orangeAccent : Colors.white;
    const Color hoverColor = Colors.white70;
    debugPrint("buildMenuItem: $navigationItem, $currentItem, $isSelected");
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ListTile(
          selected: isSelected,
          tileColor: Colors.green,
          selectedTileColor: Colors.red,
          textColor: Colors.white,
          selectedColor: Colors.orangeAccent,
          leading: Icon(icon, color: color),
          title: Text(text, style: const TextStyle(fontSize: 16)),
          hoverColor: hoverColor,
          //onTap: onClicked,
          onTap: () => selectItem(context, navigationItem),
        ),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final NavigationProvider provider =
        Provider.of<NavigationProvider>(context, listen: false);

    debugPrint(provider.navigationItem.toString());
    provider.navigationItem = item;
    debugPrint(provider.navigationItem.toString());
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const PeoplePage(key: PageStorageKey('people-page')),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const FavouritesPage(key: PageStorageKey('favourites-page')),
        ));
        break;
    }
    //Navigator.of(context).pop();
  }
}
