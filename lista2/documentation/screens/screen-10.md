# Prompt — Tela Catálogo de Produtos

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Catálogo de Produtos por Categoria**.
This screen should simulate a polished product catalog interface with category tabs, search input, scrollable product cards, prices, and stock status.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **product catalog screen** with a polished dark theme, where the user can:

* search products by name
* switch between categories using tabs
* browse products in a vertical list
* view product name, short description, price, and stock status
* identify the currently active category

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium ecommerce/catalog app feel
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded cards and rounded search field
* White titles and muted gray supporting text
* Subtle borders and soft contrast
* Clean spacing with refined alignment
* Interface should feel like a real production Flutter app

## Top bar

Create a minimal top header with:

* back arrow icon on the left
* centered title: **Catálogo de Produtos**
* shopping cart icon on the right
* dark background integrated with the rest of the screen
* balanced spacing and clean composition

## Search area

Below the top bar, create a large rounded dark search field with:

* left search icon
* placeholder: **Pesquisar no catálogo...**
* strong internal padding
* premium search bar appearance

## Category tabs

Below the search field, add a horizontal tab bar with the following categories:

* **Eletrônicos**
* **Vestuário**
* **Livros**
* **Casa**

Visual behavior:

* **Eletrônicos** should appear selected
* selected tab should have bold white text and a visible underline indicator
* inactive tabs should use muted gray text
* tabs should feel modern and easy to scan

## Section label

Below the tabs, add a muted section title:

* **Resultados em Eletrônicos**

Use a smaller label style to separate it from the top content.

## Product list

Create a vertical list of large dark rounded product cards.

Each product card should include:

* a square dark icon/image container on the left
* centered product icon related to the item category
* product title in bold white
* short product description below in muted gray
* price aligned to the right in bold white
* stock badge below the price with the text: **Em estoque**
* elegant spacing and premium list-card composition

## Example products

1. **MacBook Air M2**
   Description: **Apple, 8GB RAM, 256GB SSD**
   Price: **R$ 7.999**
   Icon suggestion: laptop

2. **iPhone 15 Pro**
   Description: **Titânio Natural, 128GB**
   Price: **R$ 6.490**
   Icon suggestion: smartphone

3. **Sony WH-1000XM5**
   Description: **Cancelamento de ruído ativo**
   Price: **R$ 2.150**
   Icon suggestion: headphones

4. **Apple Watch Series 9**
   Description: **GPS + Cellular, 45mm**
   Price: **R$ 3.800**
   Icon suggestion: smartwatch

5. **Galaxy Tab S9 Ultra**
   Description: **14.6 polegadas, S-Pen inclusa**
   Price: **R$ 5.200**
   Icon suggestion: tablet

6. **JBL Flip 6**
   Description: **Caixa de som Bluetooth à prova d’água**
   Price: **R$ 699**
   Icon suggestion: speaker

7. **Canon EOS R6**
   Description: **Mirrorless Full Frame**
   Price: **R$ 14.500**
   Icon suggestion: camera

8. **Logitech MX Master 3S**
   Description: **Mouse ergonômico silencioso**
   Price: **R$ 540**
   Icon suggestion: mouse

## Stock badge styling

The stock badge should:

* be small and rounded
* use a light green or mint-tinted background
* have dark green text
* visually indicate availability without overpowering the card

## Bottom info bar

At the bottom of the screen, add a subtle dark footer bar or bottom text area containing:

* **8 produtos encontrados**

Use muted styling so it feels informative but secondary.

## Layout behavior

* Vertical smartphone layout
* Scrollable product list
* Spacious side margins
* Strong spacing between search, tabs, label, and cards
* Cards should feel tappable and polished
* Design should look ready for Flutter implementation

## Interaction states to represent visually

* Search field ready for typing
* One tab clearly active
* Multiple product cards visible
* Price and stock status easy to scan
* Bottom count of results visible

## Design keywords

dark ecommerce UI, Flutter catalog screen, product list interface, elegant dark mode, Material 3, premium shopping app, category tabs, mobile search catalog, polished product cards, educational Flutter exercise

## Final instruction

The final result must look like a **real Flutter product catalog screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.

screenshot: documentation\screenshots\Catálogo de Produtos.png