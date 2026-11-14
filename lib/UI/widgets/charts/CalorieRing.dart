import 'package:flutter/material.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';

class CalorieRing extends StatefulWidget {

  final int mangiate;
  final int totali;

  const CalorieRing({
    super.key,
    required this.mangiate,
    required this.totali
  });

  @override
  State<CalorieRing> createState() => _CalorieRingState();
}

class _CalorieRingState extends State<CalorieRing> with TickerProviderStateMixin{

  late final AnimationController _controller;
  late Animation<double> _progresso;

  double get _valoreFinale =>
      widget.totali > 0 ?
      (widget.mangiate / widget.totali).clamp(0,1).toDouble() : 0;

  @override
  void initState(){
    super.initState();

    //TickerProvider
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200)
    );
    _progresso = Tween<double>(
        begin: 0, end: _valoreFinale
    ).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOutCubic
      )
    );
    _controller.forward(); //si apre quando apro la pagina
  }

  /// cambiamento dei dati: riparto dal valore attuale
  @override
  void didUpdateWidget(CalorieRing vecchio){
    super.didUpdateWidget(vecchio);
    if(vecchio.mangiate != widget.mangiate || vecchio.totali != widget.totali){
      _progresso = Tween<double>(
          begin: _progresso.value, end: _valoreFinale
      ).animate(
          CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOutCubic
          )
      );
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colori=Theme.of(context).colorScheme;
    final stili=Theme.of(context).textTheme;

    return AnimatedBuilder(
        animation: _progresso,
        builder: (context, _){
          final rimanenti=widget.totali-(_progresso.value *widget.totali).round();
          return SizedBox(
            width: 220,
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: _progresso.value,
                    strokeWidth: 16,
                    strokeCap: StrokeCap.round,
                    color: colori.primary,
                    backgroundColor: colori.surfaceContainerHigh
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$rimanenti', style: stili.displaySmall),
                    Text(
                        AppLocalizations.of(context).translate('kcal_remaining'), 
                        style: stili.bodyMedium
                    )
                  ],
                ),
              ],
            ),
          );
        },
    );

  }
}
