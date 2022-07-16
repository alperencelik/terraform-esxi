# terraform-esxi
Repository to provision VM's vanilla ESXI without vSphere/vCenter

The provider that I'm using https://github.com/josenk/terraform-provider-esxi

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
