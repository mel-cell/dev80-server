# Monorepo Development Environment

This project provides a Docker-based development environment with multiple services including web servers, databases, and utilities.

## Services Included

- **Nginx**: Frontend proxy server.
- **Apache + PHP 8.2**: Backend web server with PHP support.
- **MySQL**: Relational database server.
- **PostgreSQL**: Relational database server.
- **pgAdmin**: Web-based GUI for managing PostgreSQL.
- **FTP Server (vsftpd)**: FTP service for file transfers.
- **DNS Server (dnsmasq)**: Local DNS for *.localhost domains.

## Prerequisites

- Linux operating system.
- Docker and Docker Compose installed.
- Basic knowledge of terminal commands.

## Installation and Setup on Linux

1. **Install Docker**

   Follow the official Docker installation guide for your Linux distribution:

   https://docs.docker.com/engine/install/

2. **Install Docker Compose**

   Docker Compose V2 is included with recent Docker versions. Verify installation:

   ```bash
   docker compose version
   ```

   If not installed, follow:

   https://docs.docker.com/compose/install/

3. **Clone this repository**

   ```bash
   git clone <repository-url>
   cd monorepo-devenv
   ```

4. **Make the server script executable**

   ```bash
   chmod +x server
   ```

5. **Start the development environment**

   Run the interactive server management script:

   ```bash
   ./server
   ```

   Use arrow keys to navigate the menu and Enter to select options.

## Usage

### Starting and Managing Services

Use the provided `server` script to manage the environment interactively:

```bash
./server
```

This will launch a navigable menu where you can select options such as:

- Start Services
- Stop Services
- Restart Services
- View Logs
- Enter Container
- Check Status
- MySQL Shell
- Clean Up
- Help
- Exit

Navigate using arrow keys and select with Enter.

### Accessing Databases

#### MySQL

- **Port:** 3306
- **Username:** root
- **Password:** root
- **Default Database:** mysqldb

Access MySQL via CLI:

```bash
./server mysql
```

Or manually:

```bash
docker compose exec mysql mysql -u root -p
```

Access MySQL via phpMyAdmin (if running):

- URL: `http://localhost:8080`
- Username: `root`
- Password: `root`

#### PostgreSQL

- **Port:** 5432
- **Username:** root
- **Password:** root
- **Default Database:** postgresdb

Access PostgreSQL via CLI:

```bash
docker compose exec postgresql psql -U root -d postgresdb
```

Or enter container:

```bash
./server enter postgresql
psql -U root -d postgresdb
```

Access PostgreSQL via pgAdmin:

- URL: `http://localhost:5050`
- Email: `admin@admin.com`
- Password: `root`

Add a new server in pgAdmin with the following details:

- Host: `postgresql`
- Port: `5432`
- Username: `root`
- Password: `root`
- Database: `postgresdb`

## Cleaning Up

To stop and remove containers, volumes, and orphan containers:

```bash
./server clean
```

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.
