# Prompt — Tela Busca de Cidades

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Busca de Cidades**.
This screen should simulate a polished autocomplete city search experience, where the user types the name of a Brazilian city, sees intelligent suggestions, and visualizes the selected result in a highlighted card.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **city search screen** with a polished dark theme, where the user can:

* search for a municipality using text input
* view autocomplete suggestions while typing
* see suggestion rows with icons
* select a city from the suggestion list
* visualize the final selected city in a result card

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium search experience
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded cards and rounded search fields
* White titles and muted gray supporting text
* Subtle borders and soft contrast
* Clean spacing and refined alignment
* Interface should feel like a real production Flutter app

## Top area

Create a top section with:

* a square dark back button aligned to the upper-left corner with a left arrow icon
* large main title: **Busca de Cidades**
* subtitle below the title: **Exercício de Autocomplete e Filtros**
* a subtle dark gradient or soft header atmosphere in the background
* generous top spacing and elegant composition

## Search card

Below the title area, create a large rounded dark card.

Inside this card, add:

### Card title

* **Pesquisar Município**

### Search field

A dark rounded input field with:

* left search icon
* placeholder: **Ex: São Paulo, Curitiba...**
* strong internal padding
* premium search bar appearance

### Suggestion dropdown/list

Directly below the search field, create a large rounded dark suggestion panel containing three autocomplete results.

Each suggestion row should include:

* small icon on the left
* city name and state abbreviation
* spacious vertical padding
* minimal clean separators or spacing

Use the following example suggestions:

1. **Rio de Janeiro, RJ**
2. **Ribeirão Preto, SP**
3. **Rio Branco, AC**

Suggested icon style:

* first row can use a recent/history icon
* remaining rows can use location/pin icons

## Selection result area

Below the search card, create a results section header with:

* title on the left: **Resultado da Seleção**
* a compact rounded status chip on the right with:

  * check icon
  * text: **1 selecionada**

## Selected city card

Under the result header, create a large rounded dark card representing the chosen city.

This card should include:

* circular dark icon container on the left with a city/building icon
* selected city name in bold: **Rio de Janeiro**
* supporting subtitle below: **Estado do Rio de Janeiro - Brasil**
* a chevron arrow on the right
* elegant spacing and polished visual hierarchy

## Layout behavior

* Vertical smartphone layout
* Clean section spacing
* Spacious side margins
* Strong separation between title area, search card, result header, and selected city card
* Design should look ready for Flutter implementation
* Interface should feel slightly scrollable even if the content is compact

## Interaction states to represent visually

* Search field with typed/autocomplete-ready appearance
* Suggestion list visible and open
* One city already selected
* Status chip confirming one selected result
* Selected city card prominently displayed

## Design keywords

dark search UI, Flutter autocomplete screen, city search interface, elegant dark mode, Material 3, premium mobile search card, autocomplete suggestions, selected result card, educational Flutter exercise, polished location search UI

## Final instruction

The final result must look like a **real Flutter autocomplete city search screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.

screenshot: documentation\screenshots\Busca de Cidades.png