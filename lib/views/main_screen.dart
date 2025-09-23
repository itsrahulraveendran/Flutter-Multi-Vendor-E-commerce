import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:inktee_web/views/side_bar_screen/buyer_screen.dart';
import 'package:inktee_web/views/side_bar_screen/category_screen.dart';
import 'package:inktee_web/views/side_bar_screen/order_screen.dart';
import 'package:inktee_web/views/side_bar_screen/product_screen.dart';
import 'package:inktee_web/views/side_bar_screen/upload_screen.dart';
import 'package:inktee_web/views/side_bar_screen/vendor_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = VendorScreen();

  screenSelector(item) {
    switch (item.route) {
      case BuyerScreen.id:
        setState(() {
          _selectedScreen = BuyerScreen();
        });
        break;
      case VendorScreen.id:
        setState(() {
          _selectedScreen = VendorScreen();
        });
        break;
      case CategoryScreen.id:
        setState(() {
          _selectedScreen = CategoryScreen();
        });
        break;
      case OrderScreen.id:
        setState(() {
          _selectedScreen = OrderScreen();
        });
        break;
      case UploadScreen.id:
        setState(() {
          _selectedScreen = UploadScreen();
        });
        break;
      case ProductScreen.id:
        setState(() {
          _selectedScreen = ProductScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Management")),
      body: _selectedScreen,

      sideBar: SideBar(
        header: Container(
          height: 50,
          width: double.infinity,
          color: Colors.black,
          child: Center(
            child: Text(
              "Inktee",
              style: TextStyle(color: Colors.white, fontSize: 20,letterSpacing: 1.7),
            ),
          ),
        ),
        items: [
          AdminMenuItem(
            title: "Vendors",
            route: VendorScreen.id,
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: "Buyers",
            route: BuyerScreen.id,
            icon: CupertinoIcons.person,
          ),
          AdminMenuItem(
            title: "Orders",
            route: OrderScreen.id,
            icon: CupertinoIcons.shopping_cart,
          ),
          AdminMenuItem(
            title: "Categories",
            route: CategoryScreen.id,
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: "Upload Banner",
            route: UploadScreen.id,
            icon: CupertinoIcons.add,
          ),
          AdminMenuItem(
            title: "Products",
            route: ProductScreen.id,
            icon: Icons.inventory,
          ),
        ],
        selectedRoute: VendorScreen.id,
        onSelected: (item) {
          screenSelector(item);
        },
      ),
    );
  }
}
