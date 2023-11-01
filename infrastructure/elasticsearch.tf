##
# Amazon Elasticsearch Service
##
resource "aws_elasticsearch_domain" "es" {
  domain_name           = var.domain
  elasticsearch_version = var.elasticsearch_version

  cluster_config {
    instance_type = var.instance_type
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  #   vpc_options {
  #     subnet_ids         = ["${aws_subnet.private-subnet-a.id}"]
  #     security_group_ids = ["${aws_security_group.sgdb.id}"]
  #   }

  tags = {
    Domain = "Challenge Domain"
  }
  access_policies = <<CONFIG
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "AWS": "*"
          },
          "Action": [
            "es:*"
          ]
        }
      ]
    }
    CONFIG

  #   access_policies = <<CONFIG
  # {
  #   "Version": "2012-10-17",
  #   "Statement": [
  #     {
  #       "Effect": "Allow",
  #       "Principal": {
  #         "AWS": "*"
  #       },
  #       "Action": [
  #         "es:*"
  #       ],
  #       "Condition": {
  #         "IpAddress": {
  #           "aws:SourceIp": [
  #             "191.255.229.6"
  #           ]
  #         }
  #       }
  #     }
  #   ]
  # }
  # CONFIG

  #   access_policies = <<CONFIG
  #   {
  #       "Version": "2012-10-17",
  #       "Statement": [
  #           {
  #               "Effect": "Allow",
  #               "Principal": {
  #                   "AWS": [
  #                       "*"
  #                   ]
  #               },
  #               "Action": [
  #                   "es:*"
  #               ],
  #               "Resource": "arn:aws:es:us-east-1:${var.aws_account}:domain/${var.domain}/*"
  #           }
  #       ]
  #   }
  #   CONFIG
}
