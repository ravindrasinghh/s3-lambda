## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| block\_public\_acls | n/a | `bool` | `true` | no |
| block\_public\_policy | n/a | `bool` | `true` | no |
| bucket\_acl | n/a | `string` | `"private"` | no |
| bucket\_name | n/a | `string` | `"s3-lambda-dynamodb-v1"` | no |
| function\_name | n/a | `string` | `"s3-lmabda-v1"` | no |
| ignore\_public\_acls | n/a | `bool` | `true` | no |
| restrict\_public\_buckets | n/a | `bool` | `true` | no |
| versioning | n/a | `string` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_name | n/a |
| lambda\_function\_name | n/a |