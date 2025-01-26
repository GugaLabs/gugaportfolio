import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guga_portfolio/colors.dart';
import 'package:guga_portfolio/pages/body/body_begin.dart';
import 'package:guga_portfolio/pages/body/body_contact.dart';
import 'package:guga_portfolio/pages/body/body_team.dart';
import 'package:guga_portfolio/pages/cubits/cubit/home_tabs_cubit.dart';
import 'package:guga_portfolio/pages/animations/particle_widget.dart';
import 'package:guga_portfolio/widgets/scroll_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeTabsCubit cubit;
  final ScrollController _scrollController = ScrollController();

  final Map<int, GlobalKey> _sectionKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };

  final List<String> _menuItems = [
    'Início',
    'Sobre nós',
    'Nossos Projetos',
    'Contato',
  ];

  final List<Widget> _sections = const [
    BodyBegin(),
    BodyAboutUs(),
    BodyContact(),
    BodyContact(),
  ];

  @override
  void initState() {
    super.initState();
    cubit = context.read<HomeTabsCubit>();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i]?.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          if (position.dy <= MediaQuery.of(context).size.height / 3) {
            cubit.onChanged(i);
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(
      height: MediaQuery.sizeOf(context).height / 6,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.black87,
        title: BlocBuilder<HomeTabsCubit, HomeTabsState>(
          bloc: cubit,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_menuItems.length, (index) {
                return GestureDetector(
                  onTap: () => _scrollToSection(index),
                  child: Text(
                    _menuItems[index],
                    style: GoogleFonts.museoModerno(
                      color: (state as HomeTabsInitial).currentHeader == index
                          ? ColorsApp.primary
                          : Colors.white,
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
      body: ParticlesBackground(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          color: ColorsApp.black87,
          child: ScrollBarWidget(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: List.generate(
                  _sections.length,
                  (index) => ColoredBox(
                    key: _sectionKeys[index],
                    color: ColorsApp.black87,
                    child: Column(
                      children: [
                        space,
                        _sections[index],
                        space,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
