echo ""
echo "Please input ip-list.txt in same script directory. Once IP per line !!"
echo ""
read -p "SNMP Version: " -e -i 2c SNMPVER 
read -p "SNMP Community String: " -e COMSTR
read -p "IP List File Name: " -e WALKFILE
if [[ ! -e walk-results ]]; then
mkdir -p walk-results
fi
while read F ; do
WALK=$(snmpwalk -v $SNMPVER -c $COMSTR $F SNMPv2-MIB::sysName.0)
echo "$F $WALK" >> walk-results/WalksysName-$WALKFILE
done <$WALKFILE
echo ""
echo "...Done! "
echo ""