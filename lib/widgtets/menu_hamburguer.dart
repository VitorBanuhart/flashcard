import 'package:flutter/material.dart';

class MenuHamburguer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0), // Dá um espacinho da borda
      child: PopupMenuButton<String>(
        // Usamos o CircleAvatar como o "ícone" clicável do menu
        icon: const CircleAvatar(
          // Aqui você coloca a URL da imagem do usuário
          backgroundImage: NetworkImage('https://picsum.photos/200'),
          // Dica: Se o usuário ainda não tiver foto, você pode usar um ícone padrão assim:
          // child: Icon(Icons.person),
        ),
        onSelected: (String result) {
          // Aqui você define o que acontece quando o usuário clica em uma opção
          print('Você clicou em: $result');
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Perfil',
            child: Text('Meu Perfil'),
          ),
          const PopupMenuItem<String>(
            value: 'Configuracoes',
            child: Text('Configurações'),
          ),
          const PopupMenuItem<String>(value: 'Sair', child: Text('Sair')),
        ],
      ),
    );
  }
}
