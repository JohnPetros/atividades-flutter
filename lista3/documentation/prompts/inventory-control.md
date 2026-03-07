#### DslDocument (JSON)

```json
{
  "root": {
    "type": "scaffold",
    "properties": {
      "bg": {
        "color": {
          "color": "#0D1B2A"
        }
      },
      "safe_area": {
        "boolVal": {
          "value": true
        }
      }
    },
    "children": [
      {
        "type": "column",
        "properties": {
          "scroll": {
            "boolVal": {
              "value": true
            }
          },
          "cross_align": {
            "align": {
              "named": "stretch"
            }
          }
        },
        "children": [
          {
            "type": "container",
            "properties": {
              "bg": {
                "color": {
                  "color": "#1A2C42"
                }
              },
              "padding": {
                "edgeInsets": {
                  "top": 16,
                  "right": 16,
                  "bottom": 16,
                  "left": 16
                }
              },
              "shadow": {
                "shadow": {
                  "color": "#00000066",
                  "dx": 0,
                  "dy": 2,
                  "blur": 8,
                  "spread": 0
                }
              }
            },
            "children": [
              {
                "type": "row",
                "properties": {
                  "align": {
                    "align": {
                      "named": "space_between"
                    }
                  }
                },
                "children": [
                  {
                    "type": "row",
                    "properties": {
                      "spacing": {
                        "stringVal": {
                          "value": "md"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "iconbutton",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "arrow_back_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 24
                            }
                          }
                        },
                        "editorId": "97050e8e-9087-4a55-bd4d-813822cf7fbb"
                      },
                      {
                        "type": "column",
                        "properties": {
                          "cross_align": {
                            "align": {
                              "named": "start"
                            }
                          }
                        },
                        "children": [
                          {
                            "type": "text",
                            "properties": {
                              "content": {
                                "stringVal": {
                                  "value": "Controle de Estoque"
                                }
                              },
                              "style": {
                                "textStyle": {
                                  "styleName": "title_medium"
                                }
                              },
                              "color": {
                                "color": {
                                  "color": "primary_text"
                                }
                              },
                              "font_weight": {
                                "numberVal": {
                                  "value": 600
                                }
                              }
                            },
                            "editorId": "22b1f139-aa47-44db-aec4-f34b900e105a"
                          }
                        ],
                        "editorId": "2f4d4b3d-a377-4638-bdd4-7769750b0a05"
                      }
                    ],
                    "editorId": "c302a72a-27b4-4b4c-8655-c5a9c7cdc2e4"
                  },
                  {
                    "type": "container",
                    "properties": {
                      "bg": {
                        "color": {
                          "color": "#4FC3F71A"
                        }
                      },
                      "padding": {
                        "edgeInsets": {
                          "top": 4,
                          "right": 8,
                          "bottom": 4,
                          "left": 8
                        }
                      },
                      "radius": {
                        "radius": {
                          "topLeft": 4,
                          "topRight": 4,
                          "bottomLeft": 4,
                          "bottomRight": 4
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "▸ SQLite"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary"
                            }
                          },
                          "font_size": {
                            "numberVal": {
                              "value": 12
                            }
                          },
                          "font_weight": {
                            "stringVal": {
                              "value": "bold"
                            }
                          }
                        },
                        "editorId": "969c4cbe-781a-4762-bb4c-c642dc4c9293"
                      }
                    ],
                    "editorId": "efe38f44-8415-4ed3-a19e-f39407bf9d67"
                  }
                ],
                "editorId": "5fa27c3c-d19e-476e-93ba-e6eef7b9724c"
              }
            ],
            "editorId": "93fdfeaa-8fc4-45fb-b3c5-f3ff3f777b1d"
          },
          {
            "type": "column",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 20,
                  "right": 16,
                  "bottom": 20,
                  "left": 16
                }
              },
              "spacing": {
                "stringVal": {
                  "value": "lg"
                }
              },
              "cross_align": {
                "align": {
                  "named": "stretch"
                }
              }
            },
            "children": [
              {
                "type": "@inventory_input_field",
                "properties": {
                  "label": {
                    "stringVal": {
                      "value": "Nome do produto"
                    }
                  },
                  "hint": {
                    "stringVal": {
                      "value": "Ex: Caneta azul"
                    }
                  },
                  "keyboard": {
                    "stringVal": {
                      "value": "text"
                    }
                  }
                },
                "editorId": "7fcc8b84-f5d5-4121-b246-a287229cfbbd"
              },
              {
                "type": "@inventory_input_field",
                "properties": {
                  "label": {
                    "stringVal": {
                      "value": "Quantidade"
                    }
                  },
                  "hint": {
                    "stringVal": {
                      "value": "0"
                    }
                  },
                  "keyboard": {
                    "stringVal": {
                      "value": "number"
                    }
                  }
                },
                "editorId": "f76a1953-a076-421f-a4c0-9d19c5483425"
              },
              {
                "type": "button",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "Cadastrar Produto"
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "primary"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "#0D1B2A"
                    }
                  },
                  "font_weight": {
                    "numberVal": {
                      "value": 600
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 8,
                      "topRight": 8,
                      "bottomLeft": 8,
                      "bottomRight": 8
                    }
                  },
                  "icon": {
                    "icon": {
                      "name": "add_rounded"
                    }
                  },
                  "content_padding": {
                    "edgeInsets": {
                      "top": 16,
                      "right": 0,
                      "bottom": 16,
                      "left": 0
                    }
                  }
                },
                "editorId": "49058bea-a517-4f36-b640-d4650cdaaf7f"
              }
            ],
            "editorId": "8d56059e-009f-4a6b-92e4-be0d641bca10"
          },
          {
            "type": "row",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 16,
                  "bottom": 8,
                  "left": 16
                }
              },
              "spacing": {
                "stringVal": {
                  "value": "md"
                }
              }
            },
            "children": [
              {
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "Estoque Atual"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "label_large"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text"
                    }
                  },
                  "font_weight": {
                    "numberVal": {
                      "value": 500
                    }
                  }
                },
                "editorId": "6b03cc9e-d7c8-44a3-b720-470d37f50407"
              },
              {
                "type": "expanded",
                "children": [
                  {
                    "type": "divider",
                    "properties": {
                      "color": {
                        "color": {
                          "color": "#2A4A6B"
                        }
                      },
                      "thickness": {
                        "numberVal": {
                          "value": 1
                        }
                      }
                    },
                    "editorId": "50841b14-6e64-4112-baba-980115d74ee2"
                  }
                ],
                "editorId": "5121cfa9-3a30-4b42-b2f5-8793338c3629"
              },
              {
                "type": "container",
                "properties": {
                  "bg": {
                    "color": {
                      "color": "#1A2C42"
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 2,
                      "right": 8,
                      "bottom": 2,
                      "left": 8
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 12,
                      "topRight": 12,
                      "bottomLeft": 12,
                      "bottomRight": 12
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "4 Itens"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "label_small"
                        }
                      }
                    },
                    "editorId": "120901c6-65c6-4fcf-934d-a6921ec1688c"
                  }
                ],
                "editorId": "a352b207-29f7-4ce0-9234-30428375c7dd"
              }
            ],
            "editorId": "04ce32b4-8459-4b88-bfcf-179cbd721958"
          },
          {
            "type": "container",
            "properties": {
              "margin": {
                "edgeInsets": {
                  "top": 0,
                  "right": 16,
                  "bottom": 0,
                  "left": 16
                }
              },
              "radius": {
                "radius": {
                  "topLeft": 12,
                  "topRight": 12,
                  "bottomLeft": 12,
                  "bottomRight": 12
                }
              },
              "clip": {
                "boolVal": {
                  "value": true
                }
              },
              "border": {
                "border": {
                  "width": 1,
                  "color": "#2A4A6B"
                }
              }
            },
            "children": [
              {
                "type": "column",
                "properties": {
                  "spacing": {
                    "numberVal": {
                      "value": 0
                    }
                  }
                },
                "children": [
                  {
                    "type": "@inventory_item",
                    "properties": {
                      "name": {
                        "stringVal": {
                          "value": "Caneta Azul"
                        }
                      },
                      "quantity": {
                        "stringVal": {
                          "value": "50"
                        }
                      }
                    },
                    "editorId": "ea3d8256-cbbe-4fe5-b385-690b429c3817"
                  },
                  {
                    "type": "@inventory_item",
                    "properties": {
                      "name": {
                        "stringVal": {
                          "value": "Papel A4 (Resma)"
                        }
                      },
                      "quantity": {
                        "stringVal": {
                          "value": "12"
                        }
                      }
                    },
                    "editorId": "e524ef36-111a-4e05-9534-cdc0fb29da0f"
                  },
                  {
                    "type": "@inventory_item",
                    "properties": {
                      "name": {
                        "stringVal": {
                          "value": "Grampeador Metal"
                        }
                      },
                      "quantity": {
                        "stringVal": {
                          "value": "3"
                        }
                      }
                    },
                    "editorId": "684072d5-22cc-4cbb-aa58-5356fdfab735"
                  },
                  {
                    "type": "@inventory_item",
                    "properties": {
                      "name": {
                        "stringVal": {
                          "value": "Pasta Suspensa"
                        }
                      },
                      "quantity": {
                        "stringVal": {
                          "value": "25"
                        }
                      }
                    },
                    "editorId": "9a90a01c-0de4-41ce-8da6-7d7df505aa18"
                  }
                ],
                "editorId": "22eece65-3078-43d2-8ada-af2049780dac"
              }
            ],
            "editorId": "2d78ddf4-c8a5-403d-b533-12c86cffdaea"
          },
          {
            "type": "container",
            "properties": {
              "visible": {
                "boolVal": {
                  "value": false
                }
              },
              "padding": {
                "edgeInsets": {
                  "top": 40,
                  "right": 40,
                  "bottom": 40,
                  "left": 40
                }
              },
              "align_child": {
                "align": {
                  "named": "center"
                }
              }
            },
            "children": [
              {
                "type": "column",
                "properties": {
                  "spacing": {
                    "stringVal": {
                      "value": "md"
                    }
                  }
                },
                "children": [
                  {
                    "type": "icon",
                    "properties": {
                      "name": {
                        "icon": {
                          "name": "inventory_rounded"
                        }
                      },
                      "size": {
                        "numberVal": {
                          "value": 48
                        }
                      },
                      "color": {
                        "color": {
                          "color": "#2A4A6B"
                        }
                      }
                    },
                    "editorId": "70d6a3b0-8e77-44ff-84dd-3efe8bbaf7d6"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "Nenhum produto cadastrado"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "secondary_text"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "body_medium"
                        }
                      }
                    },
                    "editorId": "28e96096-27c0-4c74-8701-6ba758e44425"
                  }
                ],
                "editorId": "df56c5ed-c948-485b-b56a-75b11a2ae6eb"
              }
            ],
            "editorId": "01d6f0ec-7ed2-43f8-bebd-5867ccaf9e4f"
          },
          {
            "type": "sizedbox",
            "properties": {
              "height": {
                "px": {
                  "value": 40,
                  "isInfinity": false
                }
              }
            },
            "editorId": "81e5f808-7d2f-42a7-a769-dbbb26b54ec5"
          },
          {
            "type": "stack",
            "properties": {
              "align": {
                "align": {
                  "named": "bottom_center"
                }
              }
            },
            "children": [
              {
                "type": "container",
                "properties": {
                  "margin": {
                    "edgeInsets": {
                      "top": 24,
                      "right": 24,
                      "bottom": 24,
                      "left": 24
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 12,
                      "right": 16,
                      "bottom": 12,
                      "left": 16,
                      "topToken": "md",
                      "rightToken": "lg",
                      "bottomToken": "md",
                      "leftToken": "lg"
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "#1A2C42"
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 8,
                      "topRight": 8,
                      "bottomLeft": 8,
                      "bottomRight": 8
                    }
                  },
                  "border": {
                    "border": {
                      "width": 0,
                      "color": "transparent"
                    }
                  },
                  "shadow": {
                    "stringVal": {
                      "value": "lg"
                    }
                  }
                },
                "children": [
                  {
                    "type": "row",
                    "properties": {
                      "spacing": {
                        "stringVal": {
                          "value": "md"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "icon",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "check_circle_rounded"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "success"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 20
                            }
                          }
                        },
                        "editorId": "0ae9fa22-0059-47cb-bca2-e34dbc3e750d"
                      },
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "Produto cadastrado no SQLite!"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "body_medium"
                            }
                          }
                        },
                        "editorId": "82cd244b-f01f-4436-b58c-5d094eb70b60"
                      }
                    ],
                    "editorId": "77b3038f-f270-4f08-9800-eed5cbd6a7a4"
                  }
                ],
                "editorId": "7d0af5b6-10cd-4253-b6fe-475fbc568e0d"
              }
            ],
            "editorId": "2cecab30-2aa0-4412-bf7f-3cc3a58658ab"
          }
        ],
        "editorId": "b1f6d984-30e2-4a77-b542-90c7b2674c65"
      }
    ],
    "editorId": "466c96d7-b36e-451b-be80-8afe59d18fb1"
  },
  "components": [
    {
      "name": "inventory_input_field",
      "root": {
        "type": "column",
        "properties": {
          "cross_align": {
            "align": {
              "named": "start"
            }
          },
          "spacing": {
            "stringVal": {
              "value": "xs"
            }
          }
        },
        "children": [
          {
            "type": "text",
            "properties": {
              "content": {
                "slot": {
                  "name": "label"
                }
              },
              "style": {
                "textStyle": {
                  "styleName": "label_medium"
                }
              },
              "color": {
                "color": {
                  "color": "secondary_text"
                }
              }
            },
            "editorId": "b24d1e6b-a6b5-48fd-89ef-7fadb4fa4b7d"
          },
          {
            "type": "textfield",
            "properties": {
              "hint": {
                "slot": {
                  "name": "hint"
                }
              },
              "radius": {
                "radius": {
                  "topLeft": 8,
                  "topRight": 8,
                  "bottomLeft": 8,
                  "bottomRight": 8
                }
              },
              "filled": {
                "boolVal": {
                  "value": true
                }
              },
              "bg": {
                "color": {
                  "color": "surface"
                }
              },
              "border": {
                "border": {
                  "width": 1,
                  "color": "#2A4A6B"
                }
              },
              "keyboard": {
                "slot": {
                  "name": "keyboard"
                }
              },
              "hint_color": {
                "color": {
                  "color": "#8EACC8"
                }
              },
              "color": {
                "color": {
                  "color": "primary_text"
                }
              }
            },
            "editorId": "cc52662c-a84b-4b72-97f1-c3e7077e80a6"
          }
        ],
        "editorId": "4290e74f-3134-4772-8c2e-8f62a67a0953"
      }
    },
    {
      "name": "inventory_item",
      "root": {
        "type": "container",
        "properties": {
          "bg": {
            "color": {
              "color": "surface"
            }
          },
          "padding": {
            "edgeInsets": {
              "top": 14,
              "right": 16,
              "bottom": 14,
              "left": 16
            }
          },
          "margin": {
            "edgeInsets": {
              "top": 0,
              "right": 0,
              "bottom": 1,
              "left": 0
            }
          }
        },
        "children": [
          {
            "type": "row",
            "properties": {
              "spacing": {
                "stringVal": {
                  "value": "md"
                }
              }
            },
            "children": [
              {
                "type": "icon",
                "properties": {
                  "name": {
                    "icon": {
                      "name": "inventory_2_rounded"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text"
                    }
                  },
                  "size": {
                    "numberVal": {
                      "value": 18
                    }
                  }
                },
                "editorId": "8e49b348-0169-4145-b22f-359e15b60d61"
              },
              {
                "type": "expanded",
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "slot": {
                          "name": "name"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "body_medium"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary_text"
                        }
                      },
                      "max_lines": {
                        "numberVal": {
                          "value": 1
                        }
                      },
                      "overflow": {
                        "stringVal": {
                          "value": "ellipsis"
                        }
                      }
                    },
                    "editorId": "231d0997-a037-4eaf-9c13-ce0462067677"
                  }
                ],
                "editorId": "2a06ccd7-3596-4543-bbb6-2a5fdab993c1"
              },
              {
                "type": "container",
                "properties": {
                  "width": {
                    "px": {
                      "value": 1,
                      "isInfinity": false
                    }
                  },
                  "height": {
                    "px": {
                      "value": 24,
                      "isInfinity": false
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "#2A4A6B"
                    }
                  }
                },
                "editorId": "7b5381f1-7861-4e86-b1c6-1ca664a6afa2"
              },
              {
                "type": "row",
                "properties": {
                  "spacing": {
                    "stringVal": {
                      "value": "xs"
                    }
                  },
                  "main_size": {
                    "stringVal": {
                      "value": "min"
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "Qtd:"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "body_small"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "secondary_text"
                        }
                      }
                    },
                    "editorId": "0f6ecee8-7734-4b5a-a3f7-a1e6df8a7ca1"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "slot": {
                          "name": "quantity"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "body_medium"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary"
                        }
                      },
                      "font_weight": {
                        "stringVal": {
                          "value": "bold"
                        }
                      }
                    },
                    "editorId": "cef7d26d-806d-4776-b466-644574f6c37e"
                  }
                ],
                "editorId": "2d4660b9-cc25-4999-9c0f-7f3e806714e4"
              }
            ],
            "editorId": "13fb0fc8-6807-4576-91df-0846e9f6bcb1"
          }
        ],
        "editorId": "5c554ac3-7f4a-4519-b5fa-ed2199c06f11"
      }
    }
  ]
}
```

screenshot: documentation\screenshots\Inventory Control.png