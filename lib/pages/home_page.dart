import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guga_portfolio/pages/body/body_about.dart';
import 'package:guga_portfolio/pages/body/body_contact.dart';
import 'package:guga_portfolio/pages/cubits/cubit/home_tabs_cubit.dart';
import 'package:guga_portfolio/widgets/scroll_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeTabsCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = context.read<HomeTabsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(
      height: MediaQuery.sizeOf(context).height / 6,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1C1E),
        title: Text(
          'GugaLabs',
          style: GoogleFonts.urbanist(color: const Color(0xff38b6ff)),
        ),
        // title: BlocBuilder<HomeTabsCubit, HomeTabsState>(
        //   bloc: cubit,
        //   builder: (context, state) {
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         ...List.generate(
        //           (state as HomeTabsInitial).headers.length,
        //           (i) => InkWell(
        //             onTap: () => cubit.onChanged(i),
        //             child: Text(
        //               (state).headers[i],
        //               style: GoogleFonts.museoModerno(
        //                 color: (state).currentHeader == i
        //                     ? const Color(0xff38b6ff)
        //                     : Colors.white,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: ShadowWidget(
        //       text: '',
        //       child: TextButton.icon(
        //         iconAlignment: IconAlignment.end,
        //         onPressed: () {},
        //         icon: const Icon(
        //           Icons.chevron_right_rounded,
        //         ),
        //         label: const Text(
        //           'EN',
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: const Color(0xff1C1C1E),
        child: ScrollBarWidget(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ColoredBox(
                  color: Color(0xff1C1C1E),
                  child: BodyAbout(),
                ),
                space,
                space,
                space,
                const BodyContact(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
