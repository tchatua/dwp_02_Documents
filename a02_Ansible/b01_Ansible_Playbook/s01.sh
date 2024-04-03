# URL: 
# https://github.com/mlabouardy/pipeline-as-code-with-jenkins/blob/master/chapter4/distributed/master/setup.sh
# https://www.manning.com/books/pipeline-as-code

# echo "Installing Amazon Linux extras"
amazon-linux-extras install epel -y

# echo "Install Jenkins stable release"
yum remove -y java
amazon-linux-extras install java-openjdk11 -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install -y jenkins
chkconfig jenkins on
service jenkins start

# echo "Install git"
yum install -y git
