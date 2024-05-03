# Guide d'utilisation : 
Groupe: 
Mai Thi Tran Diep
Redureau Melvin


Dans le ficher terraform.tfvars se trouve les différentes variables à remplacer pour faire fonctionner le projet. 

Voici une description de ces variables:

- "ami" : Représente le code AMI (Amazone Machine Image) référençant l'image qui sera utilisée sur pour la création d'une VM.
- "instance_type" : Correspond au type d'instance qui sera déployé par aws pour la VM. 
- "user" : Correspond au user par default de la machine virtuelle utilisé pour se connecter à la VM.
>[!WARNING]
> Ce user change en fonction de l'os, donc potentiellement de l'ami.

- "publicKey" : Correspond à la clée publique utilisée pour la communication avec la VM

- "privateKey" : Correspond à la clée privé utilisée pour la communication avec la VM 

>[!NOTE]
> "publicKey et "privateKey" sont générées avec la commande:
```sh
ssh-keygen -t rsa -b 2048 -f awsDevOpsKeys
``` 

- "AWS_ACCESS_KEY_ID": Id de la clef d'accès au compte AWS
- "AWS_SECRET_ACCESS_KEY" Clef d'accès au compte AWS
>[!NOTE]
> "AWS_ACCES_KEY_ID" et "AWS_SECRET_ACCESS_KEY" sont générées dans le compte AWS.


Lien du git: https://github.com/maithi-trandiep/devops-terraform/
