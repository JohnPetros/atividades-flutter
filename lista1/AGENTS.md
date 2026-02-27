# PRD — App de Exercícios em Flutter

## 1. Visão geral

Este aplicativo tem como objetivo reunir, em um único lugar, exercícios básicos de lógica e interface desenvolvidos em **Flutter**, com foco em aprendizado prático de entrada de dados, cálculos, listas e interação com componentes visuais.

O app será composto por uma **tela inicial** com acesso a diferentes funcionalidades, cada uma representando um exercício separado.

---

## 2. Objetivo do produto

Permitir que o usuário utilize um aplicativo simples e organizado para:

* realizar cálculos básicos
* inserir e visualizar informações
* interagir com listas dinâmicas
* marcar itens com checkbox
* visualizar tarefas e produtos cadastrados

Além disso, o app serve como prática de desenvolvimento mobile com Flutter.

---

## 3. Público-alvo

* estudantes iniciantes em Flutter
* professores e avaliadores de atividades acadêmicas
* usuários que desejam testar funcionalidades simples de cálculo e organização

---

## 4. Escopo do app

O aplicativo terá uma **home** com navegação para as seguintes telas:

1. Conversor de Celsius para Fahrenheit
2. Calculadora de Média Aritmética
3. Calculadora de Desconto com lista de produtos
4. Calculadora de Área de um Retângulo
5. Lista de Compras
6. Cadastro de Tarefas Diárias

---

## 5. Funcionalidades

### 5.1 Tela inicial

**Descrição:**
Tela principal com a lista de exercícios disponíveis.

**Requisitos funcionais:**

* exibir o nome do app
* exibir uma lista ou menu com todas as funcionalidades
* permitir navegação para cada tela

---

### 5.2 Conversor de Celsius para Fahrenheit

**Descrição:**
Permite ao usuário informar uma temperatura em Celsius e visualizar o valor convertido para Fahrenheit.

**Requisitos funcionais:**

* campo para inserir temperatura em Celsius
* botão para calcular conversão
* exibição do resultado em Fahrenheit

**Regra de negócio:**

* usar a fórmula: **F = (C * 9/5) + 32**

---

### 5.3 Calculadora de Média Aritmética

**Descrição:**
Permite inserir três notas e calcular a média.

**Requisitos funcionais:**

* três campos para entrada das notas
* botão para calcular média
* exibição do resultado final

**Regra de negócio:**

* usar a fórmula: **(nota1 + nota2 + nota3) / 3**

---

### 5.4 Calculadora de Desconto

**Descrição:**
Permite calcular o preço final de um produto com desconto e armazenar os produtos em uma lista.

**Requisitos funcionais:**

* campo para nome do produto
* campo para preço original
* campo para porcentagem de desconto
* botão para calcular desconto
* exibição do preço final
* botão para adicionar produto à lista
* lista com produtos cadastrados

**Dados exibidos por produto:**

* nome
* preço original
* porcentagem de desconto
* preço final

**Regra de negócio:**

* preço final = preço original - (preço original * desconto / 100)

---

### 5.5 Calculadora de Área de um Retângulo

**Descrição:**
Permite calcular a área de um retângulo a partir da largura e altura.

**Requisitos funcionais:**

* campo para largura
* campo para altura
* botão para calcular
* exibição da área

**Regra de negócio:**

* área = largura * altura

---

### 5.6 Lista de Compras

**Descrição:**
Permite adicionar, visualizar, marcar e remover itens de compra.

**Requisitos funcionais:**

* campo de texto para inserir item
* botão para adicionar item
* lista de itens em ListView
* checkbox para marcar item como comprado
* opção de remover item da lista

**Comportamentos esperados:**

* item marcado deve indicar visualmente que foi comprado
* item removido deve desaparecer da lista imediatamente

---

### 5.7 Cadastro de Tarefas Diárias

**Descrição:**
Permite cadastrar tarefas com nome, descrição, prioridade e status de conclusão.

**Requisitos funcionais:**

* campo para nome da tarefa
* campo para descrição
* seleção de prioridade com radio buttons:

  * baixa
  * média
  * alta
* checkbox para tarefa concluída
* botão para adicionar tarefa
* exibição das tarefas em lista

**Dados exibidos por tarefa:**

* nome
* descrição
* prioridade
* status de concluída

---

## 6. Requisitos não funcionais

* o app deve ser desenvolvido em **Flutter**
* a interface deve ser simples, limpa e fácil de usar
* a navegação entre telas deve ser clara
* os campos devem possuir identificação visível
* o app deve funcionar localmente, sem necessidade de internet
* os dados podem ser mantidos apenas em memória, sem banco de dados, caso o projeto não exija persistência

---

## 7. Fluxo principal do usuário

1. Usuário abre o app
2. Visualiza a tela inicial com a lista de exercícios
3. Escolhe uma funcionalidade
4. Preenche os campos necessários
5. Executa a ação principal da tela
6. Visualiza o resultado ou a lista atualizada
7. Pode voltar para a tela inicial e acessar outro exercício

---

## 8. Critérios de aceitação

### Gerais

* o usuário consegue acessar qualquer exercício pela tela inicial
* cada tela possui campos, botão de ação e retorno visual do resultado
* a navegação entre telas funciona corretamente

### Por funcionalidade

* o conversor exibe corretamente Fahrenheit a partir de Celsius
* a média é calculada corretamente com três notas
* o desconto gera o preço final correto e adiciona o produto à lista
* a área do retângulo é exibida corretamente
* a lista de compras permite adicionar, marcar e remover itens
* o cadastro de tarefas permite adicionar tarefas com prioridade e status

---

## 9. Fora de escopo

* login e autenticação
* integração com API
* banco de dados remoto
* notificações
* filtros avançados
* edição de itens já cadastrados
* definição de identidade visual detalhada

---

## 10. Resultado esperado

Ao final, o app deve demonstrar de forma prática o uso dos principais componentes básicos do Flutter, incluindo:

* navegação entre telas
* TextField
* botões
* listas
* ListView
* Checkbox
* Radio buttons
* exibição de resultados e dados cadastrados


## Theme (JSON)

```json
{
  "fonts": {
    "primary": "google:Poppins",
    "secondary": "google:Urbanist",
    "mono": "google:JetBrains Mono"
  },
  "colors": {
    "light": {
      "primary": "#0066FF",
      "on_primary": "#FFFFFF",
      "primary_container": "#D6E4FF",
      "on_primary_container": "#001A4D",
      "secondary": "#FF2D87",
      "on_secondary": "#FFFFFF",
      "secondary_container": "#FFD9E8",
      "on_secondary_container": "#3D0020",
      "tertiary": "#FFE500",
      "on_tertiary": "#1A1A00",
      "error": "#FF3B3B",
      "on_error": "#FFFFFF",
      "error_container": "#FFDAD6",
      "on_error_container": "#410002",
      "background": "#FFFFFF",
      "on_background": "#0A0A0F",
      "secondary_background": "#F5F5F7",
      "surface": "#FFFFFF",
      "on_surface": "#0A0A0F",
      "surface_variant": "#E8E8EC",
      "on_surface_variant": "#44444F",
      "primary_text": "#0A0A0F",
      "secondary_text": "#44444F",
      "outline": "#75757F",
      "divider": "#C6C6D0",
      "transparent": "#00000000",
      "shadow": "#000000",
      "scrim": "#000000",
      "inverse_surface": "#0A0A0F",
      "inverse_on_surface": "#F2F2F5",
      "inverse_primary": "#9DBFFF"
    },
    "dark": {
      "primary": "#9DBFFF",
      "on_primary": "#00337A",
      "primary_container": "#004DB3",
      "on_primary_container": "#D6E4FF",
      "secondary": "#FFB1D4",
      "on_secondary": "#5E0035",
      "secondary_container": "#85004E",
      "on_secondary_container": "#FFD9E8",
      "tertiary": "#FFE500",
      "on_tertiary": "#1A1A00",
      "error": "#FFB4AB",
      "on_error": "#690005",
      "error_container": "#93000A",
      "on_error_container": "#FFDAD6",
      "background": "#0A0A0F",
      "on_background": "#E4E4E8",
      "secondary_background": "#1A1A1F",
      "surface": "#0A0A0F",
      "on_surface": "#E4E4E8",
      "surface_variant": "#44444F",
      "on_surface_variant": "#C6C6D0",
      "primary_text": "#E4E4E8",
      "secondary_text": "#C6C6D0",
      "outline": "#8F8F99",
      "divider": "#44444F",
      "transparent": "#00000000",
      "shadow": "#000000",
      "scrim": "#000000",
      "inverse_surface": "#E4E4E8",
      "inverse_on_surface": "#0A0A0F",
      "inverse_primary": "#0066FF"
    }
  },
  "text_styles": {
    "display_large": {
      "font": "primary",
      "size": 57,
      "weight": 400,
      "height": 1.12
    },
    "display_medium": {
      "font": "primary",
      "size": 45,
      "weight": 400,
      "height": 1.16
    },
    "display_small": {
      "font": "primary",
      "size": 36,
      "weight": 400,
      "height": 1.22
    },
    "headline_large": {
      "font": "primary",
      "size": 32,
      "weight": 400,
      "height": 1.25
    },
    "headline_medium": {
      "font": "primary",
      "size": 28,
      "weight": 400,
      "height": 1.29
    },
    "headline_small": {
      "font": "primary",
      "size": 24,
      "weight": 400,
      "height": 1.33
    },
    "title_large": {
      "font": "primary",
      "size": 22,
      "weight": 400,
      "height": 1.27
    },
    "title_medium": {
      "font": "primary",
      "size": 16,
      "weight": 500,
      "height": 1.5
    },
    "title_small": {
      "font": "primary",
      "size": 14,
      "weight": 500,
      "height": 1.43
    },
    "label_large": {
      "font": "primary",
      "size": 14,
      "weight": 500,
      "height": 1.43
    },
    "label_medium": {
      "font": "primary",
      "size": 12,
      "weight": 500,
      "height": 1.33
    },
    "label_small": {
      "font": "primary",
      "size": 11,
      "weight": 500,
      "height": 1.45
    },
    "body_large": {
      "font": "primary",
      "size": 16,
      "weight": 400,
      "height": 1.5
    },
    "body_medium": {
      "font": "primary",
      "size": 14,
      "weight": 400,
      "height": 1.43
    },
    "body_small": {
      "font": "primary",
      "size": 12,
      "weight": 400,
      "height": 1.33
    }
  },
  "spacing": {
    "none": 0,
    "xs": 4,
    "sm": 8,
    "md": 16,
    "lg": 24,
    "xl": 32,
    "xxl": 48,
    "xxxl": 64
  },
  "radii": {
    "none": 0,
    "xs": 8,
    "sm": 12,
    "md": 20,
    "lg": 28,
    "xl": 36,
    "xxl": 48,
    "full": 9999
  },
  "radius_scale": 0.670138888888889,
  "shadows": {
    "none": {
      "color": "#00000000",
      "dx": 0,
      "dy": 0,
      "blur": 0,
      "spread": 0
    },
    "xs": {
      "color": "#0000001A",
      "dx": 0,
      "dy": 1,
      "blur": 1,
      "spread": 0
    },
    "sm": {
      "color": "#0000001A",
      "dx": 0,
      "dy": 1,
      "blur": 2,
      "spread": 0
    },
    "md": {
      "color": "#0000001A",
      "dx": 0,
      "dy": 2,
      "blur": 4,
      "spread": 0
    },
    "lg": {
      "color": "#0000001A",
      "dx": 0,
      "dy": 4,
      "blur": 8,
      "spread": 0
    },
    "xl": {
      "color": "#0000001A",
      "dx": 0,
      "dy": 8,
      "blur": 16,
      "spread": 0
    },
    "xxl": {
      "color": "#0000001A",
      "dx": 0,
      "dy": 12,
      "blur": 24,
      "spread": 0
    }
  },
  "gradients": {},
  "component_defaults": {
    "button": {
      "radius": 8,
      "padding": [
        12,
        24,
        12,
        24
      ],
      "min_height": 40
    },
    "card": {
      "radius": 12,
      "shadow": "md",
      "padding": 16
    },
    "textfield": {
      "radius": 4,
      "border_width": 1,
      "padding": [
        16,
        12,
        16,
        12
      ]
    },
    "chip": {
      "radius": 8,
      "padding": [
        8,
        12,
        8,
        12
      ],
      "min_height": 32
    },
    "dialog": {
      "radius": 28,
      "padding": 24
    },
    "fab": {
      "radius": 16,
      "size": 56,
      "shadow": "lg"
    },
    "iconbutton": {
      "radius": 20,
      "size": 40
    }
  }
}
```