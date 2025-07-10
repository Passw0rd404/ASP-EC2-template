# ASP.NET Core EC2 Template

A template for deploying ASP.NET Core applications to AWS EC2 instances with automated setup and configuration.

## 🚀 Features

- Pre-configured ASP.NET Core application structure
- AWS EC2 deployment scripts and configuration
- Automated environment setup
- Production-ready configuration
- Security best practices implementation
- the app works on http://EC2-public-ip:8002

## 📋 Prerequisites

Before using this template, ensure you have:

- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate permissions
- An AWS account with EC2 access
- Terraform or OpenTofu installed
  ```

## ⚙️ Configuration

### AWS Configuration

1. **Configure AWS credentials**
   ```bash
   aws configure
   ```

2. **Update deployment configuration**
   Edit the configuration files in the `deployment/` directory:
   - `aws-config.json` - AWS-specific settings
   - `deployment-settings.json` - Deployment parameters

## 🛠️ Installation and Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/Passw0rd404/ASP-EC2-template.git
   cd ASP-EC2-template/infrastructure-live-v1/dev
   ```

2. **Build the project**
   ```bash
   terraform init or tofu init
   ```

4. **Run**
   ```bash
   terraform apply or tofu apply
 
## 🔧 Usage

The application will be available at `https://EC2-public-ip:8002`

### Production

Access your deployed application at your EC2 instance's public IP or domain name.

## 📁 Project Structure

```
├── README.md
└── infrastructure-live-v1
    ├── dev
    │   ├── build.sh
    │   ├── main.tf
    │   └── output.tf
    └── infrastructure-modules
        └── ec2
            ├── instanse.tf
            ├── output.tf
            ├── security.tf
            ├── template.tf
            ├── variables.tf
            ├── version.tf
            └── vpc.tf
```

### Security Groups

Ensure your EC2 security group allows:
- HTTP (port 80)
- HTTPS (port 443)
- SSH (port 22) - restrict to your IP

## 🆘 Support

If you encounter any issues:

1. Check the [Issues](https://github.com/Passw0rd404/ASP-EC2-template/issues) page
2. Verify AWS credentials and permissions
3. Check EC2 security group settings

## 🔗 Related Resources

- [ASP.NET Core Documentation](https://docs.microsoft.com/aspnet/core/)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [.NET Deployment Guide](https://docs.microsoft.com/dotnet/core/deploying/)
- [the source code repo](https://github.com/Passw0rd404/srv-02.git)
