# Automação de Testes de UI com Robot Framework e Playwright.

[![Robot Framework Tests](https://github.com/thinogueiras/Robot-Gherkin-Tests/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/thinogueiras/Robot-Gherkin-Tests/actions/workflows/ci.yml)

## Sobre o projeto:

* Site alvo dos testes: <strong>https://www.saucedemo.com</strong>.
* Este projeto utiliza o padrão <strong>`Page Objects`</strong>.
* Os <strong>`Casos de Testes`</strong> foram implementados utilizando <strong>`Gherkin`</strong> com a abordagem <strong>`declarativa`</strong>.

## Pré-requisitos mínimos de ambiente:

* [Git](https://git-scm.com/).

* [Docker](https://www.docker.com/products/docker-desktop/) (Opcional).

* [Python](https://www.python.org/downloads/) 3.12.x.

* [Node.js](https://nodejs.org/en) 18.17.x.

## Clone do Repositório:

```
git clone https://github.com/thinogueiras/Robot-Gherkin-Tests.git

cd Robot-Gherkin-Tests
```

## Instalação do projeto:

```
pip install -r requirements.txt
```

## Instruções:

#### Executar o comando abaixo no terminal:

```
rfbrowser init
```

## Execução dos testes:

#### Chromium:

```
robot -d ./reports -v BROWSER:Chromium -v HEADLESS:False tests/
```

#### Firefox:

```
robot -d ./reports -v BROWSER:Firefox -v HEADLESS:False tests/
```

## Docker:

```
docker pull ppodgorsek/robot-framework:latest
```

#### Aplicando permissão de execução:
```
chmod +x run-docker-tests-single-thread.bat
```

#### Executando o arquivo:
```
./run-docker-tests-single-thread.bat
```
---

## Relatórios:

Verifique a pasta `reports` para visualizar os <b>relatórios</b> da execução: `report.html` ou `log.html`.

---

<a href="https://www.linkedin.com/in/thinogueiras"><img alt="Linkedin" src="https://img.shields.io/badge/-LinkedIn-blue?style=for-the-badge&logo=Linkedin&logoColor=white"></a>

<strong>Thiago Nogueira dos Santos</strong> 🤓 ✌🏻

QA Automation Engineer 🔎 🐞