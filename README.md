# CI/CD Pipeline with Maven and Jenkins (End-to-End)

> **Project Goal:** Automate the build process of a Java-based registration app using Maven and Jenkins, with GitHub for source control and an Ubuntu server for hosting Jenkins.

---

## 🛠️ Tools & Technologies

- **Jenkins** – CI/CD automation server
- **Maven** – Java build and dependency management tool
- **Git & GitHub** – Version control and source code repository
- **Ubuntu EC2** – Server environment
- **Java 21** – Runtime and compilation environment

---

## 📈 Architecture Flow

1. Developer pushes code to GitHub.
2. Jenkins pulls code from GitHub.
3. Maven compiles and builds the application.
4. Jenkins stores the artifact in a target directory.

---

## ⚙️ Setup Instructions

### 🔹 1. Provision Ubuntu Server (EC2)

```bash
# Set a password for the default Ubuntu user
sudo passwd ubuntu

# Enable password authentication
cd /etc/ssh
sudo vi sshd_config
# Uncomment: PasswordAuthentication yes

# Restart SSH daemon
sudo systemctl restart sshd
```

### 🔹 2. Update and Install Java 21

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-21-jdk -y

# Check Java path
readlink -f $(which java)

# Set JAVA_HOME
cd
vi .profile
# Add below lines to the end:
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
export PATH="$PATH:$JAVA_HOME/bin"

# Apply changes
source .profile
```

### 🔹 3. Install Maven

```bash
# Download Maven
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip

# Install unzip
sudo apt install unzip -y

# Unzip Maven
sudo unzip apache-maven-3.9.9-bin.zip -d /opt

# Clean up
sudo rm apache-maven-3.9.9-bin.zip

# Set environment variables
vi ~/.profile
# Add:
export MAVEN_HOME="/opt/apache-maven-3.9.9"
export M2_HOME="/opt/apache-maven-3.9.9"
export PATH="$PATH:$MAVEN_HOME/bin:$M2_HOME/bin"

# Apply changes
source ~/.profile

# Check version
mvn --version
```

---

## 🧪 Git & GitHub Commands Used

```bash
# Set identity
git config --global user.name "<your-name>"
git config --global user.email "<your-email>"

# Git basics
git add .
git commit -m "message"
git push

git status

# Branching
git branch sprint1
git checkout sprint1
git switch sprint1

git merge sprint1

git push --all origin

git remote add origin <repo-url>
git push --set-upstream origin main

git checkout -b fixit1
git diff
git revert HEAD
git reset --hard <commit-id>
```

---

## ⚙️ Jenkins Installation via Script

```bash
# Create jenkins.sh file
vi jenkins.sh

# Add the following:
#!/bin/bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update -y
sudo apt-get install jenkins -y

# Make script executable
chmod u+x jenkins.sh

# Run the script
bash jenkins.sh
```

### Open Jenkins

```bash
# Ensure Jenkins is running
sudo systemctl status jenkins

# Check port
sudo netstat -tnlp | grep :8080

# Get server IP
ifconfig

# Access: http://<server-ip>:8080

# Retrieve admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### Jenkins UI Setup

- Install suggested plugins
- Configure JDK: Add JAVA_HOME `/usr/lib/jvm/java-21-openjdk-amd64`
- Configure Maven: Add MAVEN_HOME `/opt/apache-maven-3.9.9`

---

## 🚀 CI/CD Pipeline Configuration in Jenkins

### Create Freestyle Project

- Name: `Project_Henry`
- Source Code Management: Git → `https://github.com/olat95/registration-app-devops.git`
- Build Trigger: (Optional) GitHub webhook
- Build Step: `Invoke top-level Maven targets`
  - Maven Version: `MAVEN_HOME`
  - Goals: `test install`

### Execute Build

- Click **Build Now**
- Jenkins pulls source → runs Maven → stores artifact in `target/`

#### 📸 Screenshots

**Git Repository Configuration**

![Git SCM](../mnt/data/991d08b4-4a5d-4824-92eb-b8f50d3e7671.png)

**Build Step with Maven**

![Maven Build](../mnt/data/18951c9e-3c19-4a18-9a11-4d60a75f262a.png)

**Successful Build History**

![Build Success](../mnt/data/ecdf0ade-fdf1-4577-a7db-e1a9054464d3.png)

---

---

## 🧠 Reflections & Learnings

- Understood how to automate Java project builds with Maven.
- Gained hands-on with Git commands for local/remote branch management.
- Learned how to configure and automate Jenkins with custom build steps.
- Understood the interaction between Jenkins, GitHub, and Maven.

---

## 📎 Resources

- [Apache Maven](https://maven.apache.org/)
- [Jenkins Official Docs](https://www.jenkins.io/doc/)
- [Git Documentation](https://git-scm.com/doc)

---

> 🧠 **Week 1 Complete!** Stay tuned for the next project in this DevOps journey.
