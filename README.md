# PyMC Example

Heirarchical Bayesian modeling with PyMC

## Getting Started

Create a conda environment

```bash
conda create --name <my-env>
make setup-dev
```

# Contributing

Delete the conda environment if needed with
```bash
conda remove --name <my-env> --all
```

Adding to the optional dev dependencies can be done with
```bash
poetry add <package_name> -G dev
```
