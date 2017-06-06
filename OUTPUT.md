# Output
Example of terraform output

# Plan
```
$ terraform env select default
Switched to environment "default"!

$ terraform plan -out=plan.out -var-file=dev.tfvars
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_availability_zones.available: Refreshing state...
The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed. Cyan entries are data sources to be read.

Your plan was also saved to the path below. Call the "apply" subcommand
with this plan file and Terraform will exactly execute this execution
plan.

Path: plan.out

+ aws_elb.elb
    availability_zones.#:                   "<computed>"
    connection_draining:                    "false"
    connection_draining_timeout:            "300"
    cross_zone_load_balancing:              "true"
    dns_name:                               "<computed>"
    health_check.#:                         "1"
    health_check.0.healthy_threshold:       "2"
    health_check.0.interval:                "30"
    health_check.0.target:                  "HTTP:8080/"
    health_check.0.timeout:                 "3"
    health_check.0.unhealthy_threshold:     "2"
    idle_timeout:                           "60"
    instances.#:                            "<computed>"
    internal:                               "<computed>"
    listener.#:                             "1"
    listener.3931999347.instance_port:      "8080"
    listener.3931999347.instance_protocol:  "http"
    listener.3931999347.lb_port:            "80"
    listener.3931999347.lb_protocol:        "http"
    listener.3931999347.ssl_certificate_id: ""
    name:                                   "datadog-demo-default"
    security_groups.#:                      "<computed>"
    source_security_group:                  "<computed>"
    source_security_group_id:               "<computed>"
    subnets.#:                              "<computed>"
    tags.%:                                 "2"
    tags.Environment:                       "default"
    tags.Terraform:                         "true"
    zone_id:                                "<computed>"

+ aws_internet_gateway.default
    tags.%:           "3"
    tags.Environment: "default"
    tags.Name:        "datadog-demo-default"
    tags.Terraform:   "true"
    vpc_id:           "${aws_vpc.main.id}"

+ aws_key_pair.aws_ssh_key
    fingerprint: "<computed>"
    key_name:    "datadog-demo-default"
    public_key:  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUT+RkR7kRcs7m/VnfbZFzNeVLNrHc1hunqfUJcqzh03j8C5G9D+sJM5Ks/9+0zQMspYbSvdz82KS1k5UTAYj/4asoOABV+UjUwOWHVDmyB4bPael583QLu62q31zhQXhHxueoB1bA6vPXa/bvvLfvV+p6M746I5nUuqEqZLJSNXopC/iF0gCjlTa2ovLudJSqTwZ9K+brHsqAiMWF1xEPa3lc2buHpfLQa/Jp6YFDVEPhuyj+Uqcx63D+hRtXXBgNalRfdG8MFRhtPJ+T4ME6cgr96zGtPzAHJA0DPAvwGWNaGKdQtb31+xkKAh0e4xAzV24+SqkQjluugVH5U9gJ Administrator@chriskelner-mbp"

+ aws_route.internet_access
    destination_cidr_block:     "0.0.0.0/0"
    destination_prefix_list_id: "<computed>"
    egress_only_gateway_id:     "<computed>"
    gateway_id:                 "${aws_internet_gateway.default.id}"
    instance_id:                "<computed>"
    instance_owner_id:          "<computed>"
    nat_gateway_id:             "<computed>"
    network_interface_id:       "<computed>"
    origin:                     "<computed>"
    route_table_id:             "${aws_vpc.main.main_route_table_id}"
    state:                      "<computed>"

+ aws_subnet.public.0
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "us-east-2a"
    cidr_block:                      "10.0.1.0/24"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "true"
    tags.%:                          "3"
    tags.Environment:                "default"
    tags.Name:                       "datadog-demo-default-0"
    tags.Terraform:                  "true"
    vpc_id:                          "${aws_vpc.main.id}"

+ aws_subnet.public.1
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "us-east-2b"
    cidr_block:                      "10.0.2.0/24"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "true"
    tags.%:                          "3"
    tags.Environment:                "default"
    tags.Name:                       "datadog-demo-default-1"
    tags.Terraform:                  "true"
    vpc_id:                          "${aws_vpc.main.id}"

+ aws_subnet.public.2
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "us-east-2c"
    cidr_block:                      "10.0.3.0/24"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "true"
    tags.%:                          "3"
    tags.Environment:                "default"
    tags.Name:                       "datadog-demo-default-2"
    tags.Terraform:                  "true"
    vpc_id:                          "${aws_vpc.main.id}"

+ aws_vpc.main
    assign_generated_ipv6_cidr_block: "false"
    cidr_block:                       "10.0.0.0/16"
    default_network_acl_id:           "<computed>"
    default_route_table_id:           "<computed>"
    default_security_group_id:        "<computed>"
    dhcp_options_id:                  "<computed>"
    enable_classiclink:               "<computed>"
    enable_dns_hostnames:             "<computed>"
    enable_dns_support:               "true"
    instance_tenancy:                 "<computed>"
    ipv6_association_id:              "<computed>"
    ipv6_cidr_block:                  "<computed>"
    main_route_table_id:              "<computed>"
    tags.%:                           "3"
    tags.Environment:                 "default"
    tags.Name:                        "datadog-demo-default"
    tags.Terraform:                   "true"

+ module.elb_http_security_group.aws_security_group.sg
    description:      "For allowing HTTP Traffic to the ELB"
    egress.#:         "<computed>"
    ingress.#:        "<computed>"
    name:             "<computed>"
    name_prefix:      "datadog-demo-default"
    owner_id:         "<computed>"
    tags.%:           "2"
    tags.Environment: "default"
    tags.Terraform:   "true"
    vpc_id:           "${var.vpc_id}"

+ module.elb_http_security_group.aws_security_group_rule.inbound_http_from_anywhere
    cidr_blocks.#:            "1"
    cidr_blocks.0:            "0.0.0.0/0"
    from_port:                "80"
    protocol:                 "tcp"
    security_group_id:        "${aws_security_group.sg.id}"
    self:                     "false"
    source_security_group_id: "<computed>"
    to_port:                  "80"
    type:                     "ingress"

+ module.elb_http_security_group.aws_security_group_rule.outbound_internet_to_anywhere
    cidr_blocks.#:            "1"
    cidr_blocks.0:            "0.0.0.0/0"
    from_port:                "0"
    protocol:                 "-1"
    security_group_id:        "${aws_security_group.sg.id}"
    self:                     "false"
    source_security_group_id: "<computed>"
    to_port:                  "0"
    type:                     "egress"


Plan: 11 to add, 0 to change, 0 to destroy.
```
