# SPE Toolkit

This is a library of utilities to help you get started with Solana Permissioned Environments.

## Requirements

- Docker (https://www.docker.com/products/docker-desktop)
- Bash

## Setting up the environment

**1. Source the environment (in case you don't have dotenv configured)**

```bash
set -a                                                        
source .env
set +a
```

**2. Start the local SPE network**

```bash
docker compose up
```

You can now access the explorer at http://localhost:8080. The port can be adjusted in the `.env` file.

**3. Initialize the CLI config**

```bash
spe init
```

**4. Use the shipped CLIs**

* `spe` is a helper CLI to get you setup in the SPE environment
* `spe-token` is a CLI to interact with the SPL Token program
* `spe-cli` is an alias for the Solana CLI configured to interact with your SPE
* `spe-keygen` is an alias for the Solana Keygen CLI

## Examples

### Create and fund a new account

[![asciicast](https://asciinema.org/a/0686yP02xTiD4ActAsMG7ycpF.svg)](https://asciinema.org/a/0686yP02xTiD4ActAsMG7ycpF)

```bash
# This creates a new keypair
spe create-account [name]
# This funds the account with x SOL
spe fund [name] [amount]
# This sets the account as the current account (i.e. use it for future commands)
spe use-account [name]
```

### Create a new token

**Note:** Make sure you have funded and called `spe use-account` on the account you want to use to create the token.

[![asciicast](https://asciinema.org/a/IkIdYp6AgRJNomIrWrFmO1RRf.svg)](https://asciinema.org/a/IkIdYp6AgRJNomIrWrFmO1RRf)

```bash
spe-token create-token
spe-token create-account [token_address]
spe-token mint [account_address] [amount]
```