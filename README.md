# LINUX PROJETO IaC V1

Este projeto foi desenvolvido durante o curso de Linux da DIO.me. O objetivo do projeto foi modificado para gerar usuários dinamicamente com base em um arquivo JSON de configurações.


### Como executar ?

- Certifique-se de que você tenha feito o clone ou copiado o script para o seu computador. O script deve estar no formato `.sh`.
- A execução pode ser feitas de duas formas.

### 1° opção
```bash
# Se você usar esse modelo de execução será necessário definir algumas permissões.
# execute sudo chmod 700 create_user.sh
./create_user.sh
```

### 2° opção

```bash
bash create_user.sh
```



## Configurações

A seguir você vai encontrar detalhes de como criar usuários, grupos, owner e permissões de usuario

## Usuários

Você pode adicionar um novo usuário dinamicamente e informar em qual grupo ele precisa estar.

```json
{
    "users": [
        {
            "username": "carlos",
            "group": "GRP_ADM"
        },
        {
            "username": "rogerio",
            "group": "GRP_SEC"
        }
    ],
}

```


## Grupos
É possível definir também configurações para os grupos.

```json
{
    "groups" : [
        {
            "owner": "root",
            "group": "GRP_ADM",
            "directory": "/adm",
            "permissions": "770"
        },
        {
            "owner": "root",
            "group": "GRP_VEN",
            "directory": "/ven",
            "permissions": "770"
        },
        {
            "owner": "root",
            "group": "GRP_SEC",
            "directory": "/sec",
            "permissions": "770"
        }
    ]
}



## Dependencias
Esse projeto depende do pacote linux ´jq` caso você não tenha em sua máquina, será instalado automáticamente.

