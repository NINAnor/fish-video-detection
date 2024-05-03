# bachelor-oppgave-nina

Group members
* [Lars Blütecher Holter](https://github.com/Firemines)
* [Benjamin Letnes Bjerken](https://github.com/beuss-git)
* [Lillian Alice Wangerud](https://github.com/Lilliaaw)
* [Daniel Hao Huynh](https://github.com/Mystodan)

[![CI][ci-badge]][ci]

[ci-badge]: https://github.com/beuss-git/bachelor-oppgave-nina/actions/workflows/code-quality.yml/badge.svg
[ci]: https://github.com/beuss-git/bachelor-oppgave-nina/actions/workflows/code-quality.yml

### Requirements
- [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [poetry](https://python-poetry.org/docs/#insntalling-with-the-official-installer)


I recommend adding poetry to your PATH.
Add `%APPDATA%\Python\Scripts` on windows.

`poetry config virtualenvs.in-project true --local` **if** you want the virtual environment to be created in .venv at the root of the project

`poetry install` to install project dependencies

Windows: `poetry run poe torch-cuda` to install torch with cuda.

`pre-commit install` to install pre-commit hooks.

`pre-commit install --hook-type commit-msg` to install commitlint hook.


See the commitlint config:
https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional

## Run using Docker

```
docker compose --profile prod build
docker compose --profile prod run --rm app
```

A desktop launcher can be installed as well:
```bash
cp launcher/fiskai_launcher.sh ~/.local/bin
cp launcher/fiskai.desktop ~/.local/share/applications/
```

## Notes

**Note:** Before running the project without Docker, you will need to pull the large files (model weights) from [GitHub release v0.1.0](https://github.com/NINAnor/fisk-ai/releases/tag/v0.1.0).
