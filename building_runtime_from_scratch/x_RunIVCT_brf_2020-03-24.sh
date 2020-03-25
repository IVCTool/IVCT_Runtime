#! /bin/bash
#
# x_RunIVCT.sh
#
# Startscript um die IVCT_Runtime Umgebung mit allen Bestandteilen 
# jeweils in eigenen Fenstern zu starten
#
################################################################
#
# versionen      brf
# 20200319 brf  einige Variablen flexiber gestaltet
# 20200124 brf  Um Verwendung mit Portico statt pRTI erweitert
# 20191203 brf  Anpassung an  neue Runtime-Umgebung 
# 20190927 brf  Neuaufbau einer eigenen Test-Umgebung 
# 20190508 brf  Namen der Anwendungen wurden veraendert 
# 20181212 brf  RunIVCT.bat von mul fuer Linux ueberarbeitet 
#
################################################################


# ------------------------------------------------------
# Variablen und Pfade
# ------------------------------------------------------

# IVCT_HOME  is the runtime environment
export IVCT_HOME=/opt/IVCTool_b/IVCT_Runtime
export IVCT_CONF=${IVCT_HOME}

###  RTI - Path
export PRTI1516E_HOME=/opt/prti1516e

export LRC_HOME=$RTI_HOME
export LRC_CLASSPATH=${PRTI1516E_HOME}/lib/prti1516e.jar

export IVCT_SUT_HOME_ID=${IVCT_HOME}/IVCTsut
export IVCT_TS_HOME_ID=${IVCT_HOME}/TestSuites
export IVCT_TS_DEF_HOME_ID=${IVCT_HOME}/TestSuites

export IVCT_BADGE_HOME_ID=${IVCT_HOME}/Badges
export IVCT_BADGE_ICONS=${IVCT_HOME}/Badges

export ACTIVEMQ_HOME=${IVCT_HOME}/apache-activemq-5.15.11
export ACTIVEMQ_CONF=${ ACTIVEMQ_HOME}/conf


export xt_opts="-bg lightblue -fg black -font 9x15" 

#echo "test activemq_home :" $ACTIVEMQ_HOME
#echo "test activemq_conf :" $ACTIVEMQ_CONF


###  start HelloWorld  direct 
#export SETTINGS_DESIGNATOR=localhost
#export FEDERATE_NAME=A
#export POPULATION_SIZE=100
#export CYCLES=1000000


# ------------------------------------------------------
# Voraussetzungen 
# ------------------------------------------------------

### pRTI check and start
pRTI_running=$(ps -ef | grep java | grep 'prti1516e/bin/pRTI1516e')
if [ -z "$pRTI_running" ] ; then
  /usr/local/bin/pRTI1516e &
fi


# ------------------------------------------------------
# Startaufrufe
# ------------------------------------------------------

pushd ${IVCT_HOME} > /dev/null

chmod 744 ${ACTIVEMQ_HOME}/bin/activemq
xterm ${xt_opts} -e "${ACTIVEMQ_HOME}/bin/activemq start; bash" &

echo -e "\n delay  5 Sec , for activemq to be stared \n"
sleep 5s


LogSinkVersion=LogSink-2.2.2-SNAPSHOT
chmod 744 ${LogSinkVersion}/bin/LogSink
echo -e "Starte ${LogSinkVersion}/bin/LogSink \n"
xterm ${xt_opts} -e " ${LogSinkVersion}/bin/LogSink; bash" &

# einige Tests haben nur andere Sprachdateien
#export LANG=en_US.UTF-8


TC_execVersion=TC.exec-2.2.2-SNAPSHOT
chmod 744  ${TC_execVersion}/bin/TC.exec
echo -e "Starte ${TC_execVersion}/bin/TC.exec \n"
xterm ${xt_opts}  -e "${TC_execVersion}/bin/TC.exec; bash" &


### Die UI  wird  evtl. ueber GUI gestartet
#UIVersion=UI-2.2.2-SNAPSHOT
#chmod 744  ${UIVersion}/bin/UI
#echo -e "Starte ${UIVersion}/bin/UI \n"
#xterm ${xt_opts} -e " ${UIVersion}/bin/UI;bash" &

HelloWorldVersion=HelloWorld-2.1.1
chmod 744 ${HelloWorldVersion}/bin/HelloWorld
echo -e "Starte ${HelloWorldVersion}/bin/HelloWorld \n"
xterm ${xt_opts} -e "${HelloWorldVersion}/bin/HelloWorld; bash" &

popd > /dev/null

#read -p" bis hier erstmal, weiter mit [Enter]"
#echo   -e "\n bin nun in $(pwd) "
