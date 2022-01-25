import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolbox/model/navigation_item.dart';
import 'package:toolbox/provider/navigation_provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final paddding = const EdgeInsets.symmetric(horizontal: 20.0);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double itemSeparatorSizedBoxHeight = 8.0;
    const String name = '🛠 Toolbox';

    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
                name: name,
                onClicked: () {
                  selectItem(context, NavigationItem.home);
                }),
            Container(
              padding: paddding,
              child: Column(
                children: [
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.home,
                    text: 'Home',
                    icon: Icons.home_outlined,
                  ),
                  const SizedBox(height: itemSeparatorSizedBoxHeight),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.networkInfo,
                    text: 'Network info',
                    icon: Icons.network_check_outlined,
                  ),
                  const SizedBox(height: itemSeparatorSizedBoxHeight),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.speedtest,
                    text: 'Speedtest',
                    icon: Icons.downloading,
                  ),
                  const Divider(color: Colors.white70),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.stringBase64,
                    text: 'String - Base64',
                    icon: Icons.text_format,
                  ),
                  const SizedBox(height: itemSeparatorSizedBoxHeight),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.stringLength,
                    text: 'String - Length',
                    icon: Icons.text_fields,
                  ),
                  const Divider(color: Colors.white70),
                  buildMenuItem(
                    context,
                    navigationItem: NavigationItem.info,
                    text: 'Info',
                    icon: Icons.info_outline,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader({required String name, required VoidCallback onClicked}) {
    return InkWell(
      onTap: onClicked,
      child: Container(
          padding: paddding.add(const EdgeInsets.only(bottom: 16.0)),
          child: Text(name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500))),
    );
  }

  // TODO create a search page/functionality
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
    const Color color = Colors.white;
    const Color hoverColor = Colors.white70;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        selected: isSelected,
        tileColor: Colors.green,
        selectedTileColor: Colors.red[600],
        textColor: Colors.white,
        selectedColor: Colors.white,
        leading: Icon(icon, color: color),
        title: Text(text, style: const TextStyle(fontSize: 16)),
        hoverColor: hoverColor,
        //onTap: onClicked,
        onTap: () => selectItem(context, navigationItem),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final NavigationProvider provider =
        Provider.of<NavigationProvider>(context, listen: false);

    provider.navigationItem = item;
  }
}
