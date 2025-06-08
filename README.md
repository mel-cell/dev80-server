dev80-server - Development Environment for PHP & Laravel 🧱
A robust and lightweight development environment designed to streamline PHP and Laravel workflows.
Say goodbye to manual installations of Apache, MySQL, or phpMyAdmin.
With a single control script (dev80), all services are up and running seamlessly on Fedora Linux. 

🔍 Purpose
This system was created to provide a local development environment that is:

✅ Lightweight and stable
✅ Capable of running multiple PHP/Laravel projects simultaneously
✅ Accessible via browser (similar to Laragon)
✅ Fully controlled via terminal (dev80)
✅ Free from port conflicts
✅ Portable and easy to set up
The primary focus is:

❗ CLI-first approach — powerful, efficient, and developer-friendly. 

Future plans include adding a simple GUI (e.g., using Electron.js) to make it more accessible for non-technical users or team collaboration.

📁 Directory Structure
plaintext


1
2
3
4
5
~/monorepo-devenv/
├── docker-compose.yml    # Docker Compose configuration file
├── dev80                 # Main control script
├── www/                  # Root directory for all PHP/Laravel projects
└── README.md             # This file
🚀 How It Works
1. Start All Services
Run the following command to start all services with a single command:

bash


1
dev80 start
2. Access Your Web Applications
Once the services are running, you can access your applications via the following URLs:

Web PHP : http://localhost:8888
phpMyAdmin : http://localhost:8080
MySQL Database : localhost:3306
3. Manage Services
Use the following commands to manage your development environment:

bash


1
2
3
4
5
dev80 stop       # Stop all services
dev80 restart    # Restart services
dev80 logs       # View live logs
dev80 mysql      # Access MySQL shell
dev80 enter apache-php   # Enter the Apache-PHP container
🧪 Database Information
Host : localhost
Port : 3306
Username : root
Password : root
phpMyAdmin : http://localhost:8080
🎯 Future Enhancements (GUI Integration)
While the current implementation focuses on a CLI-first approach, future development will include a desktop GUI built using Electron.js. This will enhance usability and accessibility for non-technical users.

Planned GUI Features:
Start/Stop/Restart Buttons : Control services with a single click.
Live Logs : View real-time logs directly in the application window.
Project List : Display all projects located in the www/ directory.
Browser Integration : Open projects in the default browser with one click.
Database Backup : Perform one-click database backups.
📦 Additional Notes
All services run via Docker Compose , ensuring consistency and isolation.
The system is modular and can be extended to support other languages like Node.js, Python, or Go.
Ideal for full-stack developers working on Linux (Fedora).
Designed for flexibility — add features as needed to suit your workflow.
✨ Why Choose dev80-server?
Efficiency : Minimal setup time, maximum productivity.
Scalability : Run multiple projects without conflicts.
Developer-Friendly : CLI-first design for power users, with future GUI support for broader adoption.
Cross-Platform Potential : While optimized for Fedora Linux, the Docker-based architecture makes it adaptable to other environments.
🔗 Contributing
Contributions are welcome! If you have ideas, bug fixes, or feature requests, feel free to open an issue or submit a pull request. Together, we can make dev80-server even better.

📜 License
This project is licensed under the MIT License . See the LICENSE file for details.
