
<!-- ABOUT THE PROJECT -->
## About The Project

[![Terraform](https://github.com/d4tagrama/terraform-cicd/actions/workflows/terraform.yml/badge.svg)](https://github.com/d4tagrama/terraform-cicd/actions/workflows/terraform.yml)

### Built With

This section should list any major frameworks/libraries used to bootstrap your project. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started 

This is an example of IaC with terraform using:

1. variables & locals
2. data
3. tfvars
4. backend (this is disabled)

We created a Github Action to validate and perform SAST checks with [Checkov](https://www.checkov.io/).

> [!WARNING]  
> We skip multiple Checkov's checks: KV_AWS_135,CKV_AWS_79,CKV_AWS_126,CKV_AWS_8,CKV_AWS_382,CKV_AWS_23,CKV2_AWS_11,CKV2_AWS_12,CKV2_AWS_5,CKV2_AWS_41
