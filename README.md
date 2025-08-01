# CragCrowd: LoRa-Powered Crag Activity Monitor

A comprehensive system for monitoring climbing wall activity using LoRa mesh networks, even in areas without cell service.

## 🏗️ Project Overview

CragCrowd is a privacy-respecting, open-source solution for monitoring climbing area usage without cameras, microphones, or personal data collection. The system uses passive WiFi/BLE device detection and LoRa mesh networking to provide real-time crag traffic data.

### Key Features
- **Privacy-First**: Anonymous device counting only, no personal data
- **Offline Operation**: Works in areas without cell service using LoRa mesh
- **Solar Powered**: 30+ day autonomous operation with solar + battery
- **Real-Time Dashboard**: Web interface for monitoring and historical data
- **Open Source**: Full transparency and community development

## 📦 System Components

CragCrowd consists of four main repositories:

### **[cragcrowd-firmware](https://github.com/shotah/cragcrowd-firmware)**
ESP32-S3 sensor node firmware that:
- Passively scans for WiFi/BLE devices
- Counts unique devices anonymously  
- Transmits data via LoRa every 10 minutes
- Runs on solar + battery power

### **[cragcrowd-gateway](https://github.com/shotah/cragcrowd-gateway)**
ESP32-S3 gateway firmware that:
- Receives LoRa packets from sensor nodes
- Forwards data to API via WiFi/cellular
- Adds signal quality metadata
- Handles connection recovery

### **[cragcrowd-api](https://github.com/shotah/cragcrowd-api)**
TypeScript/Express backend service that:
- Receives and stores sensor data
- Provides REST API for data access
- Handles data validation and aggregation
- Runs in Docker containers

### **[cragcrowd-web-ui](https://github.com/shotah/cragcrowd-web-ui)**
React/TypeScript frontend that:
- Displays real-time crag activity
- Shows historical trends and patterns
- Provides mobile-responsive interface
- Updates automatically every minute

## 🚀 Quick Start

### Prerequisites
- **Hardware**: [LilyGO T3S3](https://lilygo.cc/products/t3-s3-meshtastic) boards
- **Software**: [Docker](https://www.docker.com/), [PlatformIO](https://platformio.org/)
- **Network**: WiFi for gateway, LoRa for sensors

### 1. Clone All Repositories
```bash
# Create workspace directory
mkdir cragcrowd && cd cragcrowd

# Clone all repositories
git clone https://github.com/shotah/cragcrowd-utils.git
git clone https://github.com/shotah/cragcrowd-api.git
git clone https://github.com/shotah/cragcrowd-web-ui.git
git clone https://github.com/shotah/cragcrowd-firmware.git
git clone https://github.com/shotah/cragcrowd-gateway.git
```

### 2. Quick Development Setup
```bash
cd cragcrowd-utils

# Setup all projects
make setup-all

# Start development environment
make dev-start

# Access the dashboard
open http://localhost:3001
```

### 3. Quick Production Deployment
```bash
cd cragcrowd-utils

# Configure environment
cp api.env.example ../cragcrowd-api/.env
cp web-ui.env.example ../cragcrowd-web-ui/.env
# Edit .env files with your settings

# Start production services
make prod-start
```

## 🔧 Hardware Setup

### Sensor Nodes
1. **Flash firmware** from [cragcrowd-firmware](https://github.com/shotah/cragcrowd-firmware)
2. **Configure wall_id** for deployment location
3. **Install weatherproof enclosure** with solar panel
4. **Mount 3-5m high** with clear view of climbing area

### Gateway Nodes  
1. **Flash firmware** from [cragcrowd-gateway](https://github.com/shotah/cragcrowd-gateway)
2. **Configure WiFi credentials** and API endpoint
3. **Install with internet connectivity** (WiFi or cellular)
4. **Test LoRa range** to sensor locations (2-5km typical)

## 📊 System Architecture

```
[Sensor Nodes] --LoRa--> [Gateway] --Internet--> [API] <---> [Web UI]
       |                     |                    |           |
   WiFi/BLE scan         LoRa bridge          Database    Dashboard
   Device counting      WiFi connectivity     Data API    Visualization
   Solar powered        Data forwarding       MongoDB     Real-time updates
```

### Data Flow
1. **Sensors** detect nearby devices and count anonymously
2. **LoRa transmission** sends counts to gateway every 10 minutes
3. **Gateway** forwards data to API via internet connection
4. **API** stores data and provides endpoints for web interface
5. **Web UI** displays real-time and historical activity data

## 🛠️ Development

### Multi-Repository Workflow
Each component can be developed independently:

```bash
# Work on API
cd cragcrowd-api
make dev                 # Start API development server

# Work on UI (in another terminal)
cd cragcrowd-web-ui  
make dev                 # Start UI development server

# Work on firmware
cd cragcrowd-firmware
make build upload monitor # Build and flash firmware
```

### Full Stack Development
Use the utils repository for coordinated development:

```bash
cd cragcrowd-utils
make dev-start           # Starts API + UI + MongoDB
make firmware-build      # Builds all firmware
make test-all           # Runs all tests
```

## 📈 Deployment Options

### Development
- **Local Docker**: API + UI + MongoDB in containers
- **Hot reload**: Automatic rebuilds on code changes
- **Integrated testing**: All components with sample data

### Production
- **Cloud deployment**: Deploy API + UI to cloud providers
- **On-premise**: Run on local server or Raspberry Pi
- **Hybrid**: Cloud API with local gateways and sensors

### Hardware Deployment
- **Single location**: 1-3 sensors + 1 gateway
- **Multi-location**: Multiple sensor clusters with shared gateways
- **Community network**: Distributed sensors with community-run gateways

## 🔐 Privacy & Security

### Privacy Features
- **No cameras or microphones**: Only passive RF scanning
- **Anonymous counting**: No personal identifiers collected
- **MAC randomization**: Modern devices use randomized addresses
- **Local processing**: No data sent to external services

### Security Considerations
- **Open source**: Full code transparency
- **Encrypted communication**: HTTPS for all API traffic
- **Minimal attack surface**: IoT devices with minimal functionality
- **Community oversight**: Public development and auditing

## 📋 Use Cases

### Climbers
- **Check crag activity** before driving to climbing area
- **Avoid crowds** by choosing less busy times/walls
- **Plan efficiently** with real-time activity data

### Land Managers
- **Monitor usage patterns** without invasive methods
- **Justify maintenance** with objective usage data
- **Manage access** during peak usage periods

### Climbing Organizations
- **Support conservation** with usage impact data
- **Engage community** with transparent monitoring
- **Advocate for access** with land management agencies

## 🤝 Contributing

We welcome contributions to any component of the CragCrowd system!

### Getting Started
1. **Choose a component** (firmware, gateway, API, or UI)
2. **Read the component README** for specific setup instructions
3. **Check the issues** for beginner-friendly tasks
4. **Join discussions** about features and improvements

### Development Process
1. **Fork the relevant repository**
2. **Create a feature branch**
3. **Make your changes** following the coding standards
4. **Test thoroughly** (unit tests + hardware testing for firmware)
5. **Submit a pull request** with detailed description

### Areas for Contribution
- **Firmware optimization**: Power management, range improvements
- **UI/UX improvements**: Better visualizations, mobile experience
- **API features**: Data analysis, export capabilities, authentication
- **Documentation**: Setup guides, troubleshooting, deployment
- **Hardware testing**: Field testing, enclosure designs, solar optimization

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 🐛 Issues & Support

### Reporting Issues
- **Component-specific issues**: Report in the relevant repository
- **System-wide issues**: Report in this utils repository
- **Hardware questions**: Use the firmware or gateway repositories
- **Deployment questions**: Use this utils repository

### Getting Help
- **GitHub Discussions**: General questions and community support
- **Component READMEs**: Detailed setup and troubleshooting guides
- **Issue templates**: Structured bug reports and feature requests

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

All components are open source and available under the same license.

## 🔗 Links

### Repositories
- **Utils & Deployment**: [cragcrowd-utils](https://github.com/shotah/cragcrowd-utils)
- **Backend API**: [cragcrowd-api](https://github.com/shotah/cragcrowd-api)
- **Web Interface**: [cragcrowd-web-ui](https://github.com/shotah/cragcrowd-web-ui)
- **Sensor Firmware**: [cragcrowd-firmware](https://github.com/shotah/cragcrowd-firmware)
- **Gateway Firmware**: [cragcrowd-gateway](https://github.com/shotah/cragcrowd-gateway)

### Hardware
- **LilyGO T3S3**: [Official Product Page](https://lilygo.cc/products/t3-s3-meshtastic)
- **Meshtastic**: [meshtastic.org](https://meshtastic.org)
- **LoRa Range Calculator**: [RF Calculator](https://www.rfwireless-world.com/calculators/LoRa-range-calculator.html)

### Documentation
- **PlatformIO**: [platformio.org](https://platformio.org)
- **ESP32 Docs**: [Espressif Documentation](https://docs.espressif.com/projects/esp-idf/)
- **React**: [react.dev](https://react.dev)

## 📧 Contact

For questions, suggestions, or collaboration opportunities:
- **Email**: christopherblodgett@gmail.com
- **GitHub**: [@shotah](https://github.com/shotah)
- **Discussions**: Use GitHub Discussions in any repository

---

*CragCrowd helps make climbing areas more accessible and sustainable for everyone. Join us in building the future of privacy-respecting outdoor recreation monitoring!*