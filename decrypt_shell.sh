#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" \
--output $HOME/secrets/fresh-catwalk-438015-b4-d4954f42b87e.json fresh-catwalk-438015-b4-d4954f42b87e.json.gpg

