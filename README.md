# Projeto de Teste Pilar

Este é um projeto Flutter construído na versão "3.22.2". O projeto está configurado para trabalhar com o FVM (Flutter Version Management) para facilitar a gestão de versões do Flutter.

## Requisitos

- Flutter 3.22.2
- FVM

## Instalação do FVM

Para instalar o FVM, siga os seguintes passos:

1. **Instalação do FVM via pub:**

   ```bash
   dart pub global activate fvm
   ```

2. **Adicionar o FVM ao PATH:**

   No Linux ou macOS, adicione a seguinte linha ao seu arquivo `.bashrc`, `.zshrc` ou similar:

   ```bash
   export PATH="$PATH":"$HOME/.pub-cache/bin"
   ```

   No Windows, adicione o caminho ao sistema:

   ```
   C:\Users\<seu_usuario>\AppData\Local\Pub\Cache\bin
   ```

3. **Verificar a instalação:**

   Execute o seguinte comando para verificar se o FVM foi instalado corretamente:

   ```bash
   fvm
   ```

## Estrutura do Projeto

O projeto está estruturado utilizando a Clean Architecture. A Clean Architecture divide o código em camadas bem definidas, facilitando a manutenção e a escalabilidade. Cada camada possui seus próprios testes unitários.

### Camadas do Projeto

1. **Presentation Layer:**

- Contém as views, stores, controllers e widgets.

2. **Domain Layer:**

- Contém as entidades, casos de uso e interfaces dos repositórios.

3. **Data Layer:**

- Responsável pela implementação dos repositórios e casos de uso e interfaces dos datasources.

4. **Infra Layer:**

- Responsável pela implementação dos datasources e fontes de dados (APIs, banco de dados, etc).

## Testes Unitários

Para executar todos os testes unitários do projeto, utilize o comando:

```bash
fvm flutter test
```

## Testes Integrados

O projeto também implementa testes integrados utilizando a biblioteca `integration_tests` do Flutter. Para executar os testes integrados, utilize o comando:

```bash
fvm flutter test integration_test/integration_test.dart
```

## Considerações Finais

Certifique-se de que todas as dependências estejam instaladas e que o ambiente esteja configurado corretamente para evitar problemas na execução do projeto. Caso tenha dúvidas, consulte a documentação oficial do Flutter e do FVM, e também poderá me encaminhar quaisquer dúvidas.
