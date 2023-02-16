FROM mysten/sui-tools:devnet

# Install GIT (during build-phase)
RUN apt update
RUN apt install git -y

# create genesis environment
RUN sui genesis
RUN sui client switch --env devnet

# SUI CLI Commands
# -> Import KeyPair
# -> Switch to imported address
# -> publish package
ENTRYPOINT sui keytool import "$MNEMONIC" $ALGORITHM; sui client switch --address $ADDRESS; sui client publish --gas-budget 10000 --skip-dependency-verification

