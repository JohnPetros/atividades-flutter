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
              "value": false
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
                  "top": 24,
                  "right": 20,
                  "bottom": 24,
                  "left": 20
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
                "type": "column",
                "properties": {
                  "cross_align": {
                    "align": {
                      "named": "start"
                    }
                  },
                  "spacing": {
                    "numberVal": {
                      "value": 8
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
                              "value": "Persistência Local"
                            }
                          },
                          "style": {
                            "textStyle": {
                              "styleName": "headline_small"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "primary_text"
                            }
                          },
                          "font_weight": {
                            "numberVal": {
                              "value": 800
                            }
                          }
                        },
                        "editorId": "49871e90-8b9a-4909-973b-85329e0b8fb6"
                      }
                    ],
                    "editorId": "4ddeb0cf-81ad-4194-90fe-afe28963f71a"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "Laboratório de Práticas Mobile"
                        }
                      },
                      "style": {
                        "textStyle": {
                          "styleName": "body_medium"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "secondary_text"
                        }
                      }
                    },
                    "editorId": "184e7b8c-7a5e-48bb-8a8b-90283d80557d"
                  }
                ],
                "editorId": "bd73c3b2-a740-4350-938f-bfd45679de87"
              }
            ],
            "editorId": "55274ced-11ec-4033-a7ba-7ded3e6e35ee"
          },
          {
            "type": "column",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 20,
                  "right": 20,
                  "bottom": 20,
                  "left": 20
                }
              },
              "spacing": {
                "numberVal": {
                  "value": 16
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
                  "spacing": {
                    "numberVal": {
                      "value": 8
                    }
                  },
                  "padding": {
                    "edgeInsets": {
                      "top": 0,
                      "right": 0,
                      "bottom": 8,
                      "left": 0
                    }
                  }
                },
                "children": [
                  {
                    "type": "icon",
                    "properties": {
                      "name": {
                        "icon": {
                          "name": "school_rounded"
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
                    "editorId": "87c25273-5f55-4678-a36c-dd7af3c63197"
                  },
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "Escolha um exercício para começar"
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
                    "editorId": "d8afd5af-181f-4a1e-a91a-a32ab59149d8"
                  }
                ],
                "editorId": "5243b30b-e31c-45de-b866-3951f371b721"
              },
              {
                "type": "@exercise_card",
                "properties": {
                  "icon": {
                    "stringVal": {
                      "value": "person_rounded"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "Perfil de Usuário"
                    }
                  },
                  "subtitle": {
                    "stringVal": {
                      "value": "Exercício 1"
                    }
                  },
                  "tech": {
                    "stringVal": {
                      "value": "▸ JSON"
                    }
                  },
                  "tech_color": {
                    "color": {
                      "color": "#F59E0B"
                    }
                  },
                  "badge_bg": {
                    "color": {
                      "color": "#F59E0B1A"
                    }
                  }
                },
                "editorId": "0bf01816-75a5-48eb-99d9-72610160ba7d"
              },
              {
                "type": "@exercise_card",
                "properties": {
                  "icon": {
                    "stringVal": {
                      "value": "payments_rounded"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "Gerenciador de Despesas"
                    }
                  },
                  "subtitle": {
                    "stringVal": {
                      "value": "Exercício 2"
                    }
                  },
                  "tech": {
                    "stringVal": {
                      "value": "▸ JSON"
                    }
                  },
                  "tech_color": {
                    "color": {
                      "color": "#F59E0B"
                    }
                  },
                  "badge_bg": {
                    "color": {
                      "color": "#F59E0B1A"
                    }
                  }
                },
                "editorId": "c20ff2bf-269b-4297-92eb-0c7046e294f6"
              },
              {
                "type": "@exercise_card",
                "properties": {
                  "icon": {
                    "stringVal": {
                      "value": "assignment_ind_rounded"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "Lista de Presença"
                    }
                  },
                  "subtitle": {
                    "stringVal": {
                      "value": "Exercício 3"
                    }
                  },
                  "tech": {
                    "stringVal": {
                      "value": "▸ SQLite"
                    }
                  },
                  "tech_color": {
                    "stringVal": {
                      "value": "primary"
                    }
                  },
                  "badge_bg": {
                    "color": {
                      "color": "#4FC3F71A"
                    }
                  }
                },
                "editorId": "8c6924ec-776b-4b22-abb0-33dd6f4da5c7"
              },
              {
                "type": "@exercise_card",
                "properties": {
                  "icon": {
                    "stringVal": {
                      "value": "inventory_2_rounded"
                    }
                  },
                  "title": {
                    "stringVal": {
                      "value": "Controle de Estoque"
                    }
                  },
                  "subtitle": {
                    "stringVal": {
                      "value": "Exercício 4"
                    }
                  },
                  "tech": {
                    "stringVal": {
                      "value": "▸ SQLite"
                    }
                  },
                  "tech_color": {
                    "stringVal": {
                      "value": "primary"
                    }
                  },
                  "badge_bg": {
                    "color": {
                      "color": "#4FC3F71A"
                    }
                  }
                },
                "editorId": "526301c4-8f11-421e-b5e9-612120a387ca"
              }
            ],
            "editorId": "8b655543-1da0-47bd-9cac-26eef4f3d741"
          },
          {
            "type": "spacer",
            "editorId": "0b2e7d0d-3b56-41ca-ac43-7195d794249a"
          },
          {
            "type": "container",
            "properties": {
              "padding": {
                "edgeInsets": {
                  "top": 24,
                  "right": 24,
                  "bottom": 24,
                  "left": 24
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
                    "numberVal": {
                      "value": 4
                    }
                  }
                },
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "stringVal": {
                          "value": "Status do Banco de Dados"
                        }
                      },
                      "color": {
                        "color": {
                          "color": "secondary_text"
                        }
                      },
                      "font_size": {
                        "numberVal": {
                          "value": 12
                        }
                      }
                    },
                    "editorId": "62954450-f703-4023-a2cb-4f28f6516ae6"
                  },
                  {
                    "type": "row",
                    "properties": {
                      "spacing": {
                        "numberVal": {
                          "value": 6
                        }
                      },
                      "align": {
                        "align": {
                          "named": "center"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "container",
                        "properties": {
                          "width": {
                            "px": {
                              "value": 8,
                              "isInfinity": false
                            }
                          },
                          "height": {
                            "px": {
                              "value": 8,
                              "isInfinity": false
                            }
                          },
                          "bg": {
                            "color": {
                              "color": "success"
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
                        "editorId": "ac019929-48d9-4ce0-8e71-dc62df8217b3"
                      },
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "SQLite Engine: Online"
                            }
                          },
                          "color": {
                            "color": {
                              "color": "success"
                            }
                          },
                          "font_size": {
                            "numberVal": {
                              "value": 12
                            }
                          },
                          "font_weight": {
                            "numberVal": {
                              "value": 600
                            }
                          }
                        },
                        "editorId": "0c820eb6-bb24-424a-a9be-01f635899b49"
                      }
                    ],
                    "editorId": "9f471fba-88f7-4f3a-9f03-36604d0ce167"
                  }
                ],
                "editorId": "475526db-3fbf-402f-bda5-4754f8ba49c0"
              }
            ],
            "editorId": "daa535b2-7a53-405b-87d3-d9c4e86436c5"
          }
        ],
        "editorId": "5731e54f-ff0f-4ce0-95cf-b4ced6ab3307"
      }
    ],
    "editorId": "05fe925b-3d22-4b46-89d7-415fef04b3af"
  },
  "components": [
    {
      "name": "exercise_card",
      "root": {
        "type": "container",
        "properties": {
          "bg": {
            "color": {
              "color": "surface"
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
          "border": {
            "border": {
              "width": 1,
              "color": "#2A4A6B"
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
          "margin": {
            "edgeInsets": {
              "top": 0,
              "right": 0,
              "bottom": 12,
              "left": 0
            }
          },
          "shadow": {
            "shadow": {
              "color": "#4FC3F714",
              "dx": 0,
              "dy": 2,
              "blur": 12,
              "spread": 0
            }
          }
        },
        "children": [
          {
            "type": "row",
            "properties": {
              "spacing": {
                "numberVal": {
                  "value": 16
                }
              }
            },
            "children": [
              {
                "type": "container",
                "properties": {
                  "width": {
                    "px": {
                      "value": 48,
                      "isInfinity": false
                    }
                  },
                  "height": {
                    "px": {
                      "value": 48,
                      "isInfinity": false
                    }
                  },
                  "bg": {
                    "color": {
                      "color": "#0D1B2A"
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 24,
                      "topRight": 24,
                      "bottomLeft": 24,
                      "bottomRight": 24
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "#2A4A6B"
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
                    "type": "icon",
                    "properties": {
                      "name": {
                        "slot": {
                          "name": "icon"
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
                    "editorId": "6ba1b360-9ba2-47f4-86ef-43f887857ea5"
                  }
                ],
                "editorId": "257c19fb-0d1c-43d6-a30f-c33e7ca37627"
              },
              {
                "type": "expanded",
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
                        "numberVal": {
                          "value": 4
                        }
                      }
                    },
                    "children": [
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
                        "editorId": "4ca67a49-3923-4d6e-846d-ebc30dec7e55"
                      },
                      {
                        "type": "row",
                        "properties": {
                          "spacing": {
                            "numberVal": {
                              "value": 8
                            }
                          }
                        },
                        "children": [
                          {
                            "type": "text",
                            "properties": {
                              "content": {
                                "slot": {
                                  "name": "subtitle"
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
                            "editorId": "51fb3d7b-9224-4cf4-ab4b-7fdaa5d1c94f"
                          },
                          {
                            "type": "container",
                            "properties": {
                              "bg": {
                                "slot": {
                                  "name": "badge_bg"
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
                              "padding": {
                                "edgeInsets": {
                                  "top": 2,
                                  "right": 8,
                                  "bottom": 2,
                                  "left": 8
                                }
                              }
                            },
                            "children": [
                              {
                                "type": "text",
                                "properties": {
                                  "content": {
                                    "slot": {
                                      "name": "tech"
                                    }
                                  },
                                  "color": {
                                    "slot": {
                                      "name": "tech_color"
                                    }
                                  },
                                  "font_size": {
                                    "numberVal": {
                                      "value": 11
                                    }
                                  },
                                  "font_weight": {
                                    "numberVal": {
                                      "value": 700
                                    }
                                  }
                                },
                                "editorId": "6af95d27-4f8d-40f3-ad8c-e897dcf3fb73"
                              }
                            ],
                            "editorId": "9bf83222-0b21-413c-9b96-538684d5c0fc"
                          }
                        ],
                        "editorId": "44084a57-43e1-47ac-b8ce-65d197cb0074"
                      }
                    ],
                    "editorId": "0eda62ad-901a-4306-a15a-f7b183f3df03"
                  }
                ],
                "editorId": "28a95914-8b11-4910-8945-ee31c6b2a31b"
              },
              {
                "type": "icon",
                "properties": {
                  "name": {
                    "icon": {
                      "name": "chevron_right_rounded"
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
                "editorId": "2cf4c975-4410-45ba-804e-9c51d7835f94"
              }
            ],
            "editorId": "5678bef1-ab65-449d-9316-7fe266acb319"
          }
        ],
        "editorId": "e1a32314-a745-47e5-9b64-9b87d84984ae"
      }
    }
  ]
}
```

screenshot: documentation\screenshots\Home Menu.png