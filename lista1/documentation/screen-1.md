# Design Export Context

- Generated at: `2026-02-26T22:57:46.969Z`
- Document ID: `2b3bf56a-d95a-4655-91f1-38b8209a80b2`
- Page count: 1

## Original Prompt

```text
Crie o design de interface de um aplicativo mobile em **Flutter**, com uma navegação simples e organizada, contendo **telas separadas para cada exercício** abaixo. O foco deve estar em **estrutura, hierarquia visual, usabilidade, disposição dos elementos, espaçamentos, componentes e fluxo entre telas**. **Não definir paleta de cores**, apenas sugerir o layout e os componentes visuais.

### Diretrizes gerais do design

* Criar uma **tela inicial** com o título do aplicativo e uma **lista de exercícios** em formato de menu.
* Cada item da tela inicial deve levar para uma **tela independente**.
* O layout deve seguir um padrão consistente entre as telas:

  * título da funcionalidade no topo
  * breve descrição do que a tela faz
  * campos de entrada bem identificados
  * botão principal de ação
  * área de resultado
  * organização responsiva e limpa
* Pensar em uma interface simples, didática e ideal para projeto acadêmico.
* Usar componentes comuns do Flutter, como:

  * AppBar
  * TextField
  * ElevatedButton
  * Card
  * ListTile
  * ListView
  * Checkbox
  * Radio buttons
  * ícones quando fizer sentido
* Mostrar também sugestões de estados visuais:

  * campos vazios
  * campos preenchidos
  * resultado exibido
  * lista com itens
  * item marcado como concluído/comprado
* Priorizar boa experiência do usuário, clareza dos rótulos e fácil navegação.

---

### Telas a serem criadas

#### 1. Tela: Conversor de Celsius para Fahrenheit

Criar uma tela com:

* campo para digitar temperatura em Celsius
* botão para converter
* área destacada para mostrar o resultado em Fahrenheit
* apoio visual para fórmula: **F = (C * 9/5) + 32**
* layout simples e objetivo

#### 2. Tela: Calculadora de Média Aritmética

Criar uma tela com:

* três campos para inserir as notas
* botão para calcular média
* área para exibir a média final
* organização dos campos em sequência lógica
* apoio visual para fórmula: **(nota1 + nota2 + nota3) / 3**

#### 3. Tela: Calculadora de Desconto

Criar uma tela com:

* campo para nome do produto
* campo para preço original
* campo para porcentagem de desconto
* botão para calcular
* exibição do preço final com desconto
* botão para adicionar produto à lista
* seção inferior com uma **lista de produtos cadastrados**
* cada item da lista deve mostrar:

  * nome do produto
  * preço original
  * desconto aplicado
  * preço final
* considerar uma estrutura visual que destaque bem os dados do produto

#### 4. Tela: Calculadora de Área de um Retângulo

Criar uma tela com:

* campo para largura
* campo para altura
* botão para calcular área
* área de resultado
* apoio visual para fórmula: **Área = largura × altura**
* composição visual clara e educativa

#### 5. Tela: Lista de Compras

Criar uma tela com:

* TextField para adicionar item
* botão para adicionar à lista
* ListView com os itens cadastrados
* Checkbox ao lado de cada item para marcar como comprado
* botão ou ícone para remover item
* diferenciação visual entre item comprado e não comprado
* interface prática e intuitiva

#### 6. Tela: Cadastro de Tarefas Diárias

Criar uma tela com:

* TextField para nome da tarefa
* TextField para descrição breve
* grupo de Radio buttons para prioridade:

  * baixa
  * média
  * alta
* Checkbox para indicar se a tarefa foi concluída
* botão para adicionar tarefa
* ListView com as tarefas cadastradas
* cada item da lista deve mostrar:

  * nome da tarefa
  * descrição
  * prioridade
  * status de concluída
* considerar cards ou blocos para separar visualmente cada tarefa

---
```

### Tela de Menu Principal

- Frame ID: `0339707c-290d-44e9-9b73-0e48230ff492`
- Original page prompt: "A home screen with the app title and a vertical list of cards acting as a menu to access each exercise."
- Follow-up prompts: _None_

#### DslDocument (JSON)

```json
{
  "1": {
    "1": "scaffold",
    "2": [
      {
        "1": "bg",
        "2": {
          "4": {
            "1": "background"
          }
        }
      },
      {
        "1": "safe_area",
        "2": {
          "9": {
            "1": true
          }
        }
      }
    ],
    "3": [
      {
        "1": "column",
        "2": [
          {
            "1": "scroll",
            "2": {
              "9": {
                "1": true
              }
            }
          },
          {
            "1": "padding",
            "2": {
              "5": {
                "1": 0,
                "2": 0,
                "3": 0,
                "4": 0,
                "5": "lg"
              }
            }
          },
          {
            "1": "cross_align",
            "2": {
              "6": {
                "1": "stretch"
              }
            }
          }
        ],
        "3": [
          {
            "1": "column",
            "2": [
              {
                "1": "cross_align",
                "2": {
                  "6": {
                    "1": "start"
                  }
                }
              },
              {
                "1": "spacing",
                "2": {
                  "7": {
                    "1": "xs"
                  }
                }
              },
              {
                "1": "margin",
                "2": {
                  "5": {
                    "1": 0,
                    "2": 0,
                    "3": 0,
                    "4": 0,
                    "8": "xl"
                  }
                }
              }
            ],
            "3": [
              {
                "1": "row",
                "2": [
                  {
                    "1": "align",
                    "2": {
                      "6": {
                        "1": "space_between"
                      }
                    }
                  },
                  {
                    "1": "cross_align",
                    "2": {
                      "6": {
                        "1": "center"
                      }
                    }
                  }
                ],
                "3": [
                  {
                    "1": "column",
                    "2": [
                      {
                        "1": "cross_align",
                        "2": {
                          "6": {
                            "1": "start"
                          }
                        }
                      }
                    ],
                    "3": [
                      {
                        "1": "text",
                        "2": [
                          {
                            "1": "content",
                            "2": {
                              "7": {
                                "1": "EduCalc & Tasks"
                              }
                            }
                          },
                          {
                            "1": "style",
                            "2": {
                              "13": {
                                "1": "headline_medium"
                              }
                            }
                          },
                          {
                            "1": "font_weight",
                            "2": {
                              "10": {
                                "1": 800
                              }
                            }
                          },
                          {
                            "1": "color",
                            "2": {
                              "4": {
                                "1": "primary_text"
                              }
                            }
                          }
                        ],
                        "5": "7f0eeb18-8a66-4aca-94d2-eda78d165829"
                      },
                      {
                        "1": "text",
                        "2": [
                          {
                            "1": "content",
                            "2": {
                              "7": {
                                "1": "Academic Toolset"
                              }
                            }
                          },
                          {
                            "1": "style",
                            "2": {
                              "13": {
                                "1": "body_medium"
                              }
                            }
                          },
                          {
                            "1": "color",
                            "2": {
                              "4": {
                                "1": "primary"
                              }
                            }
                          },
                          {
                            "1": "font_weight",
                            "2": {
                              "10": {
                                "1": 500
                              }
                            }
                          }
                        ],
                        "5": "515fe0a2-207e-4bec-a97a-8d2e390ebd7d"
                      }
                    ],
                    "5": "09fe3c75-a382-4db9-a45d-f7c9b74a0f9e"
                  },
                  {
                    "1": "container",
                    "2": [
                      {
                        "1": "width",
                        "2": {
                          "1": {
                            "1": 48,
                            "2": false
                          }
                        }
                      },
                      {
                        "1": "height",
                        "2": {
                          "1": {
                            "1": 48,
                            "2": false
                          }
                        }
                      },
                      {
                        "1": "radius",
                        "2": {
                          "16": {
                            "1": 0,
                            "2": 0,
                            "3": 0,
                            "4": 0,
                            "5": "full"
                          }
                        }
                      },
                      {
                        "1": "bg",
                        "2": {
                          "4": {
                            "1": "surface"
                          }
                        }
                      },
                      {
                        "1": "border",
                        "2": {
                          "22": {
                            "1": 1,
                            "2": "divider"
                          }
                        }
                      },
                      {
                        "1": "align_child",
                        "2": {
                          "6": {
                            "1": "center"
                          }
                        }
                      }
                    ],
                    "3": [
                      {
                        "1": "icon",
                        "2": [
                          {
                            "1": "name",
                            "2": {
                              "11": {
                                "1": "school_rounded"
                              }
                            }
                          },
                          {
                            "1": "color",
                            "2": {
                              "4": {
                                "1": "primary_text"
                              }
                            }
                          },
                          {
                            "1": "size",
                            "2": {
                              "10": {
                                "1": 24
                              }
                            }
                          }
                        ],
                        "5": "b6fa1875-a71e-44ef-ba57-6395c92fef0f"
                      }
                    ],
                    "5": "7833fe36-8eb6-4b66-a25b-2ba27b966407"
                  }
                ],
                "5": "63bae471-b83d-4f29-ac17-87e804c25383"
              }
            ],
            "5": "49c56af8-afb7-49ca-a8a2-bcfe887c5e79"
          },
          {
            "1": "container",
            "2": [
              {
                "1": "bg",
                "2": {
                  "4": {
                    "1": "primary"
                  }
                }
              },
              {
                "1": "radius",
                "2": {
                  "16": {
                    "1": 0,
                    "2": 0,
                    "3": 0,
                    "4": 0,
                    "5": "lg"
                  }
                }
              },
              {
                "1": "padding",
                "2": {
                  "5": {
                    "1": 0,
                    "2": 0,
                    "3": 0,
                    "4": 0,
                    "5": "lg"
                  }
                }
              },
              {
                "1": "margin",
                "2": {
                  "5": {
                    "1": 0,
                    "2": 0,
                    "3": 0,
                    "4": 0,
                    "8": "xl"
                  }
                }
              }
            ],
            "3": [
              {
                "1": "column",
                "2": [
                  {
                    "1": "cross_align",
                    "2": {
                      "6": {
                        "1": "start"
                      }
                    }
                  },
                  {
                    "1": "spacing",
                    "2": {
                      "7": {
                        "1": "sm"
                      }
                    }
                  }
                ],
                "3": [
                  {
                    "1": "text",
                    "2": [
                      {
                        "1": "content",
                        "2": {
                          "7": {
                            "1": "Welcome!"
                          }
                        }
                      },
                      {
                        "1": "style",
                        "2": {
                          "13": {
                            "1": "title_large"
                          }
                        }
                      },
                      {
                        "1": "color",
                        "2": {
                          "4": {
                            "1": "on_primary"
                          }
                        }
                      },
                      {
                        "1": "font_weight",
                        "2": {
                          "7": {
                            "1": "bold"
                          }
                        }
                      }
                    ],
                    "5": "2577b5bc-2052-4069-9d3f-43e9313cb514"
                  },
                  {
                    "1": "text",
                    "2": [
                      {
                        "1": "content",
                        "2": {
                          "7": {
                            "1": "Select a module below to start calculating or managing your daily academic tasks."
                          }
                        }
                      },
                      {
                        "1": "color",
                        "2": {
                          "4": {
                            "1": "on_primary"
                          }
                        }
                      },
                      {
                        "1": "opacity",
                        "2": {
                          "10": {
                            "1": 0.9
                          }
                        }
                      },
                      {
                        "1": "style",
                        "2": {
                          "13": {
                            "1": "body_medium"
                          }
                        }
                      }
                    ],
                    "5": "8ee3c251-80c1-4c4d-aca6-566ea1215904"
                  }
                ],
                "5": "ffdf8f68-5527-4ec9-be6c-49f2628e10a2"
              }
            ],
            "5": "c35c57c6-f872-4093-8991-cd556f27be31"
          },
          {
            "1": "text",
            "2": [
              {
                "1": "content",
                "2": {
                  "7": {
                    "1": "CALCULATORS"
                  }
                }
              },
              {
                "1": "style",
                "2": {
                  "13": {
                    "1": "label_large"
                  }
                }
              },
              {
                "1": "color",
                "2": {
                  "4": {
                    "1": "secondary_text"
                  }
                }
              },
              {
                "1": "font_weight",
                "2": {
                  "7": {
                    "1": "bold"
                  }
                }
              },
              {
                "1": "margin",
                "2": {
                  "5": {
                    "1": 0,
                    "2": 0,
                    "3": 0,
                    "4": 0,
                    "8": "md"
                  }
                }
              }
            ],
            "5": "2480e86c-7f49-41ff-9939-2d290bf20bb9"
          },
          {
            "1": "@menu_card",
            "2": [
              {
                "1": "icon",
                "2": {
                  "7": {
                    "1": "device_thermostat_rounded"
                  }
                }
              },
              {
                "1": "title",
                "2": {
                  "7": {
                    "1": "Temperature Converter"
                  }
                }
              },
              {
                "1": "subtitle",
                "2": {
                  "7": {
                    "1": "Celsius to Fahrenheit conversion with formula support"
                  }
                }
              }
            ],
            "5": "0286c809-011d-4e1b-a4da-ab23249eab09"
          },
          {
            "1": "@menu_card",
            "2": [
              {
                "1": "icon",
                "2": {
                  "7": {
                    "1": "functions_rounded"
                  }
                }
              },
              {
                "1": "title",
                "2": {
                  "7": {
                    "1": "Average Calculator"
                  }
                }
              },
              {
                "1": "subtitle",
                "2": {
                  "7": {
                    "1": "Calculate arithmetic mean for three distinct grades"
                  }
                }
              }
            ],
            "5": "2da7a295-2206-40ff-a875-927d7f5bea4a"
          },
          {
            "1": "@menu_card",
            "2": [
              {
                "1": "icon",
                "2": {
                  "7": {
                    "1": "sell_rounded"
                  }
                }
              },
              {
                "1": "title",
                "2": {
                  "7": {
                    "1": "Discount Calculator"
                  }
                }
              },
              {
                "1": "subtitle",
                "2": {
                  "7": {
                    "1": "Product pricing with percentage discounts and history"
                  }
                }
              }
            ],
            "5": "fcd9d116-2733-43b2-86fb-b093bd561621"
          },
          {
            "1": "@menu_card",
            "2": [
              {
                "1": "icon",
                "2": {
                  "7": {
                    "1": "square_foot_rounded"
                  }
                }
              },
              {
                "1": "title",
                "2": {
                  "7": {
                    "1": "Area Calculator"
                  }
                }
              },
              {
                "1": "subtitle",
                "2": {
                  "7": {
                    "1": "Geometric rectangle area calculation (W × H)"
                  }
                }
              }
            ],
            "5": "fc1485a8-9d40-44e9-828a-54c5aa758e2b"
          },
          {
            "1": "sizedbox",
            "2": [
              {
                "1": "height",
                "2": {
                  "7": {
                    "1": "lg"
                  }
                }
              }
            ],
            "5": "1bf30048-bc3a-47d3-917c-d907d9ec191a"
          },
          {
            "1": "text",
            "2": [
              {
                "1": "content",
                "2": {
                  "7": {
                    "1": "ORGANIZATION"
                  }
                }
              },
              {
                "1": "style",
                "2": {
                  "13": {
                    "1": "label_large"
                  }
                }
              },
              {
                "1": "color",
                "2": {
                  "4": {
                    "1": "secondary_text"
                  }
                }
              },
              {
                "1": "font_weight",
                "2": {
                  "7": {
                    "1": "bold"
                  }
                }
              },
              {
                "1": "margin",
                "2": {
                  "5": {
                    "1": 0,
                    "2": 0,
                    "3": 0,
                    "4": 0,
                    "8": "md"
                  }
                }
              }
            ],
            "5": "330e05a6-a044-4bb0-a5a6-758df4cf972a"
          },
          {
            "1": "@menu_card",
            "2": [
              {
                "1": "icon",
                "2": {
                  "7": {
                    "1": "shopping_cart_rounded"
                  }
                }
              },
              {
                "1": "title",
                "2": {
                  "7": {
                    "1": "Shopping List"
                  }
                }
              },
              {
                "1": "subtitle",
                "2": {
                  "7": {
                    "1": "Manage items with checkable status and removal"
                  }
                }
              }
            ],
            "5": "9ccc4ce7-6c3f-4a8f-9205-de2fccbd9339"
          },
          {
            "1": "@menu_card",
            "2": [
              {
                "1": "icon",
                "2": {
                  "7": {
                    "1": "assignment_rounded"
                  }
                }
              },
              {
                "1": "title",
                "2": {
                  "7": {
                    "1": "Daily Tasks"
                  }
                }
              },
              {
                "1": "subtitle",
                "2": {
                  "7": {
                    "1": "Task management with priority levels and descriptions"
                  }
                }
              }
            ],
            "5": "cac4f088-5a92-4906-bc3f-1060ccbc6897"
          },
          {
            "1": "sizedbox",
            "2": [
              {
                "1": "height",
                "2": {
                  "7": {
                    "1": "xl"
                  }
                }
              }
            ],
            "5": "ba9be885-8a3f-417b-8464-848b4f145b6a"
          },
          {
            "1": "center",
            "3": [
              {
                "1": "column",
                "2": [
                  {
                    "1": "spacing",
                    "2": {
                      "7": {
                        "1": "xs"
                      }
                    }
                  }
                ],
                "3": [
                  {
                    "1": "text",
                    "2": [
                      {
                        "1": "content",
                        "2": {
                          "7": {
                            "1": "v1.0.4 • Academic Project"
                          }
                        }
                      },
                      {
                        "1": "style",
                        "2": {
                          "13": {
                            "1": "label_small"
                          }
                        }
                      },
                      {
                        "1": "color",
                        "2": {
                          "4": {
                            "1": "hint"
                          }
                        }
                      }
                    ],
                    "5": "c23ff80a-38b0-42c3-884a-b07472d6a233"
                  },
                  {
                    "1": "container",
                    "2": [
                      {
                        "1": "width",
                        "2": {
                          "1": {
                            "1": 40,
                            "2": false
                          }
                        }
                      },
                      {
                        "1": "height",
                        "2": {
                          "1": {
                            "1": 4,
                            "2": false
                          }
                        }
                      },
                      {
                        "1": "bg",
                        "2": {
                          "4": {
                            "1": "divider"
                          }
                        }
                      },
                      {
                        "1": "radius",
                        "2": {
                          "16": {
                            "1": 0,
                            "2": 0,
                            "3": 0,
                            "4": 0,
                            "5": "full"
                          }
                        }
                      }
                    ],
                    "5": "87c28cb5-0291-4ff8-90e3-2f26724d42b8"
                  }
                ],
                "5": "f0f5cb7e-ef87-4eee-812a-49b830f1dcfd"
              }
            ],
            "5": "f281e7d3-9fcb-43eb-9fc0-4f42fd743b03"
          }
        ],
        "5": "358939de-c192-4514-8486-744de2f7471d"
      }
    ],
    "5": "ea035576-4b75-4337-9f1e-af0189499ab6"
  },
  "2": [
    {
      "1": "menu_card",
      "2": {
        "1": "container",
        "2": [
          {
            "1": "bg",
            "2": {
              "4": {
                "1": "surface"
              }
            }
          },
          {
            "1": "radius",
            "2": {
              "16": {
                "1": 0,
                "2": 0,
                "3": 0,
                "4": 0,
                "5": "lg"
              }
            }
          },
          {
            "1": "padding",
            "2": {
              "5": {
                "1": 0,
                "2": 0,
                "3": 0,
                "4": 0,
                "5": "lg"
              }
            }
          },
          {
            "1": "margin",
            "2": {
              "5": {
                "1": 0,
                "2": 0,
                "3": 0,
                "4": 0,
                "8": "md"
              }
            }
          },
          {
            "1": "border",
            "2": {
              "22": {
                "1": 1,
                "2": "divider"
              }
            }
          },
          {
            "1": "shadow",
            "2": {
              "7": {
                "1": "sm"
              }
            }
          }
        ],
        "3": [
          {
            "1": "row",
            "2": [
              {
                "1": "spacing",
                "2": {
                  "7": {
                    "1": "md"
                  }
                }
              }
            ],
            "3": [
              {
                "1": "container",
                "2": [
                  {
                    "1": "width",
                    "2": {
                      "1": {
                        "1": 48,
                        "2": false
                      }
                    }
                  },
                  {
                    "1": "height",
                    "2": {
                      "1": {
                        "1": 48,
                        "2": false
                      }
                    }
                  },
                  {
                    "1": "bg",
                    "2": {
                      "4": {
                        "1": "background"
                      }
                    }
                  },
                  {
                    "1": "radius",
                    "2": {
                      "16": {
                        "1": 0,
                        "2": 0,
                        "3": 0,
                        "4": 0,
                        "5": "md"
                      }
                    }
                  },
                  {
                    "1": "align_child",
                    "2": {
                      "6": {
                        "1": "center"
                      }
                    }
                  }
                ],
                "3": [
                  {
                    "1": "icon",
                    "2": [
                      {
                        "1": "name",
                        "2": {
                          "17": {
                            "1": "icon"
                          }
                        }
                      },
                      {
                        "1": "color",
                        "2": {
                          "4": {
                            "1": "primary"
                          }
                        }
                      },
                      {
                        "1": "size",
                        "2": {
                          "10": {
                            "1": 24
                          }
                        }
                      }
                    ],
                    "5": "96fe8d9f-7dc3-4a56-a2ff-c75b051da641"
                  }
                ],
                "5": "2cc0dedf-d965-4fb6-83ce-87fcddf901c2"
              },
              {
                "1": "expanded",
                "3": [
                  {
                    "1": "column",
                    "2": [
                      {
                        "1": "cross_align",
                        "2": {
                          "6": {
                            "1": "start"
                          }
                        }
                      },
                      {
                        "1": "spacing",
                        "2": {
                          "7": {
                            "1": "xs"
                          }
                        }
                      }
                    ],
                    "3": [
                      {
                        "1": "text",
                        "2": [
                          {
                            "1": "content",
                            "2": {
                              "17": {
                                "1": "title"
                              }
                            }
                          },
                          {
                            "1": "style",
                            "2": {
                              "13": {
                                "1": "title_medium"
                              }
                            }
                          },
                          {
                            "1": "font_weight",
                            "2": {
                              "10": {
                                "1": 600
                              }
                            }
                          },
                          {
                            "1": "color",
                            "2": {
                              "4": {
                                "1": "primary_text"
                              }
                            }
                          }
                        ],
                        "5": "ef776dcc-a364-4e96-a538-39af3f54dc30"
                      },
                      {
                        "1": "text",
                        "2": [
                          {
                            "1": "content",
                            "2": {
                              "17": {
                                "1": "subtitle"
                              }
                            }
                          },
                          {
                            "1": "style",
                            "2": {
                              "13": {
                                "1": "body_small"
                              }
                            }
                          },
                          {
                            "1": "color",
                            "2": {
                              "4": {
                                "1": "secondary_text"
                              }
                            }
                          },
                          {
                            "1": "max_lines",
                            "2": {
                              "10": {
                                "1": 2
                              }
                            }
                          },
                          {
                            "1": "overflow",
                            "2": {
                              "7": {
                                "1": "ellipsis"
                              }
                            }
                          }
                        ],
                        "5": "48538822-12e0-4224-be87-6d09e66104fc"
                      }
                    ],
                    "5": "0921ac85-c670-4982-8527-772ef804d40f"
                  }
                ],
                "5": "6bac297b-2841-44cf-935b-a64203300cee"
              },
              {
                "1": "icon",
                "2": [
                  {
                    "1": "name",
                    "2": {
                      "11": {
                        "1": "chevron_right_rounded"
                      }
                    }
                  },
                  {
                    "1": "color",
                    "2": {
                      "4": {
                        "1": "hint"
                      }
                    }
                  },
                  {
                    "1": "size",
                    "2": {
                      "10": {
                        "1": 20
                      }
                    }
                  }
                ],
                "5": "81689a36-969c-4f9c-bd61-712d29c0a70a"
              }
            ],
            "5": "944ed163-f6de-48b9-89aa-6d411c2bbf78"
          }
        ],
        "5": "066444d1-c83b-478e-8672-ae4c888262de"
      }
    }
  ]
}
```