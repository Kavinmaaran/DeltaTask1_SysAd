# DeltaTask1_SysAd

## Omega Bank Server Setup

## To sign in a user:
``sudo -u <username> bash``

## While starting a new server
``apt update``  
``apt upgrade``     
``apt install sudo acl wget git``   

### Apply these commands to get started:

``sudo useradd -m -d /home/CEO CEO``  
``cd /home/CEO``    
sign in to User CEO   
``git clone https://github.com/kavin033/DeltaTask1_SysAd.git``  
``mv DeltaTask1_SysAd/init.sh .``  
``chmod +x init.sh``  
``./init.sh``   

#### sign in to Root user while using ``genUser.sh`` and ``permit.sh``
