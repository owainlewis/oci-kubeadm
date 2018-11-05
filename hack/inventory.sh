MASTERS=$(terraform output master_public_ips)
AD1=$(terraform output node_ad_1_public_ips)
AD2=$(terraform output node_ad_2_public_ips)
AD3=$(terraform output node_ad_3_public_ips)

echo "Writing hosts.ini file to ansible/hosts.ini"

cat > ansible/hosts.ini << EOL
[master]
$MASTERS

[node]
$AD1
$AD2
$AD3

[kube-cluster:children]
master
node
EOL
