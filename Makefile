.PHONY: clean

# Load all environment variables from .env
# so that they are preloaded before running any command here
ifneq (,$(wildcard ./.env))
include .env
export
endif

# Settings in pyproject.toml
isort:
	isort .

# Settings in pyproject.toml
black:
	black .

# Settings in .flake8
flake8:
	flake8

# Settings in .pylintrc
pylint:
	pylint **/*.py

format: isort black flake8 pylint

# Export poetry dependencies to requirements.txt and dev_requirements.txt
requirements:
	poetry export -f requirements.txt --without-hashes \
		--output requirements.txt
	poetry export -f requirements.txt --without-hashes \
		--with dev \
		--output dev_requirements.txt

# Install poetry and dev dependencies (call after initializing a new conda env)
# Requires JFROG_EMAIL and JFROG_API_KEY to be configured in .env
setup-dev:
	@echo "Setting up development environment..."
	@conda install poetry && \
	poetry self update && \
	poetry install
	@echo "Development environment setup complete."