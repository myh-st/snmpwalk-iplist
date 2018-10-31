echo ""
echo "Please input ip-list.txt in same script directory. Once IP per line !!"
echo ""
read -p "SNMP Version: " -e -i 2c SNMPVER 
read -p "SNMP Community String: " -e COMSTR
read -p "SNMP MIBs: " -e -i SNMPv2-MIB::sysName.0 SNMPMIB
read -p "IP List File Name: " -e WALKFILE
if [[ ! -e walk-results ]]; then
mkdir -p walk-results
fi
while read F ; do
WALK=$(snmpwalk -v $SNMPVER -c $COMSTR $F $SNMPMIB | grep "STRING:" |  cut -d " " -f 4)
echo "$F $WALK" >> walk-results/WalksysName-$WALKFILE
done <$WALKFILE
echo ""
echo "...Done! "
echo ""