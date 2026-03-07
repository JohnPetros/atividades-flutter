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
      }
    },
    "children": [
      {
        "type": "stack",
        "properties": {
          "fit": {
            "stringVal": {
              "value": "expand"
            }
          }
        },
        "children": [
          {
            "type": "column",
            "properties": {
              "cross_align": {
                "align": {
                  "named": "stretch"
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
                "type": "@header",
                "properties": {
                  "title": {
                    "stringVal": {
                      "value": "Lista de Presença"
                    }
                  }
                },
                "editorId": "7dbabe7b-2ada-4d65-a53c-2a08f247865c"
              },
              {
                "type": "column",
                "properties": {
                  "scroll": {
                    "boolVal": {
                      "value": true
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
                  "spacing": {
                    "stringVal": {
                      "value": "xl"
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
                    "type": "column",
                    "properties": {
                      "cross_align": {
                        "align": {
                          "named": "stretch"
                        }
                      },
                      "spacing": {
                        "stringVal": {
                          "value": "sm"
                        }
                      }
                    },
                    "children": [
                      {
                        "type": "text",
                        "properties": {
                          "content": {
                            "stringVal": {
                              "value": "Nome do participante"
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
                        "editorId": "2a3fe419-770b-4e24-bb54-479ea01480bb"
                      },
                      {
                        "type": "row",
                        "properties": {
                          "spacing": {
                            "stringVal": {
                              "value": "md"
                            }
                          },
                          "cross_align": {
                            "align": {
                              "named": "center"
                            }
                          }
                        },
                        "children": [
                          {
                            "type": "expanded",
                            "children": [
                              {
                                "type": "textfield",
                                "properties": {
                                  "hint": {
                                    "stringVal": {
                                      "value": "Ex: Maria Souza"
                                    }
                                  },
                                  "filled": {
                                    "boolVal": {
                                      "value": true
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
                                  "border": {
                                    "border": {
                                      "width": 1,
                                      "color": "divider"
                                    }
                                  },
                                  "font_size": {
                                    "numberVal": {
                                      "value": 15
                                    }
                                  },
                                  "content_padding": {
                                    "edgeInsets": {
                                      "top": 0,
                                      "right": 0,
                                      "bottom": 0,
                                      "left": 0,
                                      "token": "md"
                                    }
                                  }
                                },
                                "editorId": "e9ac4c99-5398-41ab-844f-a657b936ede2"
                              }
                            ],
                            "editorId": "504f598e-eac5-4c37-a761-b65772a27bc4"
                          },
                          {
                            "type": "container",
                            "properties": {
                              "width": {
                                "px": {
                                  "value": 52,
                                  "isInfinity": false
                                }
                              },
                              "height": {
                                "px": {
                                  "value": 52,
                                  "isInfinity": false
                                }
                              },
                              "bg": {
                                "color": {
                                  "color": "primary"
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
                              "align_child": {
                                "align": {
                                  "named": "center"
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
                                "type": "icon",
                                "properties": {
                                  "name": {
                                    "icon": {
                                      "name": "add_rounded"
                                    }
                                  },
                                  "color": {
                                    "color": {
                                      "color": "on_primary"
                                    }
                                  },
                                  "size": {
                                    "numberVal": {
                                      "value": 24
                                    }
                                  }
                                },
                                "editorId": "3fbf7a32-b990-4eef-867c-418ede1c9583"
                              }
                            ],
                            "editorId": "2cd4330f-389e-483e-9342-ee9a89e03893"
                          }
                        ],
                        "editorId": "df24beee-2a43-4da9-8d87-39984c3a93cd"
                      },
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
                                  "value": "xs"
                                }
                              }
                            },
                            "children": [
                              {
                                "type": "text",
                                "properties": {
                                  "content": {
                                    "stringVal": {
                                      "value": "Presenças"
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
                                  }
                                },
                                "editorId": "20164a85-453f-486d-ab3f-1718c19b51c0"
                              },
                              {
                                "type": "text",
                                "properties": {
                                  "content": {
                                    "stringVal": {
                                      "value": "(3)"
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
                                  }
                                },
                                "editorId": "fcbc80fa-c47e-4dc2-9c3a-f263927eaff9"
                              }
                            ],
                            "editorId": "a021ec13-dbd9-4e49-aa49-dfc6fb0db2b6"
                          }
                        ],
                        "editorId": "e8ffd4dc-5429-41ba-8a03-952cc999776a"
                      },
                      {
                        "type": "container",
                        "properties": {
                          "visible": {
                            "boolVal": {
                              "value": true
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
                              "clip": {
                                "boolVal": {
                                  "value": true
                                }
                              }
                            },
                            "children": [
                              {
                                "type": "column",
                                "children": [
                                  {
                                    "type": "@participant_item",
                                    "properties": {
                                      "index": {
                                        "stringVal": {
                                          "value": "1"
                                        }
                                      },
                                      "name": {
                                        "stringVal": {
                                          "value": "Ana Lima"
                                        }
                                      }
                                    },
                                    "editorId": "ae20003a-6f74-49fc-803f-69649253b9a8"
                                  },
                                  {
                                    "type": "@participant_item",
                                    "properties": {
                                      "index": {
                                        "stringVal": {
                                          "value": "2"
                                        }
                                      },
                                      "name": {
                                        "stringVal": {
                                          "value": "Carlos Melo"
                                        }
                                      }
                                    },
                                    "editorId": "34732a82-4ba4-4e03-b7b6-ef09028ccb7d"
                                  },
                                  {
                                    "type": "@participant_item",
                                    "properties": {
                                      "index": {
                                        "stringVal": {
                                          "value": "3"
                                        }
                                      },
                                      "name": {
                                        "stringVal": {
                                          "value": "Maria Souza"
                                        }
                                      }
                                    },
                                    "editorId": "6025ea54-10e6-4db3-b297-e4d96ec1627c"
                                  }
                                ],
                                "editorId": "7d13ca1e-6da6-4688-ad18-35e893e7c408"
                              }
                            ],
                            "editorId": "39c24e0c-7e60-4e99-b94f-42436e7290be"
                          }
                        ],
                        "editorId": "639abb67-153d-4ec5-9157-ce664de29086"
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
                                      "name": "assignment_ind_outlined"
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
                                "editorId": "d63608da-8c2f-4116-9ff9-79c51569932a"
                              },
                              {
                                "type": "text",
                                "properties": {
                                  "content": {
                                    "stringVal": {
                                      "value": "Nenhuma presença registrada"
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
                                  },
                                  "text_align": {
                                    "align": {
                                      "named": "center"
                                    }
                                  }
                                },
                                "editorId": "c503f72a-ca4b-40d4-96f4-abf603ba6aae"
                              }
                            ],
                            "editorId": "3a1492bf-d1e8-4bcb-bd7e-e150fe6763a0"
                          }
                        ],
                        "editorId": "2fe27f2b-cf2e-43e7-9972-c716e201858c"
                      }
                    ],
                    "editorId": "28677111-2d71-4101-b9e1-70f733540316"
                  }
                ],
                "editorId": "5789da2d-628e-46e0-b0a8-77e1d8d07997"
              }
            ],
            "editorId": "5745d898-c363-4321-8388-d6b1728ee765"
          },
          {
            "type": "container",
            "properties": {
              "align": {
                "align": {
                  "named": "bottom_center"
                }
              },
              "padding": {
                "edgeInsets": {
                  "top": 0,
                  "right": 0,
                  "bottom": 0,
                  "left": 0,
                  "bottomToken": "xl"
                }
              }
            },
            "children": [
              {
                "type": "@toast_success",
                "properties": {
                  "visible": {
                    "boolVal": {
                      "value": true
                    }
                  },
                  "message": {
                    "stringVal": {
                      "value": "Participante adicionado com sucesso!"
                    }
                  }
                },
                "editorId": "2296bdeb-d5f3-476c-9ee1-eb637a260a8e"
              }
            ],
            "editorId": "00d03fea-2d20-4c70-bf7d-2e1a447313cd"
          }
        ],
        "editorId": "941ae19b-3775-4138-9796-57dd48ad7688"
      }
    ],
    "editorId": "145c9a45-598e-4878-b1a3-ad6ba066f896"
  },
  "components": [
    {
      "name": "header",
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
              "value": "xs"
            }
          },
          "border": {
            "borderSided": {
              "side": "bottom",
              "width": 1,
              "color": "divider"
            }
          },
          "align_child": {
            "align": {
              "named": "top_center"
            }
          },
          "align": {
            "align": {
              "named": "top_center"
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
                    "editorId": "6151413d-fb27-4533-8544-7ce8b46e3522"
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
                    "editorId": "17654629-ecc4-46fd-94a2-c368ff7202b0"
                  }
                ],
                "editorId": "8d5294b9-c017-45d1-af9d-a82d59a17065"
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
                      "right": 12,
                      "bottom": 4,
                      "left": 12
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 0,
                      "topRight": 0,
                      "bottomLeft": 0,
                      "bottomRight": 0,
                      "token": "sm"
                    }
                  },
                  "border": {
                    "border": {
                      "width": 1,
                      "color": "#4FC3F733"
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
                      "style": {
                        "textStyle": {
                          "styleName": "label_small"
                        }
                      },
                      "font_weight": {
                        "numberVal": {
                          "value": 700
                        }
                      }
                    },
                    "editorId": "e2a08d78-fc80-43cf-bbda-bf74ab85f102"
                  }
                ],
                "editorId": "2801ce01-bf5c-4129-86fb-cdac68fc40d4"
              }
            ],
            "editorId": "cda2091d-4aa5-4ecd-ae97-e91beca8e153"
          }
        ],
        "editorId": "c30a1c95-ac7f-4afa-98f2-95729fbbee05"
      }
    },
    {
      "name": "participant_item",
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
          "border": {
            "borderSided": {
              "side": "bottom",
              "width": 1,
              "color": "#2A4A6B66"
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
                      "color": "primary"
                    }
                  },
                  "radius": {
                    "radius": {
                      "topLeft": 0,
                      "topRight": 0,
                      "bottomLeft": 0,
                      "bottomRight": 0,
                      "token": "full"
                    }
                  },
                  "shadow": {
                    "shadow": {
                      "color": "#4FC3F74D",
                      "dx": 0,
                      "dy": 0,
                      "blur": 8,
                      "spread": 0
                    }
                  }
                },
                "editorId": "05137d73-18b4-4118-afdc-696f1d5a6260"
              },
              {
                "type": "expanded",
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "interpolatedString": {
                          "parts": [
                            {
                              "slot": "index"
                            },
                            {
                              "literal": ". "
                            },
                            {
                              "slot": "name"
                            }
                          ]
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
                    "editorId": "9b142233-7bc8-4f6b-99ad-c8d177b60591"
                  }
                ],
                "editorId": "a364aac9-f0b9-4c87-9823-e9094d543a55"
              }
            ],
            "editorId": "1fc6a094-0817-48dd-8cfb-4933256ae1d7"
          }
        ],
        "editorId": "71178aed-f72b-4f00-8afd-c24311c97060"
      }
    },
    {
      "name": "toast_success",
      "root": {
        "type": "container",
        "properties": {
          "margin": {
            "edgeInsets": {
              "top": 0,
              "right": 0,
              "bottom": 0,
              "left": 0,
              "token": "lg"
            }
          },
          "padding": {
            "edgeInsets": {
              "top": 0,
              "right": 0,
              "bottom": 0,
              "left": 0,
              "token": "md"
            }
          },
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
              "token": "md"
            }
          },
          "border": {
            "borderSided": {
              "side": "left",
              "width": 4,
              "color": "success"
            }
          },
          "shadow": {
            "stringVal": {
              "value": "lg"
            }
          },
          "visible": {
            "slot": {
              "name": "visible"
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
                "editorId": "9751a3fc-bcac-4d4d-8e4c-53e1552fe9ca"
              },
              {
                "type": "expanded",
                "children": [
                  {
                    "type": "text",
                    "properties": {
                      "content": {
                        "slot": {
                          "name": "message"
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
                    "editorId": "b9e638a9-dd55-4a13-8b51-bb50c3869db8"
                  }
                ],
                "editorId": "b495479c-2d00-4ebf-b0fb-0afc40bcfe83"
              }
            ],
            "editorId": "c060f99e-edd8-4a79-a786-7e367ecf6fc3"
          }
        ],
        "editorId": "556ed936-1427-47d6-b555-baeec25862b7"
      }
    }
  ]
}
```

screenshot: documentation\screenshots\Attendance List.png