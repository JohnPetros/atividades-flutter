# PRD — App de Exercícios Flutter

## 1. Visão geral do produto

O aplicativo será uma ferramenta educacional mobile, desenvolvida em Flutter, com o objetivo de apresentar exercícios práticos de componentes de interface.
Cada exercício será representado por **uma tela independente**, permitindo que o usuário navegue entre diferentes exemplos de uso de widgets e interações comuns em apps.

O foco do produto é **aprendizado, prática visual e demonstração acadêmica**.

---

## 2. Objetivo

Criar um aplicativo simples, didático e visualmente organizado para ajudar estudantes a praticarem conceitos de Flutter por meio de exercícios de interface.

---

## 3. Público-alvo

* Estudantes iniciantes de Flutter
* Alunos de cursos técnicos, faculdade ou bootcamps
* Professores que desejam demonstrar componentes básicos de interface
* Desenvolvedores iniciantes que querem exemplos práticos de UI

---

## 4. Problema que o app resolve

Muitos estudantes aprendem componentes de Flutter de forma isolada e sem contexto visual.
O app organiza exercícios em telas separadas, facilitando a compreensão prática de como diferentes widgets funcionam dentro de pequenos cenários reais.

---

## 5. Proposta de valor

* Aprendizado visual e prático
* Exercícios organizados em um único app
* Estrutura simples para estudo e demonstração
* Interface moderna e fácil de navegar
* Conteúdo em **português do Brasil (pt-BR)**

---

## 6. Escopo do produto

### Funcionalidades principais

* Tela inicial com lista de exercícios
* Navegação para telas individuais
* Cada exercício representado por uma interface funcional própria
* Layout consistente entre todas as telas
* Textos da interface em **pt-BR**

### Exercícios / telas do app

1. Tela inicial com menu de exercícios
2. Lista de compras
3. Cadastro de tarefas diárias
4. Notas rápidas
5. Formulário de feedback
6. Configurações de preferência
7. Pesquisa de cidades com autocomplete
8. Seleção de países e capitais
9. Agendamento de eventos simples
10. Diário pessoal
11. Catálogo de produtos por categoria

---

## 7. Requisitos funcionais

### RF01 — Tela inicial

O app deve exibir uma tela inicial com a lista de todos os exercícios disponíveis.

### RF02 — Navegação

O usuário deve conseguir acessar cada exercício por meio de navegação simples a partir da tela inicial.

### RF03 — Exercícios independentes

Cada exercício deve funcionar como uma tela separada com seu próprio objetivo e componentes.

### RF04 — Componentes interativos

O app deve incluir componentes como:

* campos de texto
* checkboxes
* radio buttons
* listas
* autocomplete
* calendário
* abas com TabBarView

### RF05 — Exibição de dados

Cada tela deve exibir visualmente os dados inseridos ou selecionados pelo usuário.

### RF06 — Idioma

Todos os textos visíveis ao usuário devem estar em **português do Brasil (pt-BR)**.

---

## 8. Requisitos não funcionais

### RNF01 — Usabilidade

A interface deve ser simples, intuitiva e adequada para iniciantes.

### RNF02 — Consistência visual

Todas as telas devem seguir o mesmo padrão visual.

### RNF03 — Responsividade

O app deve funcionar corretamente em smartphones.

### RNF04 — Performance

As interações devem ser rápidas e sem travamentos perceptíveis.

### RNF05 — Clareza educacional

O design deve facilitar a compreensão dos componentes apresentados.

---

## 9. Estrutura das telas

### Tela Inicial

* Lista com cards dos exercícios
* Título do exercício
* Ícone ilustrativo
* Pequena descrição
* Acesso para a tela correspondente

### Telas de exercícios

Cada tela deve conter:

* AppBar com título
* Área principal com os componentes do exercício
* Organização clara dos campos e listas
* Feedback visual de interação

---

## 10. Critérios de sucesso

O produto será considerado bem-sucedido se:

* o usuário conseguir navegar facilmente entre os exercícios
* cada tela representar claramente um componente ou conjunto de componentes do Flutter
* a interface for compreensível para estudantes iniciantes
* o app puder ser usado em contexto acadêmico como demonstração prática

---

## 11. Fora de escopo

Este app **não precisa**, nesta primeira versão:

* autenticação de usuário
* backend
* banco de dados remoto
* sincronização em nuvem
* notificações
* sistema avançado de permissões
* acessos multiusuário

---

## 12. Premissas

* O app será desenvolvido em Flutter
* O foco principal é educacional
* Os dados podem ser mantidos apenas localmente em memória, se necessário
* O produto será usado como exercício, portfólio ou demonstração acadêmica

---

## 13. MVP

O MVP deve conter:

* tela inicial
* navegação entre telas
* todas as telas de exercícios propostas
* interface consistente
* textos em pt-BR
* funcionamento básico dos componentes em cada exercício

---

## 14. Futuras melhorias

* salvar dados localmente
* adicionar animações
* incluir modo escuro
* inserir explicações teóricas por exercício
* adicionar pontuação ou progresso
* incluir exemplos de código junto da interface
****

## Theme (JSON)

```json
{
  "fonts": {
    "primary": "google:Inter",
    "secondary": "google:JetBrains Mono"
  },
  "colors": {
    "light": {
      "primary": "#1A1A1A",
      "on_primary": "#FFFFFF",
      "secondary": "#4B5563",
      "on_secondary": "#FFFFFF",
      "accent": "#2563EB",
      "background": "#FFFFFF",
      "surface": "#F9FAFB",
      "on_surface": "#111827",
      "primary_text": "#111827",
      "secondary_text": "#6B7280",
      "hint": "#9CA3AF",
      "error": "#DC2626",
      "on_error": "#FFFFFF",
      "success": "#16A34A",
      "divider": "#E5E7EB",
      "transparent": "#00000000"
    },
    "dark": {
      "primary": "#F9FAFB",
      "on_primary": "#000000",
      "secondary": "#9CA3AF",
      "on_secondary": "#000000",
      "accent": "#60A5FA",
      "background": "#000000",
      "surface": "#111111",
      "on_surface": "#F9FAFB",
      "primary_text": "#F9FAFB",
      "secondary_text": "#9CA3AF",
      "hint": "#4B5563",
      "error": "#EF4444",
      "on_error": "#000000",
      "success": "#4ADE80",
      "divider": "#262626",
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
      "height": 1.3
    },
    "title_medium": {
      "font": "primary",
      "size": 16,
      "weight": 600,
      "height": 1.4
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
      "height": 1.5
    },
    "body_small": {
      "font": "secondary",
      "size": 12,
      "weight": 400,
      "height": 1.4
    },
    "label_large": {
      "font": "primary",
      "size": 14,
      "weight": 600,
      "height": 1.3
    },
    "label_medium": {
      "font": "secondary",
      "size": 12,
      "weight": 600,
      "height": 1.3
    },
    "label_small": {
      "font": "secondary",
      "size": 10,
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
    "md": 4,
    "lg": 4,
    "full": 9999
  },
  "shadows": {
    "sm": {
      "color": "#0000000D",
      "dx": 0,
      "dy": 1,
      "blur": 2,
      "spread": 0
    },
    "md": {
      "color": "#0000001A",
      "dx": 0,
      "dy": 4,
      "blur": 6,
      "spread": -1
    },
    "lg": {
      "color": "#0000001A",
      "dx": 0,
      "dy": 10,
      "blur": 15,
      "spread": -3
    },
    "xl": {
      "color": "#00000040",
      "dx": 0,
      "dy": 20,
      "blur": 25,
      "spread": -5
    }
  }
}
```

