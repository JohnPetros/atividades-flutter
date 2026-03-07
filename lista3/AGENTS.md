# PRD — App de Exercícios de Persistência Local

### 1. Visão Geral

Este aplicativo é uma ferramenta de aprendizado prático voltada para o desenvolvimento de habilidades em persistência de dados local em dispositivos móveis. Cada tela representa um exercício independente que explora uma técnica de armazenamento diferente — arquivos JSON ou banco de dados SQLite — cobrindo casos de uso do mundo real: perfil de usuário, controle financeiro, registro de presença e gestão de estoque.

O objetivo principal é permitir que o desenvolvedor (usuário do app) pratique a leitura, escrita e recuperação de dados locais em cenários distintos, consolidando o aprendizado por meio de interfaces funcionais e completas.

---

### 2. Requisitos

---

#### Tela 1 — Perfil de Usuário

- [ ] **Formulário de Perfil**

**Descrição:** Interface que permite ao usuário inserir e salvar seu nome e e-mail localmente.

##### Regras de Negócio
- **Persistência:** Os dados devem ser salvos em um arquivo `.json` no armazenamento local do dispositivo.
- **Carregamento automático:** Ao abrir a tela, o app deve verificar se o arquivo JSON existe e, em caso positivo, pré-preencher os campos com os dados salvos.
- **Sobrescrita:** Ao salvar novamente, o arquivo existente deve ser sobrescrito com os novos valores.
- **Validação de e-mail:** O campo de e-mail deve aceitar apenas entradas no formato válido de e-mail (ex: `usuario@dominio.com`).
- **Campo obrigatório:** Nome e e-mail não podem ser salvos em branco.

##### Regras de UI/UX
- **Campos:** Campo de texto para Nome e campo de texto para E-mail (teclado tipo e-mail).
- **Botão de ação:** Botão "Salvar" que persiste os dados.
- **Feedback:** Exibir mensagem de sucesso após salvar. Exibir mensagem de erro se campos estiverem vazios ou e-mail inválido.
- **Estado inicial:** Se não houver dados salvos, os campos devem estar vazios.

---

#### Tela 2 — Gerenciador de Despesas

- [ ] **Cadastro e Listagem de Gastos**

**Descrição:** Interface para registrar despesas com descrição e valor, persistindo e recuperando os dados de um arquivo JSON.

##### Regras de Negócio
- **Persistência:** Todos os gastos devem ser armazenados em um único arquivo `.json` local, como um array de objetos.
- **Adição incremental:** Cada novo gasto é adicionado ao array existente no arquivo, sem substituir os anteriores.
- **Carregamento automático:** Ao abrir a tela, o app deve carregar e exibir todos os gastos já salvos no arquivo JSON.
- **Validação de valor:** O campo de valor deve aceitar apenas números positivos (decimais permitidos).
- **Campos obrigatórios:** Descrição e valor são obrigatórios para registrar um gasto.

##### Regras de UI/UX
- **Campos de entrada:** Campo de texto para Descrição e campo numérico para Valor.
- **Botão de ação:** Botão "Adicionar" que registra o gasto e atualiza a lista.
- **Listagem:** Exibir histórico de gastos salvos com descrição e valor formatado (ex: `R$ 45,00`).
- **Feedback:** Exibir mensagem de erro se campos estiverem vazios ou valor inválido.
- **Ordem de exibição:** Os gastos devem ser exibidos na ordem em que foram inseridos (mais recente ao topo).

---

#### Tela 3 — Registro de Frequência (Lista de Presença)

- [ ] **Cadastro e Listagem de Presenças**

**Descrição:** Interface que permite inserir nomes e visualizar a lista de presença, com persistência obrigatória em banco de dados SQLite.

##### Regras de Negócio
- **Persistência:** Os dados devem ser armazenados exclusivamente em um banco de dados SQLite local.
- **Tabela:** Deve existir uma tabela `presenca` (ou equivalente) com pelo menos o campo `nome`.
- **Carregamento automático:** Ao abrir a tela, todos os registros existentes no banco devem ser carregados e exibidos.
- **Inserção única por ação:** Cada clique em "Adicionar" insere um novo registro no banco.
- **Campo obrigatório:** O nome não pode ser inserido em branco.

##### Regras de UI/UX
- **Campo de entrada:** Campo de texto para Nome.
- **Botão de ação:** Botão "Adicionar" que insere o nome no banco e atualiza a lista.
- **Listagem:** Exibir todos os nomes cadastrados em uma lista.
- **Feedback:** Exibir mensagem de erro se o campo estiver vazio.

---

#### Tela 4 — Controle de Estoque

- [ ] **Cadastro e Listagem de Produtos**

**Descrição:** Interface para cadastrar produtos com nome e quantidade, utilizando SQLite para todas as operações de leitura e escrita.

##### Regras de Negócio
- **Persistência:** Os dados devem ser salvos e recuperados de um banco de dados SQLite local.
- **Tabela:** Deve existir uma tabela `estoque` (ou equivalente) com os campos `nome_produto` e `quantidade`.
- **Carregamento automático:** Ao abrir a tela, todos os itens cadastrados no banco devem ser carregados e exibidos.
- **Validação de quantidade:** O campo de quantidade deve aceitar apenas números inteiros positivos.
- **Campos obrigatórios:** Nome do produto e quantidade são obrigatórios.

##### Regras de UI/UX
- **Campos de entrada:** Campo de texto para Nome do Produto e campo numérico para Quantidade (teclado numérico).
- **Botão de ação:** Botão "Cadastrar" que salva o produto e atualiza a listagem.
- **Listagem:** Exibir os itens cadastrados com nome e quantidade.
- **Feedback:** Exibir mensagem de erro se campos estiverem vazios ou quantidade inválida.

---

### 3. Fluxo de Usuário (User Flow)

---

**Fluxo 1 — Perfil de Usuário**

1. O usuário abre o app e navega até a tela de Perfil.
2. O sistema verifica a existência do arquivo JSON local:
   - **Arquivo encontrado:** Os campos Nome e E-mail são pré-preenchidos com os dados salvos.
   - **Arquivo não encontrado:** Os campos são exibidos vazios.
3. O usuário edita os campos e toca em "Salvar".
4. O sistema valida os campos:
   - **Sucesso:** Dados são gravados no arquivo JSON e uma confirmação é exibida.
   - **Falha:** Mensagem de erro é exibida indicando o campo inválido.

---

**Fluxo 2 — Gerenciador de Despesas**

1. O usuário acessa a tela de Despesas.
2. O sistema carrega e exibe todos os gastos do arquivo JSON.
3. O usuário preenche os campos de Descrição e Valor e toca em "Adicionar".
4. O sistema valida os campos:
   - **Sucesso:** O novo gasto é adicionado ao arquivo JSON e a lista é atualizada.
   - **Falha:** Mensagem de erro é exibida.

---

**Fluxo 3 — Registro de Frequência**

1. O usuário acessa a tela de Presença.
2. O sistema consulta o banco SQLite e exibe todos os nomes registrados.
3. O usuário digita um nome e toca em "Adicionar".
4. O sistema valida o campo:
   - **Sucesso:** O nome é inserido no SQLite e a lista é atualizada.
   - **Falha:** Mensagem de erro é exibida.

---

**Fluxo 4 — Controle de Estoque**

1. O usuário acessa a tela de Estoque.
2. O sistema consulta o banco SQLite e exibe todos os produtos cadastrados.
3. O usuário preenche Nome do Produto e Quantidade e toca em "Cadastrar".
4. O sistema valida os campos:
   - **Sucesso:** O produto é inserido no SQLite e a listagem é atualizada.
   - **Falha:** Mensagem de erro é exibida indicando o campo inválido.

---

### 4. Fora do Escopo (Out of Scope)

- Autenticação ou login de usuário
- Sincronização de dados com servidor remoto ou nuvem
- Edição ou exclusão de registros já salvos (despesas, presenças, produtos)
- Exportação de dados (CSV, PDF, etc.)
- Notificações push ou lembretes
- Busca ou filtragem na listagem
- Paginação de listas
- Temas visuais ou modo escuro
- Suporte a múltiplos usuários no mesmo dispositivo

## Theme (JSON)

```json
{
  "fonts": {
    "primary": "google:Inter",
    "secondary": "google:JetBrains Mono"
  },
  "colors": {
    "light": {
      "primary": "#4FC3F7",
      "on_primary": "#0D1B2A",
      "secondary": "#8EACC8",
      "on_secondary": "#0D1B2A",
      "accent": "#F59E0B",
      "background": "#0D1B2A",
      "surface": "#1A2C42",
      "on_surface": "#E8F0F7",
      "primary_text": "#E8F0F7",
      "secondary_text": "#8EACC8",
      "hint": "#4A6A8A",
      "error": "#EF5350",
      "on_error": "#FFFFFF",
      "success": "#66BB6A",
      "divider": "#2A4A6B",
      "transparent": "#00000000"
    },
    "dark": {
      "primary": "#4FC3F7",
      "on_primary": "#0D1B2A",
      "secondary": "#8EACC8",
      "on_secondary": "#0D1B2A",
      "accent": "#F59E0B",
      "background": "#0D1B2A",
      "surface": "#1A2C42",
      "on_surface": "#E8F0F7",
      "primary_text": "#E8F0F7",
      "secondary_text": "#8EACC8",
      "hint": "#4A6A8A",
      "error": "#EF5350",
      "on_error": "#FFFFFF",
      "success": "#66BB6A",
      "divider": "#2A4A6B",
      "transparent": "#00000000"
    }
  },
  "text_styles": {
    "headline_large": {
      "font": "primary",
      "size": 32,
      "weight": 700,
      "height": 1.2
    },
    "headline_medium": {
      "font": "primary",
      "size": 26,
      "weight": 600,
      "height": 1.25
    },
    "title_large": {
      "font": "primary",
      "size": 20,
      "weight": 600,
      "height": 1.2
    },
    "title_medium": {
      "font": "primary",
      "size": 17,
      "weight": 600,
      "height": 1.3
    },
    "body_large": {
      "font": "secondary",
      "size": 16,
      "weight": 400,
      "height": 1.5
    },
    "body_medium": {
      "font": "secondary",
      "size": 15,
      "weight": 400,
      "height": 1.4
    },
    "body_small": {
      "font": "secondary",
      "size": 13,
      "weight": 400,
      "height": 1.4
    },
    "label_large": {
      "font": "primary",
      "size": 15,
      "weight": 600,
      "height": 1.3
    },
    "label_medium": {
      "font": "primary",
      "size": 13,
      "weight": 600,
      "height": 1.3
    },
    "label_small": {
      "font": "primary",
      "size": 11,
      "weight": 600,
      "height": 1.2
    }
  },
  "spacing": {
    "xs": 4,
    "sm": 8,
    "md": 16,
    "lg": 24,
    "xl": 32
  },
  "radii": {
    "sm": 4,
    "md": 8,
    "lg": 12,
    "full": 9999
  },
  "shadows": {
    "sm": {
      "color": "#00000066",
      "dx": 0,
      "dy": 1,
      "blur": 2,
      "spread": 0
    },
    "md": {
      "color": "#4FC3F714",
      "dx": 0,
      "dy": 2,
      "blur": 12,
      "spread": 0
    },
    "lg": {
      "color": "#00000066",
      "dx": 0,
      "dy": 4,
      "blur": 8,
      "spread": 0
    },
    "xl": {
      "color": "#00000066",
      "dx": 0,
      "dy": 8,
      "blur": 16,
      "spread": 0
    }
  }
}
```