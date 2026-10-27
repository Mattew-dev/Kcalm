import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {

  final IconData icona;
  final String titolo;
  final String descrizione;
  final bool selezionata;
  final VoidCallback onTap; // è una funz. senza parametri: "cosa fa quando la tocchi"

  const GoalCard({
    super.key,
    required this.icona,
    required this.titolo,
    required this.descrizione,
    required this.selezionata,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final colori = Theme.of(context).colorScheme;
    final stili = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      color: selezionata ? colori.primaryContainer: colori.surfaceContainerLowest,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: selezionata ? colori.primary : colori.outline,
          width: selezionata ? 2:1
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icona, color: colori.primary, size: 32),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titolo, style: stili.titleMedium),
                      Text(descrizione, style: stili.bodyMedium)
                    ],
                  ),
              )
            ],
          )
        ),
      ),
    );
  }
}
