variable "enabled" {
  description = "Whether the CloudFront distribution is enabled"
  type        = bool
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution"
  type        = bool
  default     = true
}

variable "default_root_object" {
  description = "The default root object"
  type        = string
  default     = ""
}

variable "origin_domain_name" {
  description = "The domain name of the origin"
  type        = string
}

variable "origin_id" {
  description = "The origin ID for the distribution"
  type        = string
}

variable "http_port" {
  description = "The HTTP port the custom origin listens on"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "The HTTPS port the custom origin listens on"
  type        = number
  default     = 443
}

variable "origin_protocol_policy" {
  description = "The origin protocol policy to apply to your origin"
  type        = string
  default     = "https-only"
}

variable "origin_ssl_protocols" {
  description = "The SSL protocols to allow"
  type        = list(string)
  default     = ["TLSv1.2"]
}

variable "allowed_methods" {
  description = "List of allowed HTTP methods"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "List of HTTP methods to cache"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "viewer_protocol_policy" {
  description = "The policy to apply when viewers use HTTP"
  type        = string
  default     = "redirect-to-https"
}

variable "query_string" {
  description = "Indicates whether CloudFront should forward query strings"
  type        = bool
  default     = false
}

variable "cookie_forwarding" {
  description = "Specifies how cookies should be forwarded"
  type        = string
  default     = "none"
}

variable "min_ttl" {
  description = "The minimum amount of time that you want objects to stay in the CloudFront cache"
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "The default amount of time (in seconds) that an object is in a CloudFront cache"
  type        = number
  default     = 3600
}

variable "max_ttl" {
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache"
  type        = number
  default     = 86400
}

variable "price_class" {
  description = "The price class for this distribution"
  type        = string
  default     = "PriceClass_All"
}

variable "restriction_type" {
  description = "The restriction type of the geo restriction"
  type        = string
  default     = "none"
}

variable "geo_restriction_locations" {
  description = "The ISO 3166-1-alpha-2 codes for which you want CloudFront to distribute content"
  type        = list(string)
  default     = []
}

variable "cloudfront_default_certificate" {
  description = "Whether to use the default CloudFront certificate"
  type        = bool
  default     = true
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
  default     = ""
}

variable "ssl_support_method" {
  description = "Specifies how you want CloudFront to serve HTTPS requests"
  type        = string
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "The minimum version of the SSL protocol that you want CloudFront to use"
  type        = string
  default     = "TLSv1.2_2021"
}

variable "tags" {
  description = "Tags to assign to the resources"
  type        = map(string)
  default     = {}
}
