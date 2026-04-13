import 'dart:io';

class Livro {
  int id;
  String titulo;
  String autor;

  Livro(this.id, this.titulo, this.autor);

  @override
  String toString() {
    return 'ID: $id | Título: $titulo | Autor: $autor';
  }
}

class Biblioteca {
  List<Livro> _livros = [];
  int _contadorId = 1;

  void criarLivro(String titulo, String autor) {
    _livros.add(Livro(_contadorId++, titulo, autor));
    print('Livro cadastrado com sucesso');
  }

  void listarLivros() {
    if (_livros.isEmpty) {
      print('Nenhum livro cadastrado');
      return;
    }
    for (var livro in _livros) {
      print(livro);
    }
  }

  void atualizarLivro(int id, String titulo, String autor) {
    for (var livro in _livros) {
      if (livro.id == id) {
        livro.titulo = titulo;
        livro.autor = autor;
        print('Livro atualizado com sucesso');
        return;
      }
    }
    print('Livro não encontrado');
  }

  void deletarLivro(int id) {
    _livros.removeWhere((l) => l.id == id);
    print('Livro removido com sucesso');
  }
}

void main() {
  var biblioteca = Biblioteca();

  while (true) {
    print('\n1 - Criar');
    print('2 - Listar');
    print('3 - Atualizar');
    print('4 - Deletar');
    print('0 - Sair');

    var opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print('Título:');
        var titulo = stdin.readLineSync()!;
        print('Autor:');
        var autor = stdin.readLineSync()!;
        biblioteca.criarLivro(titulo, autor);
        break;

      case '2':
        biblioteca.listarLivros();
        break;

      case '3':
        print('ID:');
        var id = int.parse(stdin.readLineSync()!);
        print('Novo título:');
        var titulo = stdin.readLineSync()!;
        print('Novo autor:');
        var autor = stdin.readLineSync()!;
        biblioteca.atualizarLivro(id, titulo, autor);
        break;

      case '4':
        print('ID:');
        var id = int.parse(stdin.readLineSync()!);
        biblioteca.deletarLivro(id);
        break;

      case '0':
        exit(0);

      default:
        print('Opção inválida');
    }
  }
}