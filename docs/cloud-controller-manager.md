# Cloud Controller Manager

In order to install the OCI Cloud Controller Mananger (CCM) in your cluster you can run the "CCM" ansible role playbook. This will install the latest version of the CCM in your cluster.

The CCM needs to authenticate with OCI APIs and can use either user credentials or instance principals to do this. We recommend you use instance principals.

## Instance Principals Authentication

1. Create a dynamic group in the OCI console. For example `k8s-masters`.
2. Create a policy to allow the dynamic group to manage resources.

```
Allow dynamic-group k8s-cluster to \
manage all-resources in compartment id ocid1.compartment.oc1..aaaaaaaaob...
```

## Configuration

The CCM uses a configuration file to control how it authenticates to OCI and also to control which subnets it provisions load balancers in.

Add a file in roles/ccm/templates/cloud-provider-config.yaml.j2.
Modify the contents to look something like the following.

```yaml
auth:
  useInstancePrincipals: true
compartment: ocid1.compartment.oc1..aaaaaaaa
vcn: ocid1.vcn.oc1.eu-frankfurt-1.aaaaaaaa

loadBalancer:
  subnet1: ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaa
  subnet2: ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaa
  securityListManagementMode: All
```

Use Ansible to install the CCM.

```
@ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vi \
ansible/hosts.ini ansible/ccm.yaml
```

