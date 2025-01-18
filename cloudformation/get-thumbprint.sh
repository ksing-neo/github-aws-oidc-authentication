#!/bin/bash

# URL of the GitHub OIDC provider
OIDC_URL="token.actions.githubusercontent.com"

# Fetch the certificate chain using openssl
CERTIFICATE=$(echo | openssl s_client -showcerts -servername "$OIDC_URL" -connect "$OIDC_URL:443" 2>/dev/null | openssl x509 -fingerprint -sha1 -noout)

# Extract the SHA1 fingerprint
if [[ $CERTIFICATE =~ SHA1\ Fingerprint=([A-Fa-f0-9:]+) ]]; then
  THUMBPRINT=${BASH_REMATCH[1]}
  # Remove colons to format the thumbprint
  FORMATTED_THUMBPRINT=${THUMBPRINT//:/}
  echo "Thumbprint: $FORMATTED_THUMBPRINT"
else
  echo "Error: Unable to retrieve the thumbprint." >&2
  exit 1
fi