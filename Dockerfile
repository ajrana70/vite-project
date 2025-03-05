FROM python:3.9-slim

# Setup environment variable
ENV DockerHOME=/home/app

# Set work directory
RUN mkdir -p $DockerHOME

# Where your code lives
WORKDIR $DockerHOME

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN pip3 install --upgrade pip

# Copy whole project to your Docker home directory
COPY . $DockerHOME

# Run this command to install all dependencies
RUN pip3 install -r requirements.txt

# RUN apt update
# RUN apt-get update

# # Install Terraform
# RUN wget https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_amd64.zip \
#     && unzip terraform_1.5.4_linux_amd64.zip \
#     && mv terraform /usr/local/bin/ \
#     && rm -rf terraform_1.5.4_linux_amd64.zip

# # Install ArgoCD
# RUN curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/download/v2.7.10/argocd-linux-amd64 \
#     && install -m 555 argocd-linux-amd64 /usr/local/bin/argocd \
#     && rm argocd-linux-amd64

# # Install kubectl
# RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
#     && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# # Install Helm
# RUN wget https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz \
#     && tar xvf helm-v3.9.3-linux-amd64.tar.gz \
#     && mv linux-amd64/helm /usr/local/bin \
#     && rm helm-v3.9.3-linux-amd64.tar.gz

# # Expose port where the Django app runs
EXPOSE 3000

# Reaching the execution directory for the project
# WORKDIR $DockerHOME/devopsui/devops_ui

# Run service
ENTRYPOINT ["/bin/bash", "../../startup.sh"]

# Start server
# CMD ["python", "manage.py", "runserver", "0.0.0.0:3000"]
