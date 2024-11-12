init:
	pipenv install
	pipenv run dbt deps --project-dir jaffle_shop

clean-env:
	:> .env

env-development-salt:
	echo SALT=maldon >> .env

env-target:
	echo DATABRICKS_TARGET=$$(git symbolic-ref --short HEAD | tr /- _) >> .env

build-env: clean-env env-development-salt env-target

dbt-deps:
	pipenv run dbt deps --project-dir jaffle_shop

dbt-build: build-env
	pipenv run dbt build --selector jaffle_shop --project-dir jaffle_shop

run-dbt-project-evaluator: dbt-deps build-env
	pipenv run dbt --warn-error build --select package:dbt_project_evaluator dbt_project_evaluator_exceptions --project-dir jaffle_shop

lint: build-env
	pipenv run sqlfluff lint

format: build-env
	pipenv run sqlfluff fix

run-python-tests:
	pipenv run pytest testing --quiet --show-capture=no --tb=no

run-python-tests-detailed:
	pipenv run pytest testing