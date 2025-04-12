terraform {
  
    backend "s3"{
        bucket="anjanaterraformbucket"
        key="terraform.tfstate"
        region="us-west-2"
        encrypt=true

    }
  }
