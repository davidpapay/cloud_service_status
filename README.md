# Cloud Service Status
Application to monitor and show services health.
Application can register new services, check it's accesibility and show user friendly overview.

## Architecture
To be added

## Tech stack
• Azure  
• Terraform  
• Docker  
• GitHub Actions  
• Python FastAPI 
• Azure Monitor and Application Insights  

## Roadmap
• MVP application  
• Local development environment  
• Terraform infrastructure  
• CI pipeline  
• CD pipeline  
• Monitoring and alerting  
• Kubernetes deployment (optional advanced stage)

## Project goal
This project simulates a real world internal status platform used in production environments.  
It demonstrates DevOps practices such as IaC, CI CD, containerization, cloud deployment and observability.

## Development standards
This project follows professional DevOps practices including:

### Conventional Commits
Commit messages follow the Conventional Commits specification
(feat, fix, docs, chore, ci, refactor, etc.)
to keep the git history clean and readable.

### Commitlint + Husky
Commitlint validates every commit message.
Husky runs Commitlint via a `commit-msg` hook, preventing invalid commits.
This ensures consistent and professional commit messages across the project.

