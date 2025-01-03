
# Dockerized PHP Setup for Easy Development

This repository provides a simple and efficient setup for running PHP projects in Docker. Whether you're developing with PHP frameworks like Laravel or Symfony, or just working with plain PHP, this repo helps you quickly set up a development environment with minimal configuration.

## What's Included:

- A **Dockerfile** to configure PHP with all necessary extensions.
- A **docker-compose.yml** to set up multiple services like PHP, MySQL, or Nginx.
- A sample PHP project to demonstrate the setup and workflow.
- Clear instructions on how to build and run your PHP environment in Docker.

## Getting Started

### Prerequisites

- Docker installed on your machine (Make sure to have Docker and Docker Compose installed).
- Basic understanding of PHP and Docker.

### Setup

1. Clone the repository:
   ```bash
   git clone git@github.com:rajansharmax/php-docker-boilerplate.git
   cd repo-name
   ```

2. Build and start the containers:
   ```bash
   docker-compose up --build
   ```

3. Access your PHP application:
   - Open your browser and go to `http://localhost:8080` (or the port you defined in `docker-compose.yml`).

### Running PHP CLI

To run PHP commands like Artisan (for Laravel) or Symfony console commands, use the following:
```bash
docker-compose exec php php artisan <command>
```

### Stopping the Containers

To stop the running containers:
```bash
docker-compose down
```

## Customization

- Edit the `.env` file for custom configurations such as database connection settings or PHP extensions.
- Modify the Dockerfile and `docker-compose.yml` to add more services or change versions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Rajan Sharma**  
Username: [rajansharmax](https://github.com/rajansharmax)

### Social Media:
- [Twitter](https://twitter.com/rajansharmax)
- [LinkedIn](https://linkedin.com/in/rajansharmax)
- [Instagram](https://instagram.com/rajansharmax)
- [Facebook](https://facebook.com/rajansharmax)
- [YouTube](https://youtube.com/rajansharmax)

### Repository:
- [GitHub Repository](git@github.com:rajansharmax/php-docker-boilerplate.git)

### Contact Information:
- Email: rajansharmax@example.com  
- GitHub: [rajansharmax](https://github.com/rajansharmax)

### Contribution Guidelines:
We welcome contributions from everyone! If you’d like to contribute, please follow these steps:
1. Fork the repository
2. Clone your forked repository
3. Create a new branch for your changes
4. Make your changes and commit them
5. Push to your fork and submit a pull request

### About the Repository:
This repository is designed to provide a **boilerplate Docker setup** for PHP development environments. It’s an ideal starting point for setting up your PHP applications in Docker with all the required services like MySQL, Nginx, or PHP-FPM.

Feel free to reach out on social media, open an issue for any bugs, or submit a pull request with any improvements or additional features!