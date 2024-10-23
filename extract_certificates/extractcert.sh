#!/bin/bash

# Define the output directory
OUTPUT_DIR="${HOME}/Desktop/Keychain_Exports"
mkdir -p "$OUTPUT_DIR"

# Prompt for the keychain to use (login or System)
echo "Enter the keychain to search (login/System):"
read KEYCHAIN

# Check if the keychain exists
if ! security list-keychains | grep -q "$KEYCHAIN"; then
  echo "Keychain not found. Exiting."
  exit 1
fi

# Find all certificates in the specified keychain
CERT_IDS=$(security find-certificate -a -c '*' "$KEYCHAIN" | grep '0x' | awk '{print $NF}')

# Check if any certificates were found
if [ -z "$CERT_IDS" ]; then
  echo "No certificates found in $KEYCHAIN keychain."
  exit 1
fi

# Loop through each certificate and export it
for CERT_ID in $CERT_IDS; do
  CERT_NAME=$(security find-certificate -c "$CERT_ID" -p "$KEYCHAIN" | openssl x509 -noout -subject | sed 's/subject= //')
  
  if [ -z "$CERT_NAME" ]; then
    echo "Failed to find certificate name for ID $CERT_ID. Skipping."
    continue
  fi

  OUTPUT_FILE="${OUTPUT_DIR}/${CERT_NAME// /_}.p12"

  echo "Exporting certificate $CERT_NAME to $OUTPUT_FILE..."

  # Export certificate and private key to .p12 file
  security export -k "$KEYCHAIN" -t certs -f pkcs12 -o "$OUTPUT_FILE" -P "<PASSWORD>"

  if [ $? -eq 0 ]; then
    echo "Successfully exported $CERT_NAME."
  else
    echo "Failed to export $CERT_NAME."
  fi
done

echo "Export completed. Check the $OUTPUT_DIR directory."
