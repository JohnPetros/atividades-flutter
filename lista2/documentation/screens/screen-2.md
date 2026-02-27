# Prompt — Tela Lista de Compras

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Lista de Compras**.
This screen should simulate a practical shopping list interface where the user can add items, mark them as purchased, and remove them from the list.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **shopping list screen** with a polished dark theme, where the user can:

* type a new grocery item
* add the item to the list
* view items separated by status
* mark items as purchased using checkboxes
* remove items using a delete icon

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium and polished look
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded cards and rounded inputs
* Clean spacing and visual balance
* White titles, gray subtitles, muted support text
* Soft borders and subtle contrast
* Smooth visual grouping of sections
* Interface should look like a real production Flutter app

## Header area

At the top, create a clean header with:

* Large title: **Lista de Compras**
* Subtitle: **Organize seus mantimentos**
* On the top-right, a circular dark icon button with a **shopping cart icon**
* Spacious top padding and refined alignment

## Add item section

Below the header, create a centered section title:

* **Adicionar novo item**

Then add a horizontal input area containing:

* A dark rounded text field
* Left icon inside the input: shopping cart
* Placeholder text: **Ex: Arroz, Feijão...**
* A separate square or rounded button on the right with a **right arrow icon**
* The button should have a light background for strong contrast

## Shopping list organization

Create two visual sections for the list:

### Section 1

Title with icon:

* icon: list/checklist style
* title: **Itens para Comprar**

Under this title, show cards for items not yet purchased.

Example items:

* **Leite Integral**
* **Pão de Forma**

Each item card should include:

* dark rounded rectangular container
* checkbox on the left, currently unchecked
* item name in white
* delete/trash icon on the right in red
* generous padding and horizontal alignment

### Section 2

Title with icon:

* icon: check circle
* title: **Já no Carrinho**

Use a green accent for this section title/icon.

Under this title, show completed items.

Example items:

* **Café Torrado**
* **Açúcar Refinado**
* **Manteiga 200g**

Each completed item card should include:

* dark rounded rectangular container
* checked checkbox on the left
* item name in muted gray to indicate completed state
* delete/trash icon on the right in red
* subtle visual difference from pending items

## Floating action button

At the bottom-right, add a large pill-shaped floating button with:

* icon: plus
* text: **Novo Item**
* light background
* dark text
* elegant spacing
* premium mobile app look

## Layout behavior

* Vertical smartphone layout
* Strong spacing between sections
* Symmetrical margins
* Cards stacked vertically
* Interface should feel scrollable
* Clean grouping of input, pending list, and completed list

## Interaction states to represent visually

* Empty input ready for text
* Pending items with unchecked checkboxes
* Completed items with checked checkboxes
* Deletion action clearly available
* Add button highly visible and easy to tap

## Design keywords

dark shopping list UI, Flutter mobile screen, grocery app design, checklist interface, elegant dark mode, Material 3, premium task list, rounded cards, educational Flutter exercise, minimalist productivity screen

## Final instruction

The final result must look like a **real Flutter shopping list screen**, highly polished and ready for implementation, with **all visible text written in pt-BR**.


screenshot: documentation\screenshots\Lista de Compras.png