apt update
apt install openjdk-8-jre-headless
# apt install net-tools

cd /opt
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -zxvf latest-unix.tar.gz

adduser nexus
chown -R nexus:nexus nexus-3.28.1-01
chown -R nexus:nexus sonatype-work

# old
# vim nexus-3.28.1-01/bin/nexus.rc
# run_as_user="nexus"

su - nexus
/opt/nexus-3.28.1-01/bin/nexus start

ps aux | grep nexus
netstat -lnpt

===========================================
# Install Java JDK 8 update 412
wget https://download.bell-sw.com/java/8u412+9/bellsoft-jdk8u412+9-linux-amd64.deb
dpkg -i bellsoft-jdk8u412+9-linux-amd64.deb
apt --fix-broken install -y
dpkg -i bellsoft-jdk8u412+9-linux-amd64.deb