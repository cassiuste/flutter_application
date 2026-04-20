class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(5);
    ).then((value) => {
      Navigator.pushReplacementNamed(context, Routes.login),
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const SizedBox(height:50),
              SizedBox(
                height: 200,
                child: Stack(
                  children: Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  Center(child: Text("Cargando..."))
                ),
              ),
              ),
              ),
            },
}
