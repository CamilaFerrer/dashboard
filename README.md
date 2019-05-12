# Dashboard
Devido a demanda de exibição do status dos serviços da infraestrutura de uma empresa, foi elaborado esse projeto que cria um dashboard com o status dos serviços em tempo real para exibição para todos os setores da empresa.
Para a aquisição dos dados foram elaborados crontabs dentro dos servidores que criam arquivos com os dados a serem exibidos e exportam para dentro da aplicação que interpreta e expoem no dashboard.
O projeto elaborado usa a gem Smashing para implementação inicial do dashboard e configura novas funções para aquisição dos dados a serem exibidos.

Para mais informações do projeto inicial, acesse:
* [smashing](https://github.com/Smashing/smashing)
* Baseado de [visibilityspots/smashing](https://registry.hub.docker.com/u/visibilityspots/smashing/)

# Docker
Execute a aplicação em um container [Docker](http://docker.io/).

## Executar
```docker run -d -p 8080:3030 visibilityspots/smashing```

Abra o navegador na página [http://localhost:8080/](http://localhost:8080/).


## Configuração
### Porta
Caso queira que o smashing utilize uma porta diferente dentro do container, por exemplo a porta 80, utilize a variável `$PORT`:

```docker run -d -e PORT=80 -p 8080:80 visibilityspots/smashing```


### Gems
Para instalar gems, informe o nome da gem como variavel de ambiente:

```docker run -d -e GEMS=instagram -e WIDGETS=5278790 -p 8080:3030 visibilityspots/smashing```

Esse exemplo insta o widget [Instagram photos by location](https://gist.github.com/mjamieson/5278790), que depende da gem instagram. Podem ser instalados ao mesmo tempo diversos gems e widgets:

```docker run -d -e GEMS="mysql instagram" -e WIDGETS=5278790 -p 8080:3030 visibilityspots/smashing```

## Customização

### Dashboards
Para adicionar um dashboard personalizado use o volume **/dashboards**:

```docker run -v=/my/custom/dashboards:/dashboards -d -p 8080:3030 visibilityspots/smashing```

(*Não esqueça de enviar o arquivo layout.erb*)

### Jobs
Para adicionar um job personalizado, use o volume **/jobs**:

```docker run -v=/my/cool/job:/jobs -d -p 8080:3030 visibilityspots/smashing```

### Widgets
Para adicionar um widget da [biblioteca](https://github.com/Smashing/smashing/wiki/Additional-Widgets) informe o seu ID do gist do widget como uma variavél de ambiente:

```docker run -d -e WIDGETS=5641535 -p 8080:3030 visibilityspots/smashing```

Esse exemplo instala o widget [Random Aww](https://gist.github.com/chelsea/5641535) antes de iniciar a aplicação.

Para utilizar widgets personalizados localmente , use o volume **/widgets**:

```docker run -v=/my/cool/widgets:/widgets -d -p 8080:3030 visibilityspots/smashing```
