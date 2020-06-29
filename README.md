# AWS Auth Cognito

In this repository we store modules that relate to auth with Cognito

## Modules

### Pool

The pool module sets up the basics for a user pool.

name|type|description
---|---|---
region|string|The AWS region. Used for the domain name
pool_name|string|Name of the created pool

### Clients

Creates clients and a resource that are linked to a user pool.

name|type|description
users|list(object)|A list of all users that should be created 
resource_name|string|Name of the resource you wished to be used
resource_scopes|map|A map of scopes and their descriptions that a resource can have
project_name|string|A prefix that is used to denote the project itself
pool_name|string|The name of an existing user pool
