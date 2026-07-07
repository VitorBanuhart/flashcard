import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      // 1. ELEVAÇÃO: Controla o tamanho da sombra gerada (dá o efeito 3D)
      elevation: 8.0,

      // 2. MARGEM: Espaçamento externo para o card não grudar nas bordas da tela
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

      // 3. FORMATO: Customiza o arredondamento (o padrão é bem suave, aqui deixamos mais redondo)
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

      // 4. COR: Você pode alterar a cor de fundo do card, se quiser
      color: Theme.of(context).colorScheme.surface,

      child: Padding(
        // Espaçamento interno para os textos não grudarem na borda do Card
        padding: const EdgeInsets.all(24.0),
        child: Column(
          // mainAxisSize.min faz o Card ocupar apenas a altura necessária para o conteúdo
          mainAxisSize: MainAxisSize.min,
          children: [
            // Foto de Perfil
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            const SizedBox(height: 16.0),

            // Nome
            const Text(
              'João da Silva',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),

            // Profissão
            const Text(
              'Desenvolvedor Flutter',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 16.0),
            const Divider(), // Linha divisória charmosa
            // Informações de Contato usando ListTile
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.deepPurple),
              title: const Text('+55 (11) 99999-9999'),
              // Remove o espaçamento padrão do ListTile para ficar mais compacto
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.deepPurple),
              title: const Text('joao.silva@email.com'),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
