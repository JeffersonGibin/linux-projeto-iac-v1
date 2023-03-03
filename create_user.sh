#!/bin/bash

# Dependencias externas
if which jq >/dev/null; then
    echo "#### A dependência 'jq' foi encontrada e não será instalada! ####"
else
    apt-get install jq -y
    echo "#### O pacote 'jq' foi instalado em seu computador! ####"
fi


####################################### Configuração #######################################
# Configurações de diretórios e pastas
settings='{
    "users": [
        {
            "username": "carlos",
            "group": "GRP_ADM"
        },
        {
            "username": "maria",
            "group": "GRP_ADM"
        },
        {
            "username": "joao",
            "group": "GRP_ADM"
        },

        {
            "username": "debora",
            "group": "GRP_VEN"
        },
        {
            "username": "sebastiana",
            "group": "GRP_VEN"
        },
        {
            "username": "roberto",
            "group": "GRP_VEN"
        }, 

        {
            "username": "josefina",
            "group": "GRP_SEC"
        },
        {
            "username": "amanda",
            "group": "GRP_SEC"
        },
        {
            "username": "rogerio",
            "group": "GRP_SEC"
        }    
    ],

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
}'

############################################################################################


# Split configs
groups=$(echo $settings | jq '.groups')
users=$(echo $settings | jq '.users')

# Criar Diretórios
createDirectories(){
    for item in $(echo "${groups}" | jq -c '.[]');
    do
        directory=$(echo $item | jq -r '.directory')
        permissions=$(echo $item | jq -r '.permissions')

        # Cria o diretório
        mkdir $directory

        # Definindo permição do diretório
        chmod $permissions $directory
    done

    echo "- Diretórios Criados..."
}

# Criar Grupos
createGroups(){
    for item in $(echo "${groups}" | jq -c '.[]');
    do
        group=$(echo $item | jq -r '.group')
        owner=$(echo $item | jq -r '.owner')
        directory=$(echo $item | jq -r '.directory')
        permissions=$(echo $item | jq -r '.permissions')

        # Cria uma Grupo
        groupadd $group

        # Define dono do diretório
        chown $owner:$group $directory
    done

    echo "- Grupos Criados..."
}

# Criar usuários
createUser(){
    for item in $(echo "${users}" | jq -c '.[]');
    do
        username=$(echo $item | jq -r '.username')
        group=$(echo $item | jq -r '.group')

        echo "$group"

        # Criar usuário com senha padrão
        useradd $username -m -c "Usuário $username" -s /bin/bash -p $(openssl passwd -crypt Senha123) -G $group

        # Forçar o usuário a alterar a senha quando efetuar login.
        passwd $username -e
    done
    echo "- Usuários Criados..."
}

permissionPublicDirectory(){
    # Qualquer tipo de usuário terá permissão na pasta publica.
    echo "- Definindo privilégios do diretório público..."
    chmod 777 /publico
}

main(){
    createDirectories
    createGroups
    createUser
    permissionPublicDirectory

    echo "Processo Finalizado!"
}

# Executando
main
