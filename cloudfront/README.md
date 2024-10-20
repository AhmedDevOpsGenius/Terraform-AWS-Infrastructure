# AWS CloudFront Terraform Module

This Terraform module creates a fully dynamic AWS CloudFront distribution with optional settings. The module allows customization of origins, behaviors, cache settings, and other distribution configurations.

## Features

- Creates a CloudFront distribution with specified origins and behaviors.
- Supports dynamic configuration for multiple origins.
- Configurable cache behaviors, viewer protocols, and TTLs.
- Optionally associates an SSL certificate for HTTPS delivery.
- Supports custom error responses.


## Inputs

| Name                 | Description                                | Type    | Default                     | Required |
|----------------------|--------------------------------------------|---------|-----------------------------|----------|
| `enabled`            | Whether to create CloudFront distribution  | `bool`  | `true`                      |  no      |
| `comment`            | Comment for the CloudFront distribution    | `string`| `My CloudFront Distribution`|  no      |
| `price_class`        | The price class for CloudFront             | `string`| `PriceClass_100`            |  no      |
| `default_root_object`| The default object to serve                | `string`| `index.html`                |  no      |



## Outputs

| Name                          | Description                                    |
|-------------------------------|------------------------------------------------|
| `cloudfront_distribution_id`  | The ID of the CloudFront distribution          |
| `cloudfront_domain_name`      | The domain name of the CloudFront endpoint     |
| `cloudfront_hosted_zone_id`   | The CloudFront hosted zone ID                  |



## Resources Used

AWS CloudFront Distribution: Creates a CDN distribution that caches and delivers content from edge locations.

AWS Origin Access Identity (optional): Grants CloudFront access to an S3 bucket.


## Requirements

Terraform version >= 0.12

AWS provider version >= 3.0


## Usage

```hcl
module "cloudfront" {
  source              = "./cloudfront"
  
  enabled             = true
  comment             = "My CloudFront Distribution"
  price_class         = "PriceClass_100"
  default_root_object = "index.html"

  origin {
    domain_name = "my-bucket.s3.amazonaws.com"
    origin_id   = "s3-my-bucket"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    }
  }

  cache_behavior {
    path_pattern           = "/images/*"
    target_origin_id       = "s3-my-bucket"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  custom_error_response {
    error_code            = 404
    response_page_path    = "/error.html"
    response_code         = 200
    error_caching_min_ttl = 300
  }
}


**Example**

module "cloudfront" {
  source = "./cloudfront"

  #Add your configurations here...
}
