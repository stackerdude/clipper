#!/bin/sh

openssl aes-256-cbc -k "$SECURITY_PASSWORD" -in resources/development-key.p12.enc -d -a -out resources/development-key.p12

security create-keychain -p $CUSTOM_KEYCHAIN_PASSWORD macos-build.keychain

security default-keychain -s macos-build.keychain

security unlock-keychain -p $CUSTOM_KEYCHAIN_PASSWORD macos-build.keychain

security set-keychain-settings -t 3600 -l ~/Library/Keychains/macos-build.keychain

security import resources/development-key.p12 -k macos-build.keychain -P $SECURITY_PASSWORD -A

security set-key-partition-list -S apple-tool:,apple: -s -k $SECURITY_PASSWORD macos-build.keychain > /dev/null
