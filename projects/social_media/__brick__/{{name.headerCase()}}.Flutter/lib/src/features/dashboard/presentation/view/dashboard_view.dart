import 'package:{{name.snakeCase()}}/imports_bindings.dart';

///* This class contains dashbpard screen
///*eg : Pages manager , bottom nav ...
class DashBoardView extends StatefulWidget {
  ///*
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  late final List<IconData> _icons;
  late final List<Widget> _pages;
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    NotificationServices.handlePermission();
    _icons = [
      Icons.home_filled,
      Icons.upload_file,
      Icons.person,
    ];
    _pages = const [
      HomeView(),
      UploadView(),
      ProfileView(),
    ];
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              [
                context.lang.home,
                context.lang.upload,
                context.lang.profile,
              ][state.navIndex],
              style: AppStyles.text16Px.interSemiBold,
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(Icons.menu),
            ),
          ),
          drawer: const DrawerView(),
          body: _pages[state.navIndex],
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _icons.length,
              (i) => IconButton(
                onPressed: () => context.read<DashboardCubit>().changeNav(index: i),
                icon: Icon(
                  _icons[i],
                  color: switch (state.navIndex == i) {
                    true => IconTheme.of(context).color,
                    false => IconTheme.of(context).color?.withOpacity(0.4),
                  },
                ),
              ),
            ),
          ).pxy(y: 12),
        );
      },
    );
  }
}
