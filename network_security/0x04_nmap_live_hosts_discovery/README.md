# Nmap Live Hosts Discovery

This repository contains scripts and instructions for discovering live hosts on a network using Nmap.

## Table of Contents

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Nmap (Network Mapper) is a powerful open-source tool used for network discovery and security auditing. This project focuses on using Nmap to identify live hosts on a network.

## Requirements

- Nmap installed on your system. You can download it from [nmap.org](https://nmap.org/download.html).
- Basic knowledge of command-line interface.

## Usage

To discover live hosts on a network, use the following command:

```sh
nmap -sn <network_range>
```

Replace `<network_range>` with the appropriate IP range for your network.

## Examples

Discover live hosts on the `192.168.1.0/24` network:

```sh
nmap -sn 192.168.1.0/24
```

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
