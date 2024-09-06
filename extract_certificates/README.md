# Keychain Certificate Exporter

## Overview

The Keychain Certificate Exporter is a bash script designed to automate the extraction of certificates and their associated private keys from macOS Keychains. This tool is particularly useful for software engineers and system administrators who need to export certificates for backup, migration, or configuration purposes.

## Features

- **Export Certificates**: Extract certificates from specified keychains (`login` or `System`).
- **Export Private Keys**: Export both certificates and private keys in `.p12` format.
- **Customizable Output**: Exported files are saved to a designated directory with user-defined names.

## Prerequisites

- macOS environment with the `security` command-line tool available (default on macOS).
- Basic knowledge of bash scripting and command-line operations.
- Administrative privileges might be required for accessing certain keychains.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone {repo.git} #replace with repo name
   cd extract_certificates

2. **Make the Script Executable**:

   ```bash
   chmod +x extractcert.sh.sh
   ```

## Usage

1. **Run the Script**:

   ```bash
   ./extractcert.sh
   ```

2. **Follow the Prompts**:

   - You will be prompted to enter the keychain to search (`login` or `System`).
   - The script will list and attempt to export all certificates and private keys found in the specified keychain.

3. **Output**:

   - Certificates and keys will be exported to the `Keychain_Exports` directory on your Desktop.
   - Exported files will be named based on the certificate's subject, with spaces replaced by underscores.

## Script Details

- **Script File**: `extractcert.sh`
- **Dependencies**: `security`, `openssl`
- **Configuration**: Modify the `PASSWORD` placeholder in the script for the export command if a password is required.

## Troubleshooting

- **Permissions Issues**: If the script cannot access certain keychains, try running it with `sudo`:

  ```bash
  sudo ./extractcert.sh
  ```

- **No Certificates Found**: Ensure that the specified keychain contains certificates and that you have access to them.

- **Export Failures**: Verify that the `security` command and `openssl` tool are functioning correctly on your system.

## Contributing

Contributions are welcome! Please fork the repository and submit pull requests for any improvements or bug fixes.