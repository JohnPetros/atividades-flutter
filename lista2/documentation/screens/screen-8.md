# Prompt — Tela Países e Capitais

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Países e Capitais**.
This screen should simulate a polished autocomplete-based lookup experience where the user types a country name, sees filtered suggestions, and visualizes the corresponding capital in a highlighted information card.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **country and capital lookup screen** with a polished dark theme, where the user can:

* search for a country using autocomplete
* browse filtered country suggestions
* select a country from the suggestion list
* view the related capital in a dedicated result card
* clear the selection
* read a small educational helper message at the bottom

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium educational app feel
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded cards and rounded input fields
* White titles and muted gray support text
* Subtle borders and soft contrast
* Spacious layout and refined alignment
* Interface should feel like a real production Flutter app

## Top bar

Create a minimal top area with:

* back arrow icon on the upper-left
* centered top label: **Exercício 08**
* information icon on the upper-right
* dark background integrated with the rest of the screen
* elegant spacing and balanced composition

## Intro section

Below the top bar, create an intro block containing:

* a square light icon container with a globe icon
* main title: **Países e Capitais**
* supporting subtitle: **Pratique o uso de campos Autocomplete e exibição de dados vinculados.**

This area should feel instructional and visually aligned with the rest of the app.

## Main content card

Below the intro, create a large dark rounded card that contains the full interactive exercise.

### Search section

At the top of the card, add:

* section title with search icon: **Selecione um País**

Then create a dark rounded autocomplete input field with:

* left flag icon
* placeholder: **Comece a digitar o nome do país...**
* supporting helper text below the field: **Ex: Brasil, Japão, França...**

### Suggestions panel

Directly below the helper text, add a large dark rounded suggestion panel with country results.

Each suggestion row should include:

* country flag icon or emoji on the left
* country name
* clean spacing and vertical rhythm
* minimal separators or subtle structure

Use these example suggestions:

1. **Brasil**
2. **Bélgica**
3. **Benin**

## Capital result card

Inside the same main card, below the suggestions list, add a second rounded dark information card.

At the top of this inner card, add:

* city/building icon
* section label: **Capital Encontrada**

Then show the selected capital:

* main capital text in large bold: **Brasília**
* supporting description below: **Esta é a sede administrativa do país selecionado.**

Use generous padding and clear visual focus on the capital name.

## Clear selection button

At the bottom of the main content card, add a large outlined pill-shaped button:

* icon: refresh/rotate
* text: **Limpar Seleção**
* transparent or dark background with light outline
* centered and elegant
* should feel secondary but clearly actionable

## Bottom educational info box

Below the main card, add a light informational box with:

* small lightbulb or tip icon on the left
* educational helper text in blue-toned or dark readable typography:
  **O widget Autocomplete é ideal para longas listas de opções, permitindo que o usuário filtre resultados enquanto digita.**

This box should feel instructive and friendly, reinforcing the academic purpose of the screen.

## Layout behavior

* Vertical smartphone layout
* Spacious side margins
* Strong separation between top bar, intro section, main exercise card, and educational info box
* Scrollable screen
* Design should look ready for Flutter implementation

## Interaction states to represent visually

* Input ready for typing
* Suggestion list expanded and visible
* A country already selected
* Capital result card populated
* Secondary clear-selection action visible
* Educational tip box present below the exercise

## Design keywords

dark autocomplete UI, Flutter educational screen, country lookup app, capital result card, elegant dark mode, Material 3, premium mobile search interface, linked data screen, autocomplete suggestions, polished Flutter exercise layout

## Final instruction

The final result must look like a **real Flutter country and capital lookup screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.


screenshot: documentation\screenshots\Países e Capitais.png