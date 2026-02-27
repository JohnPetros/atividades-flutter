# Prompt — Tela Notas Rápidas

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Notas Rápidas**.
This screen should simulate a practical notes interface where the user can write a title, add multiline content, save notes, and visualize previously saved notes in an organized list.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **quick notes screen** with a polished dark theme, where the user can:

* create a note title
* write note content in a multiline field
* save a note
* browse saved notes
* identify recency or date metadata
* visually separate note creation from note history

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium note-taking app feel
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded containers and input fields
* White titles and muted gray support text
* Soft borders and subtle contrast
* Spacious layout with refined alignment
* Interface should feel like a real production Flutter app

## Top bar

Create a minimal top app bar with:

* back arrow icon on the left
* centered title: **Notas Rápidas**
* a simple action icon on the right, similar to pin, sort, or organize
* dark background integrated with the screen
* clean spacing and balanced composition

## Note creation card

Below the top bar, create a large dark rounded card for writing a new note.

Inside this card, add:

### Field 1 — Note title

Label:

* **Título da Nota**

Input field:

* dark rounded text field
* placeholder: **Digite o título...**

### Field 2 — Content

Label:

* **Conteúdo**

Input field:

* dark rounded multiline text area
* placeholder: **Escreva suas ideias aqui...**
* larger height for comfortable writing

### Main action button

At the bottom of the card, add a large pill-shaped primary button:

* icon: plus
* text: **Salvar Nota**
* light background
* dark text
* centered and highly visible

## Notes list section

Below the form card, create a section header with:

* title on the left: **Suas Notas**
* on the right, a compact rounded filter/sort chip with:

  * small icon
  * text: **Recentes**

Then add a vertical list of saved note cards.

## Saved note cards

Each note card should include:

* dark rounded rectangular container
* note title in bold white
* note preview text in muted gray
* date or recency label aligned to the top-right
* elegant spacing and clean hierarchy

### Example notes

1. **Lista de Compras**
   Preview: **Comprar leite, pão integral, ovos e frutas para a semana.**
   Metadata: **Hoje**

2. **Ideias para o App Flutter**
   Preview: **Implementar um sistema de gerenciamento de estado robusto e animações suaves.**
   Metadata: **Ontem**

3. **Reunião de Projeto**
   Preview: **Discutir os prazos do cronograma e a alocação de recursos da equipe.**
   Metadata: **22 Out**

4. **Lembrete de Estudo**
   Preview: **Revisar os conceitos de LayoutBuilder e CustomPainter no Flutter.**
   Metadata: **20 Out**

## Bottom floating action button

At the bottom-left corner, add a circular floating action button with:

* light background
* dark icon related to notes, editing, or list-writing
* premium and minimal appearance
* should feel like an alternate shortcut to create or manage notes

## Layout behavior

* Vertical smartphone layout
* Scrollable content
* Strong spacing between top bar, form card, section title, and list cards
* Consistent side margins
* Clear visual separation between note input and saved notes list
* Design should look ready for Flutter implementation

## Interaction states to represent visually

* Empty title field ready for typing
* Empty multiline content area
* Active save button
* Saved notes visible below
* Sort/filter chip visible
* Recency metadata clearly readable

## Design keywords

dark notes app UI, Flutter note-taking screen, elegant dark mode, Material 3, premium mobile writing interface, minimalist productivity app, saved note cards, educational Flutter exercise, polished form layout

## Final instruction

The final result must look like a **real Flutter notes screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.

screenshot: documentation\screenshots\Notas Rápidas.png