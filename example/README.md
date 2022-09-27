# terraform-esxi

This example installs Kubernetes on freshly created VM's by terraform via project called Noobspray which is inspired by kubespray.

# How to use

Since the provider uses SSH connection to create vm's we need to enable "SSH" on ESXI Host.

## Usage

1. Enable SSH on ESXI host.
  
      ***https://phoenixnap.com/kb/esxi-enable-ssh***

2. Clone this repository.

    `git clone https://github.com/alperencelik/terraform-esxi`

3. Edit the variables on ***variables.tf***

   `vim variables.tf`
    
4. Then we are ready to initialize.

   `terraform init`
    
5. Plan the infrastructure.

   `terraform plan`
  
6. If everything seems okay then apply for creating VM's.

   `terraform apply`

7. After creating the required infrastructure we need to change hostnames in vm's and set up our inventory. To do that 

  `./script.sh change-hostname`

   This will change hostnames of vm's accordingly and do some ssh key copying stuff.

8. To install kubernetes run the script with "install-kubernetes" flag and the cluster should be up and running in 10 minutes due to cluster size.

    `./script.sh install-kubernetes`


