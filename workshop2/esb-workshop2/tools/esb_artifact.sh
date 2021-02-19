# author: aciaccia
# create esb config project artifact

FOLDER=../esb/EsbCPWorkshop2
GROUPID=com.corso.wso2.esb-workshop2.EsbCPWorkshop2
echo '*************************************'
echo 'Generate Esb Config Project artifact';
echo 'folder: '.$FOLDER;
echo 'groupid: '.$GROUPID;

cd $FOLDER
rm artifact.xml

echo '<?xml version="1.0" encoding="UTF-8"?><artifacts>' >> artifact.xml

for D in `find . -name '*.xml' ! -name 'pom.xml' ! -name 'artifact.xml' ! -path './*/.meta/*' ! -path './target/*'`
do
  #set full filename
  FILENAME=`echo $D | awk 'BEGIN { RS = "/" }; END {print $1}'`;
  #set foldername
  FOLDERNAME=`echo $D | awk 'BEGIN { FS = "/" }; END {print $5}'`;
  SRCFOLDER=`echo $D | awk 'BEGIN { FS = "/" }; END {print $2}'`;
  #set filename whitout extension .xml
  FNAME=`echo $FILENAME | awk 'BEGIN {FS = ".xml"}; END {print $1}'`;
  #replace dot and slash in filepath
  PATHTOXML=`echo $D | sed 's/^.\///g'`;
  #set type

if [ "$FOLDERNAME" == "api" ]; then

  echo '    <artifact name="'$FNAME'" groupId="'$GROUPID'.api" version="1.0.0" type="synapse/api" serverRole="EnterpriseServiceBus">
            <file>'$PATHTOXML'</file>
    </artifact>' >> artifact.xml

fi

if [ "$FOLDERNAME" == "sequences" ]; then

  echo '    <artifact name="'$FNAME'" groupId="'$GROUPID'.sequence" version="1.0.0" type="synapse/sequence" serverRole="EnterpriseServiceBus">
            <file>'$PATHTOXML'</file>
    </artifact>' >> artifact.xml

fi

if [ "$FOLDERNAME" == "templates" ]; then

  echo '    <artifact name="'$FNAME'" groupId="'$GROUPID'.template" version="1.0.0" type="synapse/sequenceTemplate" serverRole="EnterpriseServiceBus">
            <file>'$PATHTOXML'</file>
    </artifact>' >> artifact.xml

fi

if [ "$FOLDERNAME" == "proxy-services" ]; then

	echo '    <artifact name="'$FNAME'" groupId="'$GROUPID'.proxy-service" version="1.0.0" type="synapse/proxy-service" serverRole="EnterpriseServiceBus">
						<file>'$PATHTOXML'</file>
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
