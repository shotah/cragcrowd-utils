# CragCrowd Multi-Repository Management

# Repository paths (relative to this utils repo)
API_DIR = ../cragcrowd-api
UI_DIR = ../cragcrowd-web-ui
FIRMWARE_DIR = ../cragcrowd-firmware
GATEWAY_DIR = ../cragcrowd-gateway

.PHONY: help setup-all build-all start stop restart logs clean dev-start dev-stop firmware gateway api ui

# Default target
all: help

# Help
help:
	@echo "CragCrowd Multi-Repository Management"
	@echo ""
	@echo "🚀 Quick Start Commands:"
	@echo "  quick-dev         - Clone repos + setup + start development"
	@echo "  quick-prod        - Setup + build + start production"
	@echo ""
	@echo "📦 Setup Commands:"
	@echo "  setup-all         - Setup all projects"
	@echo "  clone-repos       - Instructions to clone all repositories"
	@echo ""
	@echo "🏗️  Build Commands:"
	@echo "  build-all         - Build all Docker images"
	@echo "  firmware-build    - Build all firmware"
	@echo ""
	@echo "🔧 Development Commands:"
	@echo "  dev-start         - Start development environment"
	@echo "  dev-stop          - Stop development environment"
	@echo "  dev-logs          - View development logs"
	@echo ""
	@echo "🚀 Production Commands:"
	@echo "  prod-start        - Start production services"
	@echo "  prod-stop         - Stop production services"
	@echo "  prod-logs         - View production logs"
	@echo ""
	@echo "🧪 Testing Commands:"
	@echo "  test-all          - Run tests for all projects"
	@echo "  lint-all          - Lint all projects"
	@echo ""
	@echo "🔧 Individual Project Commands:"
	@echo "  api               - Work with API project"
	@echo "  ui                - Work with UI project"
	@echo "  firmware          - Work with firmware project"
	@echo "  gateway           - Work with gateway project"
	@echo ""
	@echo "🧹 Maintenance Commands:"
	@echo "  clean             - Clean all build artifacts"
	@echo "  update-all        - Update all dependencies"
	@echo "  status            - Check status of all services"

# Quick start commands
quick-dev:
	@echo "🚀 Setting up CragCrowd development environment..."
	$(MAKE) check-repos
	$(MAKE) setup-all
	$(MAKE) dev-start
	@echo ""
	@echo "✅ Development environment ready!"
	@echo "🌐 Web UI: http://localhost:3001"
	@echo "🔗 API: http://localhost:3000"
	@echo "📊 Health Check: http://localhost:3000/api/health"

quick-prod:
	@echo "🚀 Setting up CragCrowd production environment..."
	$(MAKE) check-repos
	$(MAKE) setup-all
	$(MAKE) build-all
	$(MAKE) prod-start
	@echo ""
	@echo "✅ Production environment ready!"
	@echo "🌐 Access: http://localhost:3001"

# Repository management
clone-repos:
	@echo "📦 To set up all CragCrowd repositories, run these commands:"
	@echo ""
	@echo "mkdir cragcrowd && cd cragcrowd"
	@echo "git clone https://github.com/shotah/cragcrowd-utils.git"
	@echo "git clone https://github.com/shotah/cragcrowd-api.git"
	@echo "git clone https://github.com/shotah/cragcrowd-web-ui.git"
	@echo "git clone https://github.com/shotah/cragcrowd-firmware.git"
	@echo "git clone https://github.com/shotah/cragcrowd-gateway.git"
	@echo ""
	@echo "Then run: cd cragcrowd-utils && make quick-dev"

check-repos:
	@echo "🔍 Checking for required repositories..."
	@if [ ! -d "$(API_DIR)" ]; then \
		echo "❌ API repository not found at $(API_DIR)"; \
		echo "Run 'make clone-repos' for setup instructions"; \
		exit 1; \
	fi
	@if [ ! -d "$(UI_DIR)" ]; then \
		echo "❌ UI repository not found at $(UI_DIR)"; \
		echo "Run 'make clone-repos' for setup instructions"; \
		exit 1; \
	fi
	@if [ ! -d "$(FIRMWARE_DIR)" ]; then \
		echo "❌ Firmware repository not found at $(FIRMWARE_DIR)"; \
		echo "Run 'make clone-repos' for setup instructions"; \
		exit 1; \
	fi
	@if [ ! -d "$(GATEWAY_DIR)" ]; then \
		echo "❌ Gateway repository not found at $(GATEWAY_DIR)"; \
		echo "Run 'make clone-repos' for setup instructions"; \
		exit 1; \
	fi
	@echo "✅ All repositories found"

# Setup commands
setup-all: check-repos
	@echo "🔧 Setting up all CragCrowd projects..."
	@if [ -d "$(API_DIR)" ]; then \
		echo "Setting up API..."; \
		$(MAKE) -C $(API_DIR) setup || echo "API setup skipped"; \
	fi
	@if [ -d "$(UI_DIR)" ]; then \
		echo "Setting up UI..."; \
		$(MAKE) -C $(UI_DIR) setup || echo "UI setup skipped"; \
	fi
	@if [ -d "$(FIRMWARE_DIR)" ]; then \
		echo "Setting up firmware..."; \
		$(MAKE) -C $(FIRMWARE_DIR) setup || echo "Firmware setup skipped"; \
	fi
	@if [ -d "$(GATEWAY_DIR)" ]; then \
		echo "Setting up gateway..."; \
		$(MAKE) -C $(GATEWAY_DIR) setup || echo "Gateway setup skipped"; \
	fi
	@echo "✅ All projects setup complete"

# Build commands
build-all:
	@echo "🏗️  Building all Docker images..."
	docker-compose build

firmware-build: check-repos
	@echo "🔧 Building all firmware..."
	@if [ -d "$(FIRMWARE_DIR)" ]; then \
		echo "Building sensor firmware..."; \
		$(MAKE) -C $(FIRMWARE_DIR) build; \
	fi
	@if [ -d "$(GATEWAY_DIR)" ]; then \
		echo "Building gateway firmware..."; \
		$(MAKE) -C $(GATEWAY_DIR) build; \
	fi

# Development commands
dev-start:
	@echo "🚀 Starting development environment..."
	docker-compose -f docker-compose.dev.yml up -d
	@echo "✅ Development services started"
	@echo "🌐 Web UI: http://localhost:3001"
	@echo "🔗 API: http://localhost:3000"

dev-stop:
	@echo "🛑 Stopping development environment..."
	docker-compose -f docker-compose.dev.yml down

dev-logs:
	@echo "📋 Development service logs:"
	docker-compose -f docker-compose.dev.yml logs -f

# Production commands
prod-start:
	@echo "🚀 Starting production environment..."
	docker-compose up -d
	@echo "✅ Production services started"

prod-stop:
	@echo "🛑 Stopping production environment..."
	docker-compose down

prod-logs:
	@echo "📋 Production service logs:"
	docker-compose logs -f

restart:
	@echo "🔄 Restarting services..."
	docker-compose restart

# Testing commands
test-all: check-repos
	@echo "🧪 Running tests for all projects..."
	@if [ -d "$(API_DIR)" ]; then \
		echo "Testing API..."; \
		$(MAKE) -C $(API_DIR) test || echo "API tests failed"; \
	fi
	@if [ -d "$(UI_DIR)" ]; then \
		echo "Testing UI..."; \
		$(MAKE) -C $(UI_DIR) test || echo "UI tests failed"; \
	fi

lint-all: check-repos
	@echo "🔍 Linting all projects..."
	@if [ -d "$(API_DIR)" ]; then \
		echo "Linting API..."; \
		$(MAKE) -C $(API_DIR) lint || echo "API linting failed"; \
	fi
	@if [ -d "$(UI_DIR)" ]; then \
		echo "Linting UI..."; \
		$(MAKE) -C $(UI_DIR) lint || echo "UI linting failed"; \
	fi

# Individual project access
api: check-repos
	@echo "🔧 API project commands:"
	@echo "Available: setup, install, build, dev, start, test, lint, clean"
	@echo "Usage: make -C $(API_DIR) <command>"

ui: check-repos
	@echo "🎨 UI project commands:"
	@echo "Available: setup, install, build, dev, start, test, lint, clean"
	@echo "Usage: make -C $(UI_DIR) <command>"

firmware: check-repos
	@echo "📡 Firmware project commands:"
	@echo "Available: setup, build, upload, monitor, deploy, clean"
	@echo "Usage: make -C $(FIRMWARE_DIR) <command>"

gateway: check-repos
	@echo "🌐 Gateway project commands:"
	@echo "Available: setup, build, upload, monitor, deploy, clean"
	@echo "Usage: make -C $(GATEWAY_DIR) <command>"

# Maintenance commands
clean:
	@echo "🧹 Cleaning all containers and build artifacts..."
	docker-compose down -v --remove-orphans
	docker-compose -f docker-compose.dev.yml down -v --remove-orphans
	docker system prune -f
	@if [ -d "$(API_DIR)" ]; then $(MAKE) -C $(API_DIR) clean || echo "API clean skipped"; fi
	@if [ -d "$(UI_DIR)" ]; then $(MAKE) -C $(UI_DIR) clean || echo "UI clean skipped"; fi
	@if [ -d "$(FIRMWARE_DIR)" ]; then $(MAKE) -C $(FIRMWARE_DIR) clean || echo "Firmware clean skipped"; fi
	@if [ -d "$(GATEWAY_DIR)" ]; then $(MAKE) -C $(GATEWAY_DIR) clean || echo "Gateway clean skipped"; fi

update-all: check-repos
	@echo "📦 Updating all project dependencies..."
	@if [ -d "$(API_DIR)" ]; then $(MAKE) -C $(API_DIR) install || echo "API update skipped"; fi
	@if [ -d "$(UI_DIR)" ]; then $(MAKE) -C $(UI_DIR) install || echo "UI update skipped"; fi
	@if [ -d "$(FIRMWARE_DIR)" ]; then $(MAKE) -C $(FIRMWARE_DIR) install-deps || echo "Firmware update skipped"; fi
	@if [ -d "$(GATEWAY_DIR)" ]; then $(MAKE) -C $(GATEWAY_DIR) install-deps || echo "Gateway update skipped"; fi

status:
	@echo "📊 Service Status:"
	@echo ""
	@echo "Production services:"
	@docker-compose ps 2>/dev/null || echo "No production services running"
	@echo ""
	@echo "Development services:"
	@docker-compose -f docker-compose.dev.yml ps 2>/dev/null || echo "No development services running"

# Environment setup helpers
setup-env:
	@echo "⚙️  Setting up environment files..."
	@if [ ! -f "$(API_DIR)/.env" ] && [ -f "$(API_DIR)/.env.example" ]; then \
		cp $(API_DIR)/.env.example $(API_DIR)/.env; \
		echo "Created $(API_DIR)/.env from example"; \
	fi
	@if [ ! -f "$(UI_DIR)/.env" ] && [ -f "$(UI_DIR)/.env.example" ]; then \
		cp $(UI_DIR)/.env.example $(UI_DIR)/.env; \
		echo "Created $(UI_DIR)/.env from example"; \
	fi
	@echo "⚠️  Remember to edit .env files with your specific configuration!"

# Health checks
health-check:
	@echo "🏥 Health Check:"
	@echo "API Health:" && curl -s http://localhost:3000/api/health | jq . || echo "API not responding"
	@echo "UI Status:" && curl -s -o /dev/null -w "%{http_code}" http://localhost:3001 || echo "UI not responding"

# Development helpers
logs-api:
	docker-compose logs -f cragcrowd-api-dev 2>/dev/null || docker-compose logs -f cragcrowd-api

logs-ui:
	docker-compose logs -f cragcrowd-web-ui-dev 2>/dev/null || docker-compose logs -f cragcrowd-web-ui

logs-db:
	docker-compose logs -f mongodb-dev 2>/dev/null || docker-compose logs -f mongodb