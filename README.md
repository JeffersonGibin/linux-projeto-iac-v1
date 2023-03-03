# LINUX PROJETO IaC V1

Este projeto foi desenvolvido durante o curso de Linux da DIO.me. O objetivo do projeto foi modificado mas o objetivo principal se manteve.

## Definição do problema proposto pela DIO.me.

- Todo Provisionamento deve ser feito em um arquivo do tipo Bash Script;
- O dono de todos os diretórios será o usuário root;
- Todos os usuários terão permissão total dentro do diretório *público*;
- Os usuários de cada grupo terão permissão total dentro de seu rescpectivo diretório;
- Os usuários não poderão ter permissões de leitura, escrita e execução em diretórios de departamentos que eles não pertencem;

![image](https://user-images.githubusercontent.com/6215779/222852546-b358c3e5-9f3d-4672-bbba-67bf71fc6d9e.png)


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
```


## Depêndencia de pacote Linux
Esse projeto depende do pacote linux ´jq` caso você não tenha em sua máquina, será instalado automáticamente.

