---
name: Multi-Repository Issue
about: Report issues affecting multiple CragCrowd components
title: '[MULTI] '
labels: 'multi-repo'
assignees: ''

---

**Describe the issue**
A clear and concise description of the problem affecting multiple components.

**Components affected**
- [ ] API (cragcrowd-api)
- [ ] Web UI (cragcrowd-web-ui)
- [ ] Sensor firmware (cragcrowd-firmware)
- [ ] Gateway firmware (cragcrowd-gateway)
- [ ] Deployment/Utils (cragcrowd-utils)

**Issue type**
- [ ] Integration problem between components
- [ ] Deployment/orchestration issue
- [ ] Cross-component feature request
- [ ] Documentation spans multiple repositories
- [ ] Security issue affecting multiple components

**To Reproduce (for integration issues)**
Steps to reproduce the behavior across components:
1. Start services using '...'
2. Configure component A with '...'
3. Send data from component B '...'
4. Observe error in component C

**Expected behavior**
A clear and concise description of what you expected to happen across the system.

**Current behavior**
What actually happens, including which components show issues.

**Environment**
- Deployment method: [e.g. docker-compose, manual, cloud]
- Docker version: [e.g. 24.0.6]
- Host OS: [e.g. Ubuntu 22.04, Windows 11, macOS 13]
- Network setup: [e.g. all local, API remote, mixed]

**Logs/Screenshots**
If applicable, add logs from multiple components:

```
# API logs
[paste API logs here]

# UI logs  
[paste UI logs here]

# Docker logs
[paste docker-compose logs here]
```

**Component versions**
- API commit/version: [e.g. abc123]
- UI commit/version: [e.g. def456]
- Firmware version: [e.g. ghi789]
- Gateway version: [e.g. jkl012]

**Integration testing**
- [ ] Tested with `make quick-dev`
- [ ] Tested individual components separately
- [ ] Tested with production docker-compose
- [ ] Tested cross-component communication

**Additional context**
- Are individual components working when tested separately?
- Has this integration worked before?
- Any recent changes to configuration or deployment?
- Network connectivity between components?

**Suggested repositories for investigation**
List the specific repositories where you think the issue might originate:
- Primary: [e.g. cragcrowd-api]
- Secondary: [e.g. cragcrowd-utils]

**Workaround**
If you've found a temporary workaround, describe it here.