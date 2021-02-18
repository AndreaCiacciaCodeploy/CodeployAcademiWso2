# author: aciaccia
# create registry project artifact

FOLDER=../reg/EsbREGWorkshop2
GROUPID=com.corso.wso2.esb-workshop2.EsbREGWorkshop2
echo '*********************************'
echo 'Generate Registry Prod artifact';
echo 'folder: '.$FOLDER;
echo 'groupid: '.$GROUPID;

#cd to folder dir
cd $FOLDER;
rm artifact.xml
# regenerate artifact.xml file
#start gen artifact.xml.
echo '<?xml version="1.0" encoding="UTF-8"?><artifacts>' >> artifact.xml
#foreach all xml (except pom.xml and artifact.xml) files in src directory
for D in `find . -name '*.xml' ! -name 'pom.xml' ! -name 'artifact.xml' ! -path './*/.meta/*' ! -path './target/*'`
do
	#set full filename
	FILENAME=`echo $D | awk 'BEGIN { RS = "/" }; END {print $1}'`;
	#set foldername
	FOLDERNAME=`echo $D | awk 'BEGIN { FS = "/" }; END {print $4}'`;
	SRCFOLDER=`echo $D | awk 'BEGIN { FS = "/" }; END {print $2}'`;
	#set filename whitout extension .xml
	FNAME=`echo $FILENAME | awk 'BEGIN {FS = ".xml"}; END {print $1}'`;
  #replace dot and slash in filepath
	PATHTOXML=`echo $D | sed 's/^.\///g'`;

	if [[ "$FNAME" == *"-seq"* ]]; then
		echo '    <artifact name="'$FNAME'" groupId="'$GROUPID'.resource" version="1.0.0" type="registry/resource" serverRole="EnterpriseServiceBus">
					<item>
	        		<file>'$PATHTOXML'</file>
							<path>/_system/governance/'$SRCFOLDER'</path>
							<mediaType>application/vnd.wso2.sequence</mediaType>
					</item>
	    </artifact>' >> artifact.xml
	fi

	if [[ "$FNAME" == *"-config"* ]]; then
		echo '    <artifact name="'$FNAME'" groupId="'$GROUPID'.resource" version="1.0.0" type="registry/resource" serverRole="EnterpriseServiceBus">
					<item>
	        		<file>'$PATHTOXML'</file>
							<path>/_system/governance/'$SRCFOLDER'</path>
							<mediaType>application/vnd.wso2.sequence</mediaType>
					</item>
	    </artifact>' >> artifact.xml
	fi

	if [[ "$FNAME" == *"-tm"* ]]; then
		echo '    <artifact name="'$FNAME'" groupId="'$GROUPID'.resource" version="1.0.0" type="registry/resource" serverRole="EnterpriseServiceBus">
					<item>
	        		<file>'$PATHTOXML'</file>
							<path>/_system/governance/'$SRCFOLDER'</path>
							<mediaType>application/vnd.wso2.template</mediaType>
					</item>
	    </artifact>' >> artifact.xml
	fi

	if [[ "$FNAME" == *"-ep"* ]]; then
		echo '    <artifact name="'$FNAME'" groupId="'$GROUPID'.resource" version="1.0.0" type="registry/resource" serverRole="EnterpriseServiceBus">
					<item>
	        		<file>'$PATHTOXML'</file>
							<path>/_system/governance/'$SRCFOLDER'</path>
							<mediaType>application/vnd.wso2.esb.endpoint</mediaType>
					</item>
	    </artifact>' >> artifact.xml
	fi

done
#hmm seems really done
echo '</artifacts>' >> artifact.xml
#now just copy-paste
echo 'artifact.xml created';
echo 'mvn install running...';

(mvn clean install -l temp.build.log; grep -B 1 -A 500 Reactor\ Summary temp.build.log; rm temp.build.log);

echo 'finished';
