String users = """[
  {
    "id": 1,
    "name": "Ahmet",
    "username": "ahmet_123",
    "surname": "Yılmaz",
    "password": "ahmetpass",
    "department": {
      "id": 1,
      "name": "İK Departmanı"
    }
  },
  {
    "id": 2,
    "name": "Ayşe",
    "username": "ayse_456",
    "surname": "Demir",
    "password": "aysepass",
    "department": {
      "id": 2,
      "name": "Finans Departmanı"
    }
  },
  {
    "id": 3,
    "name": "Mehmet",
    "username": "mehmet_789",
    "surname": "Kaya",
    "password": "mehmetpass",
    "department": {
      "id": 3,
      "name": "Bilgi Teknolojileri Departmanı"
    }
  },
  {
    "id": 4,
    "name": "Fatma",
    "username": "fatma_1234",
    "surname": "Acar",
    "password": "fatmapass",
    "department": {
      "id": 4,
      "name": "Pazarlama Departmanı"
    }
  },
  {
    "id": 5,
    "name": "Ali",
    "username": "ali_5678",
    "surname": "Turan",
    "password": "alipass",
    "department": {
      "id": 5,
      "name": "Satış Departmanı"
    }
  },
  {
    "id": 6,
    "name": "Zeynep",
    "username": "zeynep_12",
    "surname": "Cansız",
    "password": "zeynepass",
    "department": {
      "id": 1,
      "name": "İK Departmanı"
    }
  },
  {
    "id": 7,
    "name": "Osman",
    "username": "osman_34",
    "surname": "Sarı",
    "password": "osmanpass",
    "department": {
      "id": 2,
      "name": "Finans Departmanı"
    }
  },
  {
    "id": 8,
    "name": "Aysun",
    "username": "aysun_56",
    "surname": "Erdoğan",
    "password": "aysunpass",
    "department": {
      "id": 3,
      "name": "Bilgi Teknolojileri Departmanı"
    }
  },
  {
    "id": 9,
    "name": "Hüseyin",
    "username": "huseyin_78",
    "surname": "Kurt",
    "password": "huseyinpass",
    "department": {
      "id": 4,
      "name": "Pazarlama Departmanı"
    }
  },
  {
    "id": 10,
    "name": "Seda",
    "username": "seda_90",
    "surname": "Güneş",
    "password": "sedapass",
    "department": {
      "id": 5,
      "name": "Satış Departmanı"
    }
  }
]
""";
String departments = """[
  {
    "id": 1,
    "name": "İK Departmanı"
  },
  {
    "id": 2,
    "name": "Finans Departmanı"
  },
  {
    "id": 3,
    "name": "Bilgi Teknolojileri Departmanı"
  },
  {
    "id": 4,
    "name": "Pazarlama Departmanı"
  },
  {
    "id": 5,
    "name": "Satış Departmanı"
  }
]
""";
String machines = """[
  {
    "id": 11,
    "name": "Makine X",
    "type": {"id": 1, "name" : "Dik Cnc"},
    "department": {
      "id": 1,
      "name": "İK Departmanı"
    }
  },
  {
    "id": 12,
    "name": "Makine Y",
    "type": {"id": 1, "name" : "Dik Cnc"},
    "department": {
      "id": 2,
      "name": "Finans Departmanı"
    }
  },
  {
    "id": 13,
    "name": "Makine Z",
    "type": {"id": 1, "name" : "Dik Cnc"},
    "department": {
      "id": 3,
      "name": "Bilgi Teknolojileri Departmanı"
    }
  },
  {
    "id": 14,
    "name": "Makine W",
    "type": {"id": 1, "name" : "Dik Cnc"},
    "department": {
      "id": 4,
      "name": "Pazarlama Departmanı"
    }
  },
  {
    "id": 15,
    "name": "Makine V",
    "type": {"id": 2, "name" : "Yatay Cnc"},
    "department": {
      "id": 5,
      "name": "Satış Departmanı"
    }
  },
  {
    "id": 16,
    "name": "Makine U",
    "type": {"id": 2, "name" : "Yatay Cnc"},
    "department": {
      "id": 1,
      "name": "İK Departmanı"
    }
  },
  {
    "id": 17,
    "name": "Makine T",
    "type": {"id": 2, "name" : "Yatay Cnc"},
    "department": {
      "id": 2,
      "name": "Finans Departmanı"
    }
  },
  {
    "id": 18,
    "name": "Makine S",
    "type": {"id": 2, "name" : "Yatay Cnc"},
    "department": {
      "id": 3,
      "name": "Bilgi Teknolojileri Departmanı"
    }
  },
  {
    "id": 19,
    "name": "Makine R",
    "type": {"id": 2, "name" : "Yatay Cnc"},
    "department": {
      "id": 4,
      "name": "Pazarlama Departmanı"
    }
  },
  {
    "id": 20,
    "name": "Makine Q",
    "type": {"id": 1, "name" : "Dik Cnc"},
    "department": {
      "id": 5,
      "name": "Satış Departmanı"
    }
  }
]
""";
String tasks = """[
    {
        "id": 1,
        "machine": {
            "id": 11,
            "name": "Makine X",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 1,
                "name": "İK Departmanı"
            }
        },
        "name": "Task 1",
        "created_by": {
            "id": 1,
            "name": "Ahmet",
            "surname": "Yılmaz",
            "username": "ahmet_123"
        },
        "created_at": "2023-09-29T08:00:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 2,
        "machine": {
            "id": 12,
            "name": "Makine Y",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 2,
                "name": "Finans Departmanı"
            }
        },
        "name": "Task 1",
        "created_by": {
            "id": 2,
            "name": "Ayşe",
            "surname": "Demir",
            "username": "ayse_456"
        },
        "created_at": "2023-09-29T08:30:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 3,
        "machine": {
            "id": 13,
            "name": "Makine Z",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 3,
                "name": "Bilgi Teknolojileri Departmanı"
            }
        },
        "name": "Task 1",
        "created_by": {
            "id": 3,
            "name": "Mehmet",
            "surname": "Kaya",
            "username": "mehmet_789"
        },
        "created_at": "2023-09-29T09:00:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 4,
        "machine": {
            "id": 14,
            "name": "Makine W",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 4,
                "name": "Pazarlama Departmanı"
            }
        },
        "name": "Task 2",
        "created_by": {
            "id": 4,
            "name": "Fatma",
            "surname": "Acar",
            "username": "fatma_1234"
        },
        "created_at": "2023-09-29T09:30:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 5,
        "machine": {
            "id": 15,
            "name": "Makine V",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 5,
                "name": "Satış Departmanı"
            }
        },
        "name": "Task 2",
        "created_by": {
            "id": 5,
            "name": "Ali",
            "surname": "Turan",
            "username": "ali_5678"
        },
        "created_at": "2023-09-29T10:00:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 6,
        "machine": {
            "id": 16,
            "name": "Makine U",
            "type":  {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 1,
                "name": "İK Departmanı"
            }
        },
        "name": "Task 3",
        "created_by": {
            "id": 6,
            "name": "Zeynep",
            "surname": "Cansız",
            "username": "zeynep_12"
        },
        "created_at": "2023-09-29T10:30:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 7,
        "machine": {
            "id": 17,
            "name": "Makine T",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 2,
                "name": "Finans Departmanı"
            }
        },
        "name": "Task 3",
        "created_by": {
            "id": 7,
            "name": "Can",
            "surname": "Öztürk",
            "username": "can_34"
        },
        "created_at": "2023-09-29T11:00:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 9,
        "machine": {
            "id": 19,
            "name": "Makine R",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 4,
                "name": "Pazarlama Departmanı"
            }
        },
        "name": "Task 5",
        "created_by": {
            "id": 9,
            "name": "Deniz",
            "surname": "Yılmaz",
            "username": "deniz_78"
        },
        "created_at": "2023-09-29T12:00:00Z",
        "status": true,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 10,
        "machine": {
            "id": 20,
            "name": "Makine Q",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 5,
                "name": "Satış Departmanı"
            }
        },
        "name": "Task 6",
        "created_by": {
            "id": 10,
            "name": "Elif",
            "surname": "Yılmaz",
            "username": "elif_90"
        },
        "created_at": "2023-09-29T12:30:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 11,
        "machine": {
            "id": 11,
            "name": "Makine X",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 1,
                "name": "İK Departmanı"
            }
        },
        "name": "Task 7",
        "created_by": {
            "id": 11,
            "name": "Eren",
            "surname": "Yılmaz",
            "username": "eren_123"
        },
        "created_at": "2023-09-29T13:00:00Z",
        "status": true,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 35,
        "machine": {
            "id": 11,
            "name": "Makine X",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 1,
                "name": "İK Departmanı"
            }
        },
        "name": "Task 7",
        "created_by": {
            "id": 11,
            "name": "Eren",
            "surname": "Yılmaz",
            "username": "eren_123"
        },
        "created_at": "2023-09-29T13:00:00Z",
        "status": null,
        "task_type": {
            "id": 2,
            "name": "Bitti"
        }
    },
    {
        "id": 12,
        "machine": {
            "id": 12,
            "name": "Makine Y",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 2,
                "name": "Finans Departmanı"
            }
        },
        "name": "Task 8",
        "created_by": {
            "id": 12,
            "name": "Ferhat",
            "surname": "Yılmaz",
            "username": "ferhat_456"
        },
        "created_at": "2023-09-29T13:30:00Z",
        "status": true,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 13,
        "machine": {
            "id": 13,
            "name": "Makine Z",
            "type":{"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 3,
                "name": "Bilgi Teknolojileri Departmanı"
            }
        },
        "name": "Task 9",
        "created_by": {
            "id": 13,
            "name": "Gizem",
            "surname": "Yılmaz",
            "username": "gizem_789"
        },
        "created_at": "2023-09-29T14:00:00Z",
        "status": true,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 14,
        "machine": {
            "id": 14,
            "name": "Makine W",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 4,
                "name": "Pazarlama Departmanı"
            }
        },
        "name": "Task 10",
        "created_by": {
            "id": 14,
            "name": "Canan",
            "surname": "Yılmaz",
            "username": "canan_1234"
        },
        "created_at": "2023-09-29T14:30:00Z",
        "status": true,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 36,
        "machine": {
            "id": 14,
            "name": "Makine W",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 4,
                "name": "Pazarlama Departmanı"
            }
        },
        "name": "Task 10",
        "created_by": {
            "id": 14,
            "name": "Canan",
            "surname": "Yılmaz",
            "username": "canan_1234"
        },
        "created_at": "2023-09-29T15:30:00Z",
        "status": false,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 15,
        "machine": {
            "id": 15,
            "name": "Makine V",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 5,
                "name": "Satış Departmanı"
            }
        },
        "name": "Task 11",
        "created_by": {
            "id": 15,
            "name": "Hakan",
            "surname": "Yılmaz",
            "username": "hakan_5678"
        },
        "created_at": "2023-09-29T15:00:00Z",
        "status": true,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 16,
        "machine": {
            "id": 16,
            "name": "Makine U",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 1,
                "name": "İK Departmanı"
            }
        },
        "name": "Task 12",
        "created_by": {
            "id": 16,
            "name": "İrem",
            "surname": "Yıldız",
            "username": "irem_12"
        },
        "created_at": "2023-09-29T15:30:00Z",
        "status": true,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 21,
        "machine": {
            "id": 17,
            "name": "Makine T",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 2,
                "name": "Finans Departmanı"
            }
        },
        "name": "Task 13",
        "created_by": {
            "id": 17,
            "name": "İsmail",
            "surname": "Öztürk",
            "username": "ismail_34"
        },
        "created_at": "2023-09-29T16:00:00Z",
        "status": false,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 17,
        "machine": {
            "id": 17,
            "name": "Makine T",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 2,
                "name": "Finans Departmanı"
            }
        },
        "name": "Task 13",
        "created_by": {
            "id": 17,
            "name": "İsmail",
            "surname": "Öztürk",
            "username": "ismail_34"
        },
        "created_at": "2023-09-29T16:00:00Z",
        "status": null,
        "task_type": {
            "id": 2,
            "name": "Bitti"
        }
    },
    {
        "id": 18,
        "machine": {
            "id": 18,
            "name": "Makine S",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 3,
                "name": "Bilgi Teknolojileri Departmanı"
            }
        },
        "name": "Task 14",
        "created_by": {
            "id": 18,
            "name": "Kemal",
            "surname": "Yılmaz",
            "username": "kemal_56"
        },
        "created_at": "2023-09-29T16:30:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    },
    {
        "id": 40,
        "machine": {
            "id": 18,
            "name": "Makine S",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 3,
                "name": "Bilgi Teknolojileri Departmanı"
            }
        },
        "name": "Task 14",
        "created_by": {
            "id": 18,
            "name": "Kemal",
            "surname": "Yılmaz",
            "username": "kemal_56"
        },
        "created_at": "2023-09-29T16:30:00Z",
        "status": false,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 19,
        "machine": {
            "id": 19,
            "name": "Makine R",
            "type": {"id": 2, "name" : "Yatay Cnc"},
            "department": {
                "id": 4,
                "name": "Pazarlama Departmanı"
            }
        },
        "name": "Task 15",
        "created_by": {
            "id": 19,
            "name": "Merve",
            "surname": "Yılmaz",
            "username": "merve_78"
        },
        "created_at": "2023-09-29T17:00:00Z",
        "status": true,
        "task_type": {
            "id": 1,
            "name": "Başladı"
        }
    },
    {
        "id": 20,
        "machine": {
            "id": 20,
            "name": "Makine Q",
            "type": {"id": 1, "name" : "Dik Cnc"},
            "department": {
                "id": 5,
                "name": "Satış Departmanı"
            }
        },
        "name": "Task 16",
        "created_by": {
            "id": 20,
            "name": "Mert",
            "surname": "Yılmaz",
            "username": "mert_90"
        },
        "created_at": "2023-09-29T17:30:00Z",
        "status": null,
        "task_type": {
            "id": 3,
            "name": "Makine Eklendi"
        }
    }
]
""";
