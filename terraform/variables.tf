variable "region" {
  default = "us-west-2"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository used for our Docker image."
  type = string
  default = "test-ecr1"
  
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "003235076673",
  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      rolearn  = "arn:aws:iam::003235076673:role/testrole1"
      username = "testrole1"
      groups   = ["system:masters"]
    },
  ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::003235076673:user/sz.kopanyi@gmail.com"
      username = "sz.kopanyi@gmail.com"
      groups   = ["system:masters"]
    },
  ]
}