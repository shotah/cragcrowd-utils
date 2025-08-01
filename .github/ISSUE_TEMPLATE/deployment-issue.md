---
name: Deployment Issue
about: Report problems with system deployment or orchestration
title: '[DEPLOY] '
labels: 'deployment'
assignees: ''

---

**Deployment environment**
- [ ] Development (docker-compose.dev.yml)
- [ ] Production (docker-compose.yml)
- [ ] Cloud deployment
- [ ] Manual/custom deployment

**Issue description**
A clear and concise description of the deployment problem.

**To Reproduce**
Steps to reproduce the deployment issue:
1. Clone repositories using '...'
2. Run setup command '...'
3. Execute deployment '...'
4. See error

**Expected behavior**
What you expected to happen during deployment.

**Actual behavior**
What actually happened, including error messages.

**Environment details**
- Host OS: [e.g. Ubuntu 22.04, Windows 11, macOS 13]
- Docker version: [e.g. 24.0.6]
- Docker Compose version: [e.g. 2.21.0]
- Available RAM: [e.g. 8GB]
- Available disk space: [e.g. 50GB]
- Network connectivity: [e.g. corporate firewall, home broadband]

**Repository status**
Which repositories are present and their status:
- [ ] cragcrowd-utils (this repo)
- [ ] cragcrowd-api 
- [ ] cragcrowd-web-ui
- [ ] cragcrowd-firmware
- [ ] cragcrowd-gateway

**Error output**
```
# Command that failed
make quick-dev

# Error output
[paste complete error output here]

# Docker logs (if applicable)
docker-compose logs

# System logs (if relevant)
[paste relevant system logs]
```

**Configuration**
- Are .env files configured correctly?
- Any custom modifications to docker-compose files?
- Firewall or security software that might interfere?
- Previous successful deployments on this system?

**Services status**
```bash
# Output of: make status
[paste status output here]

# Output of: docker ps
[paste docker ps output here]
```

**Network configuration**
- Port conflicts? (3000, 3001, 27017)
- Proxy or VPN affecting connectivity?
- DNS resolution issues?

**Attempted solutions**
What have you already tried to fix the issue?
- [ ] Clean docker containers and restart
- [ ] Rebuilt docker images
- [ ] Checked port availability
- [ ] Verified repository cloning
- [ ] Reviewed .env configuration

**Additional context**
Any other information that might help diagnose the deployment issue.