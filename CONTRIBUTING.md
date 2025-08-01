# Contributing to CragCrowd

Thank you for your interest in contributing to CragCrowd! This document provides guidelines and instructions for contributing to the project.

## 🎯 Project Goals

CragCrowd aims to provide:
- **Privacy-respecting** crag traffic monitoring
- **Reliable** operation in remote areas without cell service
- **Open-source** transparency and community involvement
- **Easy deployment** for climbing organizations and land managers

## 🏗️ Multi-Repository Structure

CragCrowd is organized as multiple focused repositories:

- **[cragcrowd-utils](https://github.com/shotah/cragcrowd-utils)** - Deployment, documentation, shared resources
- **[cragcrowd-api](https://github.com/shotah/cragcrowd-api)** - Backend API (TypeScript/Express)
- **[cragcrowd-web-ui](https://github.com/shotah/cragcrowd-web-ui)** - Frontend dashboard (TypeScript/React)
- **[cragcrowd-firmware](https://github.com/shotah/cragcrowd-firmware)** - ESP32 sensor firmware (C++)
- **[cragcrowd-gateway](https://github.com/shotah/cragcrowd-gateway)** - ESP32 gateway firmware (C++)

## 🚀 Getting Started

### Prerequisites
- [Node.js 18+](https://nodejs.org/) for API and UI development
- [PlatformIO](https://platformio.org/) for firmware development
- [Docker](https://www.docker.com/) for containerized development
- [Git](https://git-scm.com/) for version control

### Quick Setup
```bash
# Create workspace and clone all repositories
mkdir cragcrowd && cd cragcrowd
git clone https://github.com/shotah/cragcrowd-utils.git
git clone https://github.com/shotah/cragcrowd-api.git
git clone https://github.com/shotah/cragcrowd-web-ui.git
git clone https://github.com/shotah/cragcrowd-firmware.git
git clone https://github.com/shotah/cragcrowd-gateway.git

# Setup development environment
cd cragcrowd-utils
make quick-dev
```

## 🔧 Development Workflow

### 1. Choose Your Focus Area

#### **Firmware Development** (C++/PlatformIO)
Repository: [cragcrowd-firmware](https://github.com/shotah/cragcrowd-firmware) or [cragcrowd-gateway](https://github.com/shotah/cragcrowd-gateway)

- Sensor node improvements (power, accuracy, features)
- Gateway connectivity and reliability
- LoRa communication optimization

#### **Backend Development** (TypeScript/Express)
Repository: [cragcrowd-api](https://github.com/shotah/cragcrowd-api)

- API endpoints and data processing
- Database optimization
- Integration with firmware

#### **Frontend Development** (TypeScript/React)
Repository: [cragcrowd-web-ui](https://github.com/shotah/cragcrowd-web-ui)

- User interface improvements
- Data visualization enhancements
- Mobile responsiveness

#### **Infrastructure & Documentation**
Repository: [cragcrowd-utils](https://github.com/shotah/cragcrowd-utils)

- Deployment automation
- Documentation improvements
- Multi-repository coordination

### 2. Development Process

1. **Fork the relevant repository** and create a feature branch
2. **Set up your development environment** using the component's README
3. **Make your changes** following our coding standards
4. **Test your changes** thoroughly
5. **Submit a pull request** with detailed description

### 3. Component-Specific Setup

#### API Development
```bash
cd cragcrowd-api
make setup
make dev                 # Starts with hot reload
```

#### UI Development
```bash
cd cragcrowd-web-ui
make setup
make dev                 # Starts development server
```

#### Firmware Development
```bash
cd cragcrowd-firmware    # or cragcrowd-gateway
make setup
make build               # Compile firmware
make upload              # Flash to device
make monitor             # View serial output
```

#### Full Stack Development
```bash
cd cragcrowd-utils
make dev-start           # Start API + UI + MongoDB
```

## 📝 Coding Standards

### TypeScript/JavaScript
- Use **TypeScript** for all new code
- Follow **ESLint** configurations in each repository
- Use **Prettier** for code formatting
- Write **unit tests** for new functionality
- Maintain **JSDoc** comments for public APIs

### C++/Arduino
- Follow **ESP-IDF** style guide
- Use **meaningful variable names**
- Keep functions **under 50 lines**
- Add **comments** for complex algorithms
- Minimize **memory usage** and **power consumption**

### General Guidelines
- **Single responsibility** principle for functions/classes
- **Error handling** for all external operations
- **Logging** for debugging and monitoring
- **Security-first** approach for all network operations

## 🧪 Testing Requirements

### Multi-Repository Testing
```bash
cd cragcrowd-utils
make test-all            # Run tests across all components
make lint-all            # Lint all components
```

### Component Testing
```bash
# API Testing
cd cragcrowd-api
npm test                 # Unit tests
npm run lint            # Code quality

# UI Testing
cd cragcrowd-web-ui
npm test                # Component tests
npm run typecheck       # Type checking

# Firmware Testing
cd cragcrowd-firmware
make build              # Compilation test
pio check               # Static analysis
```

## 📋 Pull Request Guidelines

### Repository Selection
- **Component-specific changes**: Submit PR to the specific component repository
- **Multi-component changes**: Submit separate PRs to each affected repository
- **Documentation/deployment changes**: Submit PR to cragcrowd-utils

### Before Submitting
- [ ] All tests pass locally
- [ ] Code follows project style guidelines
- [ ] Documentation updated for new features
- [ ] Hardware tested (for firmware changes)
- [ ] Cross-repository impact considered

### PR Description
Each repository has its own PR template. Include:
- Clear description of changes
- Which repositories are affected
- Testing performed
- Breaking changes (if any)

### Review Process
1. **Automated checks** must pass (CI/CD)
2. **Code review** by at least one maintainer
3. **Integration testing** for multi-component changes
4. **Hardware testing** verification for firmware

## 🐛 Issue Reporting

### Where to Report
- **Component-specific issues**: Report in the relevant repository
- **Multi-component issues**: Report in cragcrowd-utils
- **Deployment issues**: Report in cragcrowd-utils
- **General questions**: Use GitHub Discussions in any repository

### Issue Templates
Each repository has appropriate issue templates:
- Bug reports with environment details
- Feature requests with use case descriptions
- Hardware-specific issue templates for firmware repos

## 💡 Feature Development

### Cross-Repository Features
For features spanning multiple repositories:

1. **Create issue in cragcrowd-utils** describing the full feature
2. **Break down** into component-specific tasks
3. **Create issues** in relevant component repositories
4. **Coordinate development** across repositories
5. **Test integration** before final merge

### Feature Evaluation Criteria
- **Privacy compliance**: Maintains anonymous-only data collection
- **Hardware feasibility**: Works within ESP32 constraints
- **Community benefit**: Useful for multiple climbing areas
- **Maintenance burden**: Sustainable long-term support

## 🔐 Security Guidelines

### Responsible Disclosure
- **Email security issues** privately to christopherblodgett@gmail.com
- **Provide detailed description** and reproduction steps
- **Allow reasonable time** for fix before public disclosure

### Security Requirements
- **No hardcoded credentials** in any repository
- **Input validation** for all external data
- **HTTPS** for all production API communications
- **Minimal attack surface** for IoT devices

## 🏆 Recognition

### Contributors
All contributors are recognized in:
- Repository READMEs
- Release notes
- Annual contributor reports

### Contribution Types
We value all types of contributions:
- **Code contributions** (features, bug fixes)
- **Documentation** improvements
- **Testing** and quality assurance
- **Hardware testing** and field deployments
- **Bug reports** and feature suggestions
- **Community support** and user help

## 📚 Resources

### Documentation
- **[Main README](README.md)**: Project overview and quick start
- **Component READMEs**: Detailed setup for each repository
- **[API Documentation](https://github.com/shotah/cragcrowd-api)**: Backend API details
- **[Hardware Guides](https://github.com/shotah/cragcrowd-firmware)**: Firmware and hardware setup

### Hardware Resources
- [LilyGO T3S3 Documentation](https://github.com/Xinyuan-LilyGO/T3S3-LoRa)
- [LoRa Range Calculator](https://www.rfwireless-world.com/calculators/LoRa-range-calculator.html)
- [ESP32 Power Management](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/system/power_management.html)

### Community
- **GitHub Discussions**: General questions and community chat
- **Issues**: Bug reports and feature requests across all repositories
- **Multi-repo coordination**: Use cragcrowd-utils for project-wide discussions

## 📞 Getting Help

### Development Questions
1. **Check repository-specific documentation** and README files
2. **Search GitHub issues** across relevant repositories
3. **Ask in GitHub Discussions** for general help
4. **Create detailed issue** for specific problems

### Multi-Repository Development
- **Use cragcrowd-utils Makefile** for coordinated development
- **Test integration** using docker-compose in utils repository
- **Coordinate breaking changes** across repositories

## 📄 License

By contributing to any CragCrowd repository, you agree that your contributions will be licensed under the same [MIT License](LICENSE) that covers the project.

## 🙏 Thank You

Your contributions help make climbing areas more accessible and sustainable for everyone. Whether you're fixing a typo, adding a feature, testing hardware in the field, or improving deployment processes, every contribution matters!

The multi-repository structure allows you to focus on the areas you're most interested in while maintaining the overall system integrity.

---

*For specific questions about contributing, feel free to reach out via GitHub Discussions in any repository or create an issue in the most relevant component repository.*