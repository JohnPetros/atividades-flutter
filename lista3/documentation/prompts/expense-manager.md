#### DslDocument (JSON)

```json
{
  "root": {
    "type": "scaffold",
    "properties": {
      "bg": {
        "color": {
          "color": "background"
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
            "type": "@exercise_header",
            "properties": {
              "title": {
                "stringVal": {
                  "value": "Gerenciador de Despesas"
                }
              }
            },
            "editorId": "93239aa4-64ea-4ab6-9161-fd9c0790d1d7"
          },
          {
            "type": "column",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "token": "lg"
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
                "type": "container",
                "properties": {
                  "bg": {
                    "color": {
                      "color": "surface"
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 0,
                      "right": 0,
                      "bottom": 0,
                      "left": 0,
                      "token": "lg"
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 0,
                      "topRight": 0,
                      "bottomLeft": 0,
                      "bottomRight": 0,
                      "token": "lg"
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "divider"
                    }
                  },
                  "shadow": {
                    "stringVal": {
                      "value": "sm"
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
                      },
                      "cross_align": {
                        "align": {
                          "named": "stretch"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "column",
                        "properties": {
                          "spacing": {
                            "stringVal": {
                              "value": "xs"
                            }
                          },
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
                                  "value": "Descrição"
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
                            "editorId": "583db81e-1d97-4974-ad27-cc49827991d9"
                          },
                          {
                            "type": "textfield",
                            "properties": {
                              "hint": {
                                "stringVal": {
                                  "value": "Ex: Almoço no Centro"
                                }
                              },
                              "prefix_icon": {
                                "stringVal": {
                                  "value": "description_rounded"
                                }
                              },
                              "radius": {
                                "radius": {
                                  "topLeft": 0,
                                  "topRight": 0,
                                  "bottomLeft": 0,
                                  "bottomRight": 0,
                                  "token": "md"
                                }
                              },
                              "filled": {
                                "boolVal": {
                                  "value": true
                                }
                              },
                              "bg": {
                                "color": {
                                  "color": "background"
                                }
                              }
                            },
                            "editorId": "be9968ec-f302-4a9f-b70b-fea08a78ca78"
                          }
                        ],
                        "editorId": "0c917874-5b36-472f-ace6-9eef1f397b92"
                      },
                      {
                        "type": "column",
                        "properties": {
                          "spacing": {
                            "stringVal": {
                              "value": "xs"
                            }
                          },
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
                                  "value": "Valor (R$)"
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
                            "editorId": "fe316abd-e6cb-49b6-a2b3-00c0e1ccf56e"
                          },
                          {
                            "type": "textfield",
                            "properties": {
                              "hint": {
                                "stringVal": {
                                  "value": "0,00"
                                }
                              },
                              "prefix_icon": {
                                "stringVal": {
                                  "value": "payments_rounded"
                                }
                              },
                              "keyboard": {
                                "stringVal": {
                                  "value": "number"
                                }
                              },
                              "radius": {
                                "radius": {
                                  "topLeft": 0,
                                  "topRight": 0,
                                  "bottomLeft": 0,
                                  "bottomRight": 0,
                                  "token": "md"
                                }
                              },
                              "filled": {
                                "boolVal": {
                                  "value": true
                                }
                              },
                              "bg": {
                                "color": {
                                  "color": "background"
                                }
                              }
                            },
                            "editorId": "9c558101-9a99-4ab6-95b5-44ed9dce3ce8"
                          }
                        ],
                        "editorId": "854128d9-2153-48cc-bab7-beaeebab0350"
                      },
                      {
                        "type": "sizedbox",
                        "properties": {
                          "height": {
                            "stringVal": {
                              "value": "xs"
                            }
                          }
                        },
                        "editorId": "8e789b50-343f-4442-81ce-ec93c8ee1c92"
                      },
                      {
                        "type": "button",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "Adicionar Despesa"
                            }
                          },
                          "icon": {
                            "icon": {
                              "name": "add_rounded"
                            }
                          },
                          "bg": {
                            "color": {
                              "color": "primary"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "on_surface"
                            }
                          },
                          "font_weight": {
                            "numberVal": {
                              "value": 700
                            }
                          },
                          "radius": {
                            "radius": {
                              "topLeft": 0,
                              "topRight": 0,
                              "bottomLeft": 0,
                              "bottomRight": 0,
                              "token": "md"
                            }
                          },
                          "content_padding": {
                            "edgeInsets": {
                              "top": 0,
                              "right": 0,
                              "bottom": 0,
                              "left": 0,
                              "topToken": "lg",
                              "rightToken": "md",
                              "bottomToken": "lg",
                              "leftToken": "md"
                            }
                          },
                          "full_width": {
                            "boolVal": {
                              "value": true
                            }
                          }
                        },
                        "editorId": "1699580d-f0bf-4560-9deb-d0b06a88f823"
                      }
                    ],
                    "editorId": "d6571f3e-371d-4382-8324-58d2cf8e7ecb"
                  }
                ],
                "editorId": "23c0bdcd-2222-4f9f-b8b7-ceff9167d464"
              }
            ],
            "editorId": "dbaa1232-a69f-4d15-81ce-e46a4ce66131"
          },
          {
            "type": "column",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "rightToken": "lg",
                  "leftToken": "lg"
                }
              },
              "spacing": {
                "stringVal": {
                  "value": "md"
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
                "type": "text",
                "properties": {
                  "content": {
                    "stringVal": {
                      "value": "Visão Geral"
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "title_small"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "secondary_text"
                    }
                  },
                  "margin": {
                    "edgeInsets": {
                      "top": 0,
                      "right": 0,
                      "bottom": 0,
                      "left": 4
                    }
                  }
                },
                "editorId": "35b06f12-2bd7-4a20-bac8-9a0fecb5fb03"
              },
              {
                "type": "container",
                "properties": {
                  "bg": {
                    "color": {
                      "color": "surface"
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 0,
                      "topRight": 0,
                      "bottomLeft": 0,
                      "bottomRight": 0,
                      "token": "lg"
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 0,
                      "right": 0,
                      "bottom": 0,
                      "left": 0,
                      "token": "lg"
                    }
                  },
                  "height": {
                    "px": {
                      "value": 200,
                      "isInfinity": false
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "divider"
                    }
                  }
                },
                "children": [
                  {
                    "type": "bar_chart",
                    "properties": {
                      "data": {
                        "stringVal": {
                          "value": "45,80,35,120,60"
                        }
                      },
                      "labels": {
                        "stringVal": {
                          "value": "Seg,Ter,Qua,Qui,Sex"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "primary"
                        }
                      },
                      "bar_width": {
                        "numberVal": {
                          "value": 24
                        }
                      },
                      "bar_radius": {
                        "numberVal": {
                          "value": 4
                        }
                      },
                      "show_grid": {
                        "boolVal": {
                          "value": false
                        }
                      }
                    },
                    "editorId": "85790959-f40d-4dde-b938-c91fc58dc9a7"
                  }
                ],
                "editorId": "e92838c6-d7bf-4531-996e-adea73d3013f"
              }
            ],
            "editorId": "b155c220-a87e-4e9f-9636-9a416863972d"
          },
          {
            "type": "column",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "token": "lg"
                }
              },
              "spacing": {
                "stringVal": {
                  "value": "md"
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
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "Histórico de Gastos"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "title_small"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "secondary_text"
                        }
                      }
                    },
                    "editorId": "738f11af-aeb4-4e76-924c-66bde82b7dab"
                  },
                  {
                    "type": "container",
                    "properties": {
                      "bg": {
                        "color": {
                          "color": "surface"
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
                              "value": "5 itens"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "label_small"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary"
                            }
                          }
                        },
                        "editorId": "c9b1078f-337e-4812-bd56-0dc46416ba36"
                      }
                    ],
                    "editorId": "0123d652-d0c9-4a73-8680-a26133f29367"
                  }
                ],
                "editorId": "290add8e-3fd0-42ab-a4a5-f045921235a8"
              },
              {
                "type": "@expense_item",
                "properties": {
                  "description": {
                    "stringVal": {
                      "value": "Supermercado Mensal"
                    }
                  },
                  "date": {
                    "stringVal": {
                      "value": "Hoje, 14:30"
                    }
                  },
                  "value": {
                    "stringVal": {
                      "value": "450,20"
                    }
                  }
                },
                "editorId": "2c1c6f55-9ea8-4600-a3e3-5d747206451d"
              },
              {
                "type": "@expense_item",
                "properties": {
                  "description": {
                    "stringVal": {
                      "value": "Assinatura Streaming"
                    }
                  },
                  "date": {
                    "stringVal": {
                      "value": "Ontem"
                    }
                  },
                  "value": {
                    "stringVal": {
                      "value": "34,90"
                    }
                  }
                },
                "editorId": "7a295f37-aa57-4633-bd05-7b0b9ed3b662"
              },
              {
                "type": "@expense_item",
                "properties": {
                  "description": {
                    "stringVal": {
                      "value": "Gasolina"
                    }
                  },
                  "date": {
                    "stringVal": {
                      "value": "22 Out"
                    }
                  },
                  "value": {
                    "stringVal": {
                      "value": "210,00"
                    }
                  }
                },
                "editorId": "01e322ad-259d-469e-8fb4-a9d31b09c82a"
              },
              {
                "type": "@expense_item",
                "properties": {
                  "description": {
                    "stringVal": {
                      "value": "Café Expresso"
                    }
                  },
                  "date": {
                    "stringVal": {
                      "value": "21 Out"
                    }
                  },
                  "value": {
                    "stringVal": {
                      "value": "8,50"
                    }
                  }
                },
                "editorId": "db4319f4-c7ee-4e25-bf67-021ae60baa20"
              },
              {
                "type": "@expense_item",
                "properties": {
                  "description": {
                    "stringVal": {
                      "value": "Academia"
                    }
                  },
                  "date": {
                    "stringVal": {
                      "value": "20 Out"
                    }
                  },
                  "value": {
                    "stringVal": {
                      "value": "120,00"
                    }
                  }
                },
                "editorId": "8872c610-6ac3-45b1-89eb-f2ded04f569d"
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
                      "top": 0,
                      "right": 0,
                      "bottom": 0,
                      "left": 0,
                      "token": "xl"
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
                              "name": "receipt_long_rounded"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 64
                            }
                          },
                          "color": {
                            "color": {
                              "color": "divider"
                            }
                          }
                        },
                        "editorId": "8441b4bd-4c4d-43ba-babe-5aea3363fdf4"
                      },
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "Nenhum gasto registrado ainda"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "secondary_text"
                            }
                          },
                          "text_align": {
                            "align": {
                              "named": "center"
                            }
                          }
                        },
                        "editorId": "0377c9c0-626d-4a94-a8a6-ce44c949ebc5"
                      }
                    ],
                    "editorId": "a8b80c67-5690-444b-ac86-52610b73d469"
                  }
                ],
                "editorId": "d36e974f-cf15-4a13-b591-3340a3ff1868"
              }
            ],
            "editorId": "e4afa8eb-4956-4c6d-8d91-baba3e4d07db"
          },
          {
            "type": "sizedbox",
            "properties": {
              "height": {
                "stringVal": {
                  "value": "xl"
                }
              }
            },
            "editorId": "0c65201d-ccb8-4423-9cf5-79c5e18e1e08"
          }
        ],
        "editorId": "69000228-3dfe-449c-9c25-7510cc4f0085"
      }
    ],
    "editorId": "887b42af-3da9-43f6-b512-f36158f2ed91"
  },
  "components": [
    {
      "name": "exercise_header",
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
              "top": 0,
              "right": 0,
              "bottom": 0,
              "left": 0,
              "topToken": "md",
              "rightToken": "lg",
              "bottomToken": "md",
              "leftToken": "lg"
            }
          },
          "shadow": {
            "stringVal": {
              "value": "md"
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
            "type": "row",
            "properties": {
              "align": {
                "align": {
                  "named": "space_between"
                }
              },
              "cross_align": {
                "align": {
                  "named": "center"
                }
              },
              "main_align": {
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
                    "editorId": "98a1bdf7-1aaf-48d6-a66b-315458161880"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "slot": {
                          "name": "title"
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
                    "editorId": "5cceed21-5bdf-4fd3-a9c0-b3109aceb83e"
                  }
                ],
                "editorId": "cfc6224e-22e8-47c6-baee-10357d604bd1"
              },
              {
                "type": "container",
                "properties": {
                  "bg": {
                    "color": {
                      "color": "#F59E0B1A"
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 4,
                      "right": 10,
                      "bottom": 4,
                      "left": 10
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 4,
                      "topRight": 4,
                      "bottomLeft": 4,
                      "bottomRight": 4
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "#F59E0B44"
                    }
                  }
                },
                "children": [
                  {
                    "type": "row",
                    "properties": {
                      "spacing": {
                        "numberVal": {
                          "value": 4
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "icon",
                        "properties": {
                          "name": {
                            "icon": {
                              "name": "code"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "#F59E0B"
                            }
                          },
                          "size": {
                            "numberVal": {
                              "value": 14
                            }
                          }
                        },
                        "editorId": "d5e5b561-1373-41e0-b42a-d2e4e6ce5b40"
                      },
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "JSON"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "#F59E0B"
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
                        "editorId": "39065139-046d-4994-8996-674d393a9f35"
                      }
                    ],
                    "editorId": "52ffa23c-ca8b-4105-ae1e-a6a377ba0747"
                  }
                ],
                "editorId": "7c2cd804-1999-43c3-837c-8ede68503615"
              }
            ],
            "editorId": "5d63dce0-b765-45e1-9f9f-a5e91097dbcb"
          }
        ],
        "editorId": "20d7c119-5f23-4abb-b3da-c6e724a7fa88"
      }
    },
    {
      "name": "expense_item",
      "root": {
        "type": "container",
        "properties": {
          "padding": {
            "edgeInsets": {
              "top": 0,
              "right": 0,
              "bottom": 0,
              "left": 0,
              "token": "md"
            }
          },
          "margin": {
            "edgeInsets": {
              "top": 0,
              "right": 0,
              "bottom": 0,
              "left": 0,
              "bottomToken": "sm"
            }
          },
          "radius": {
            "radius": {
              "topLeft": 0,
              "topRight": 0,
              "bottomLeft": 0,
              "bottomRight": 0,
              "token": "md"
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
              "color": "divider"
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
                  },
                  "expanded": {
                    "expanded": {
                      "enabled": true,
                      "flex": 1
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "slot": {
                          "name": "description"
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
                    "editorId": "f50f1c55-53e6-42a4-b178-6892df30b8ec"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "slot": {
                          "name": "date"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "label_small"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "secondary_text"
                        }
                      }
                    },
                    "editorId": "df29a87d-5358-4ac3-acf1-2efb15752f25"
                  }
                ],
                "editorId": "2fa31ce7-d842-40e2-b9d8-a33282ea75a0"
              },
              {
                "type": "text",
                "properties": {
                  "content": {
                    "interpolatedString": {
                      "parts": [
                        {
                          "literal": "R$ "
                        },
                        {
                          "slot": "value"
                        }
                      ]
                    }
                  },
                  "style": {
                    "textStyle": {
                      "styleName": "title_medium"
                    }
                  },
                  "color": {
                    "color": {
                      "color": "primary"
                    }
                  },
                  "font_weight": {
                    "numberVal": {
                      "value": 700
                    }
                  }
                },
                "editorId": "19b8d9ab-e662-4c17-a3d5-df0e719123d4"
              }
            ],
            "editorId": "7e2c1cd7-244d-4495-9268-718345188cd4"
          }
        ],
        "editorId": "1548ca4c-99af-4acb-b758-54c4d32fb305"
      }
    }
  ]
}
```

screenshot: documentation\screenshots\Expense Manager.png