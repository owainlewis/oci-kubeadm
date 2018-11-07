MASTERS=$(terraform output master_public_ips)
AD1=$(terraform output node_ad_1_public_ips)
AD2=$(terraform output node_ad_2_public_ips)
AD3=$(terraform output node_ad_3_public_ips)

VCN=$(terraform output vcn_id)
COMPARTMENT=$(terraform output compartment_id)

SUBNET_AD_1=$(terraform output subnet_ad_1_id)
SUBNET_AD_2=$(terraform output subnet_ad_2_id)

echo "Writing hosts.ini file to ansible/hosts.ini"

cat > ansible/hosts.ini << EOF
[master]
$MASTERS

[node]
$AD1
$AD2
$AD3

[kube-cluster:children]
master
node
EOF

echo "Writing cloud-provider-config file to ansible/roles/addons/ccm/templates/cloud-provider-config.yaml.j2"

cat > ansible/roles/addons/ccm/templates/cloud-provider-config.yaml.j2 << EOF
auth:
  useInstancePrincipals: true

compartment: $COMPARTMENT
vcn: $VCN

loadBalancer:
  subnet1: $SUBNET_AD_1
  subnet2: $SUBNET_AD_2
  securityListManagementMode: All
EOF
