### Tela de Lista de Compras

"An interactive list where users can type items to add them, with checkboxes to mark items as bought and delete icons."

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
            "1": "container",
            "2": [
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
                  "26": {
                    "1": "bottom",
                    "2": 1,
                    "3": "divider"
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
                                "1": "Lista de Compras"
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
                              "7": {
                                "1": "bold"
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
                        "5": "3b246499-4149-4a83-b8f1-04e233462e22"
                      },
                      {
                        "1": "icon",
                        "2": [
                          {
                            "1": "name",
                            "2": {
                              "11": {
                                "1": "shopping_basket_rounded"
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
                                "1": 28
                              }
                            }
                          }
                        ],
                        "5": "b598ce50-0bbb-4fb4-bb8e-5a5cd8da6660"
                      }
                    ],
                    "5": "6e2db3fb-829d-4e40-a235-b0ffae5bb675"
                  },
                  {
                    "1": "text",
                    "2": [
                      {
                        "1": "content",
                        "2": {
                          "7": {
                            "1": "Gerencie seus itens e organize suas idas ao mercado."
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
                            "1": "secondary_text"
                          }
                        }
                      }
                    ],
                    "5": "d22cfdf0-c22a-431b-828a-f960a0fa9fd4"
                  }
                ],
                "5": "7a3cf4dc-a58e-4df0-9461-307689253e6f"
              }
            ],
            "5": "c51bb868-9ee9-4635-865d-9f1f8c73e69a"
          },
          {
            "1": "container",
            "2": [
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
                "1": "column",
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
                        "1": "expanded",
                        "3": [
                          {
                            "1": "textfield",
                            "2": [
                              {
                                "1": "hint",
                                "2": {
                                  "7": {
                                    "1": "O que você precisa comprar?"
                                  }
                                }
                              },
                              {
                                "1": "prefix_icon",
                                "2": {
                                  "7": {
                                    "1": "add_shopping_cart_rounded"
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
                                "1": "filled",
                                "2": {
                                  "9": {
                                    "1": true
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
                              }
                            ],
                            "5": "3e32ea3e-32b9-4b0b-9018-5a23b9c6e61f"
                          }
                        ],
                        "5": "752e2f70-7326-4eea-b7e5-d3e6f8109e1b"
                      },
                      {
                        "1": "container",
                        "2": [
                          {
                            "1": "width",
                            "2": {
                              "1": {
                                "1": 56,
                                "2": false
                              }
                            }
                          },
                          {
                            "1": "height",
                            "2": {
                              "1": {
                                "1": 56,
                                "2": false
                              }
                            }
                          },
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
                            "1": "shadow",
                            "2": {
                              "7": {
                                "1": "sm"
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
                                    "1": "add_rounded"
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
                                "1": "size",
                                "2": {
                                  "10": {
                                    "1": 28
                                  }
                                }
                              }
                            ],
                            "5": "7d523bb5-6a9b-4c50-88b5-8662902ded0e"
                          }
                        ],
                        "5": "d53faebb-3e87-4ff9-90aa-9aa48eeb92aa"
                      }
                    ],
                    "5": "8dbd18e9-026d-4f4b-9a19-9fd209d62c58"
                  }
                ],
                "5": "cb3affa9-54a9-457d-a64b-8e15d3faa75a"
              }
            ],
            "5": "dea27a4c-85a9-4433-84c1-79df017c0ac5"
          },
          {
            "1": "column",
            "2": [
              {
                "1": "padding",
                "2": {
                  "5": {
                    "1": 0,
                    "2": 0,
                    "3": 0,
                    "4": 0,
                    "7": "lg",
                    "8": "lg",
                    "9": "lg"
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
                    "1": "padding",
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
                "3": [
                  {
                    "1": "text",
                    "2": [
                      {
                        "1": "content",
                        "2": {
                          "7": {
                            "1": "Itens na lista"
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
                    "5": "0ac5f475-abf3-4c6f-8bb9-9808dd6b4b3f"
                  },
                  {
                    "1": "container",
                    "2": [
                      {
                        "1": "bg",
                        "2": {
                          "4": {
                            "1": "secondary"
                          }
                        }
                      },
                      {
                        "1": "padding",
                        "2": {
                          "5": {
                            "1": 4,
                            "2": 12,
                            "3": 4,
                            "4": 12
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
                    "3": [
                      {
                        "1": "text",
                        "2": [
                          {
                            "1": "content",
                            "2": {
                              "7": {
                                "1": "3 itens"
                              }
                            }
                          },
                          {
                            "1": "style",
                            "2": {
                              "13": {
                                "1": "label_medium"
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
                        "5": "a2984422-7480-4d09-8c61-98b1e0d9f292"
                      }
                    ],
                    "5": "e6826524-ac05-400c-b0fa-f5dd75eea7f6"
                  }
                ],
                "5": "c8c7291f-83a0-4cfe-8bed-6814f94bf2aa"
              },
              {
                "1": "column",
                "2": [
                  {
                    "1": "spacing",
                    "2": {
                      "10": {
                        "1": 0
                      }
                    }
                  }
                ],
                "3": [
                  {
                    "1": "@shopping_item_card",
                    "2": [
                      {
                        "1": "name",
                        "2": {
                          "7": {
                            "1": "Leite Integral 1L"
                          }
                        }
                      },
                      {
                        "1": "added_at",
                        "2": {
                          "7": {
                            "1": "Adicionado hoje"
                          }
                        }
                      },
                      {
                        "1": "is_bought",
                        "2": {
                          "9": {
                            "1": false
                          }
                        }
                      }
                    ],
                    "5": "0e8d0421-2ebe-4703-97bc-ae55ab64d007"
                  },
                  {
                    "1": "@shopping_item_card",
                    "2": [
                      {
                        "1": "name",
                        "2": {
                          "7": {
                            "1": "Pão de Forma Artesanal"
                          }
                        }
                      },
                      {
                        "1": "added_at",
                        "2": {
                          "7": {
                            "1": "Adicionado hoje"
                          }
                        }
                      },
                      {
                        "1": "is_bought",
                        "2": {
                          "9": {
                            "1": false
                          }
                        }
                      }
                    ],
                    "5": "c3473642-9b1c-4bf3-b414-720d325c6a1f"
                  },
                  {
                    "1": "@shopping_item_card",
                    "2": [
                      {
                        "1": "name",
                        "2": {
                          "7": {
                            "1": "Café Torrado e Moído 500g"
                          }
                        }
                      },
                      {
                        "1": "added_at",
                        "2": {
                          "7": {
                            "1": "Adicionado ontem"
                          }
                        }
                      },
                      {
                        "1": "is_bought",
                        "2": {
                          "9": {
                            "1": false
                          }
                        }
                      }
                    ],
                    "5": "3ed6663d-e0a8-44b6-a944-77b855871abb"
                  }
                ],
                "5": "ffcc7c22-6b89-4da0-bbea-ee9005a6a7fa"
              },
              {
                "1": "sizedbox",
                "2": [
                  {
                    "1": "height",
                    "2": {
                      "7": {
                        "1": "md"
                      }
                    }
                  }
                ],
                "5": "824444d6-ae23-4a8f-ac16-7dd753a8a32c"
              },
              {
                "1": "row",
                "2": [
                  {
                    "1": "spacing",
                    "2": {
                      "7": {
                        "1": "sm"
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
                        "8": "sm"
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
                            "1": "task_alt_rounded"
                          }
                        }
                      },
                      {
                        "1": "color",
                        "2": {
                          "4": {
                            "1": "success"
                          }
                        }
                      },
                      {
                        "1": "size",
                        "2": {
                          "10": {
                            "1": 18
                          }
                        }
                      }
                    ],
                    "5": "a0654e4f-01cc-4c57-a262-b2325ceaee8b"
                  },
                  {
                    "1": "text",
                    "2": [
                      {
                        "1": "content",
                        "2": {
                          "7": {
                            "1": "Comprado"
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
                            "1": "success"
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
                    "5": "077d3ec7-a638-48be-81e4-113bb49aae13"
                  }
                ],
                "5": "55d71ff7-172b-4eee-a724-74411508b928"
              },
              {
                "1": "column",
                "2": [
                  {
                    "1": "spacing",
                    "2": {
                      "10": {
                        "1": 0
                      }
                    }
                  },
                  {
                    "1": "opacity",
                    "2": {
                      "10": {
                        "1": 0.8
                      }
                    }
                  }
                ],
                "3": [
                  {
                    "1": "@shopping_item_card",
                    "2": [
                      {
                        "1": "name",
                        "2": {
                          "7": {
                            "1": "Arroz Agulhinha 5kg"
                          }
                        }
                      },
                      {
                        "1": "is_bought",
                        "2": {
                          "9": {
                            "1": true
                          }
                        }
                      }
                    ],
                    "5": "f8c25213-5bb3-4d38-ba92-0ba8c05c64c8"
                  },
                  {
                    "1": "@shopping_item_card",
                    "2": [
                      {
                        "1": "name",
                        "2": {
                          "7": {
                            "1": "Detergente Neutro"
                          }
                        }
                      },
                      {
                        "1": "is_bought",
                        "2": {
                          "9": {
                            "1": true
                          }
                        }
                      }
                    ],
                    "5": "317e47ad-8b0c-4db2-a469-0697d92d8987"
                  }
                ],
                "5": "14ea80c5-a423-47df-b414-b23cb7091c70"
              }
            ],
            "5": "88d99951-c5b7-48e6-8105-87849b1e18c2"
          },
          {
            "1": "container",
            "2": [
              {
                "1": "visible",
                "2": {
                  "9": {
                    "1": false
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
                    "5": "xl"
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
                "1": "column",
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
                    "1": "icon",
                    "2": [
                      {
                        "1": "name",
                        "2": {
                          "11": {
                            "1": "inventory_2_outlined"
                          }
                        }
                      },
                      {
                        "1": "size",
                        "2": {
                          "10": {
                            "1": 64
                          }
                        }
                      },
                      {
                        "1": "color",
                        "2": {
                          "4": {
                            "1": "divider"
                          }
                        }
                      }
                    ],
                    "5": "fd7a6eaf-45de-4100-83f8-acf0407a5472"
                  },
                  {
                    "1": "text",
                    "2": [
                      {
                        "1": "content",
                        "2": {
                          "7": {
                            "1": "Sua lista está vazia"
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
                        "1": "color",
                        "2": {
                          "4": {
                            "1": "secondary_text"
                          }
                        }
                      }
                    ],
                    "5": "8117a0b9-430e-4fc8-9a7b-6a14e36791bc"
                  },
                  {
                    "1": "text",
                    "2": [
                      {
                        "1": "content",
                        "2": {
                          "7": {
                            "1": "Adicione itens acima para começar"
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
                            "1": "hint"
                          }
                        }
                      }
                    ],
                    "5": "c192ff62-0c58-4be8-8cae-1403ab3a4f2e"
                  }
                ],
                "5": "40ebe1d4-5b1f-4677-a61a-9b396f59a4a0"
              }
            ],
            "5": "2f8af936-e4bf-4508-af36-afd023494d60"
          }
        ],
        "5": "5bab4422-b7e0-42de-bfb4-2cd9a51e39ac"
      },
      {
        "1": "fab",
        "2": [
          {
            "1": "icon",
            "2": {
              "11": {
                "1": "share_rounded"
              }
            }
          },
          {
            "1": "label",
            "2": {
              "7": {
                "1": "Compartilhar"
              }
            }
          },
          {
            "1": "bg",
            "2": {
              "4": {
                "1": "primary"
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
          }
        ],
        "5": "27a02241-1746-416c-8194-359da5505770"
      }
    ],
    "5": "0da286bf-2379-42a9-9ae5-c38f5b042317"
  },
  "2": [
    {
      "1": "shopping_item_card",
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
                "5": "md"
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
                "8": "sm"
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
                        "1": 24,
                        "2": false
                      }
                    }
                  },
                  {
                    "1": "height",
                    "2": {
                      "1": {
                        "1": 24,
                        "2": false
                      }
                    }
                  },
                  {
                    "1": "radius",
                    "2": {
                      "16": {
                        "1": 6,
                        "2": 6,
                        "3": 6,
                        "4": 6
                      }
                    }
                  },
                  {
                    "1": "border",
                    "2": {
                      "23": {
                        "1": 2,
                        "2": {
                          "1": "is_bought",
                          "2": {
                            "7": {
                              "1": "success"
                            }
                          },
                          "3": {
                            "7": {
                              "1": "divider"
                            }
                          }
                        }
                      }
                    }
                  },
                  {
                    "1": "bg",
                    "2": {
                      "18": {
                        "1": "is_bought",
                        "2": {
                          "4": {
                            "1": "success"
                          }
                        },
                        "3": {
                          "4": {
                            "1": "transparent"
                          }
                        }
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
                            "1": "check_rounded"
                          }
                        }
                      },
                      {
                        "1": "size",
                        "2": {
                          "10": {
                            "1": 16
                          }
                        }
                      },
                      {
                        "1": "color",
                        "2": {
                          "4": {
                            "1": "on_surface"
                          }
                        }
                      },
                      {
                        "1": "visible",
                        "2": {
                          "17": {
                            "1": "is_bought"
                          }
                        }
                      }
                    ],
                    "5": "9655767a-1523-41da-9d8a-24d9bbf8db05"
                  }
                ],
                "5": "b4eb0978-7e55-4cbf-b65b-744307dd9e1e"
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
                          "10": {
                            "1": 2
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
                                "1": "name"
                              }
                            }
                          },
                          {
                            "1": "style",
                            "2": {
                              "13": {
                                "1": "body_large"
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
                          },
                          {
                            "1": "color",
                            "2": {
                              "18": {
                                "1": "is_bought",
                                "2": {
                                  "4": {
                                    "1": "secondary_text"
                                  }
                                },
                                "3": {
                                  "4": {
                                    "1": "primary_text"
                                  }
                                }
                              }
                            }
                          },
                          {
                            "1": "decoration",
                            "2": {
                              "18": {
                                "1": "is_bought",
                                "2": {
                                  "7": {
                                    "1": "strikethrough"
                                  }
                                },
                                "3": {
                                  "7": {
                                    "1": "none"
                                  }
                                }
                              }
                            }
                          }
                        ],
                        "5": "154a9c60-c2f1-4889-809b-f4057fa2d0d6"
                      },
                      {
                        "1": "text",
                        "2": [
                          {
                            "1": "content",
                            "2": {
                              "17": {
                                "1": "added_at"
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
                                "1": "secondary_text"
                              }
                            }
                          },
                          {
                            "1": "visible",
                            "2": {
                              "18": {
                                "1": "is_bought",
                                "2": {
                                  "9": {
                                    "1": false
                                  }
                                },
                                "3": {
                                  "9": {
                                    "1": true
                                  }
                                }
                              }
                            }
                          }
                        ],
                        "5": "cb3a2a78-3a39-410c-b70b-6ffbd4185627"
                      }
                    ],
                    "5": "c9c7d15a-b420-4696-a944-28dfa81e2bdd"
                  }
                ],
                "5": "728bc33a-5c05-4272-9a01-e107d70ea8d1"
              },
              {
                "1": "iconbutton",
                "2": [
                  {
                    "1": "name",
                    "2": {
                      "11": {
                        "1": "delete_outline_rounded"
                      }
                    }
                  },
                  {
                    "1": "color",
                    "2": {
                      "4": {
                        "1": "error"
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
                  },
                  {
                    "1": "opacity",
                    "2": {
                      "10": {
                        "1": 0.7
                      }
                    }
                  }
                ],
                "5": "1a1f9098-dc21-43ac-bd56-f82a32dcb8c5"
              }
            ],
            "5": "03ce2849-f6f6-4524-a2e8-801e3f5a0963"
          }
        ],
        "5": "5661e6df-3fe0-4922-9a09-7837c9fbdf44"
      }
    }
  ]
}
```