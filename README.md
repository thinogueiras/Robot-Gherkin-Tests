# Automação de Testes de UI com Robot Framework e Playwright.

## Sobre o projeto:

* Site alvo dos testes: <strong>https://www.saucedemo.com</strong>.
* Este projeto utiliza o padrão `Page Objects`.
* Os <strong>Casos de Testes</strong> foram implementados utilizando `Gherkin / BDD`.

## Pré-requisitos mínimos de ambiente:

* [Python](https://www.python.org/downloads/) 3.10.12.

* [Node.js](https://nodejs.org/en) 18.17.1.

## Clone do Repositório:

```bash
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

---

## Relatórios:

Verifique a pasta `reports` para visualizar os <b>relatórios</b> da execução: `report.html` ou `log.html`.

---

<a href="https://www.linkedin.com/in/thinogueiras"><img alt="Linkedin" src="https://img.shields.io/badge/-LinkedIn-blue?style=for-the-badge&logo=Linkedin&logoColor=white"></a>

<strong>Thiago Nogueira dos Santos</strong> 🤓 ✌🏻

QA Automation Engineer 🔎 🐞