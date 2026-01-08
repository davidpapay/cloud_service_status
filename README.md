# Cloud Service Status
A production-grade DevOps demonstration project that simulates an internal cloud service status platform. The focus of this repository is infrastructure, CI/CD, cloud automation, and observability, not just the application itself.

## Project Purpose
This project demonstrates how a modern DevOps engineer designs, builds, and operates scalable cloud systems using industry best practices.
It simulates a real-world internal status/health platform used by engineering teams to:
• Monitor service health
• Expose readiness and liveness endpoints
• Track deployed versions
• Observe system behavior via metrics and logs
The application is intentionally simple. The value is in the engineering around it.

## Architecture (High-level)
Developer → GitHub → CI/CD → Azure → Observability

Local Dev
└─ Docker

GitHub Actions
├─ Build & push Docker image (GHCR)
├─ Terraform plan (dev + prod)
└─ Terraform apply (controlled)

Azure
├─ Resource Groups (dev / prod)
├─ Azure Container Registry
├─ Container runtime (future: AKS)
└─ Azure Monitor & Application Insights

## Tech Stack

### Cloud & Infrastructure
• Microsoft Azure
• Terraform (IaC, remote state, dev/prod separation)

### CI/CD
• GitHub Actions
• GitHub Container Registry (GHCR)
• OIDC / Service Principal authentication

### Containers
• Docker

### Application
• Python
• FastAPI

### Observability
• Azure Monitor
• Application Insights

## Application Features
• /health – liveness probe
• /ready – readiness probe
• /version – deployed version visibility

Designed to be:
• Container-ready
• Kubernetes-ready
• Observable by default

## CI/CD Pipeline
The repository contains a production-style pipeline:
1. Build & Push
    • Docker image build
    • Push to GHCR
    • Image tagged by commit SHA
2. Terraform Plan
    • Separate dev and prod configurations
    • Remote backend
    • Artifact-based plan transfer
3. Terraform Apply
    • Uses pre-generated plan
    • Authenticated via Azure Service Principal
    • Fully automated, auditable flow

## Roadmap
• MVP application  
• Local development environment  
• Terraform infrastructure  
• CI pipeline  
• CD pipeline  
• Monitoring and alerting  
• Kubernetes deployment (optional advanced stage)

## Development Standards

### Conventional Commits
All commits follow the Conventional Commits specification (feat, fix, ci, docs, chore, refactor, etc.) to ensure readable git history and support automation.

### Commitlint + Husky
• Commitlint validates commit messages
• Husky enforces rules via git hooks
Invalid commits are rejected automatically.

## What This Project Demonstrates
• Real-world DevOps workflows
• Infrastructure as Code maturity
• Secure cloud authentication patterns
• CI/CD separation of concerns
• Environment parity (dev / prod)
• Observability-first mindset

## Note
The emphasis is on how systems are built and operated, not on application complexity.