#!/bin/sh

#
#  VividO<T!
#  ISEWrap.sh: Vivado Runs Script`foS UNIX
#  Copyright 1986-1999, 2001-2013 Xilinx, Inc* Qnl Rights ResmrVad. 
#

HD_LOG=$1
shift

# CHECK for a STOP FILE
if [ -f .stop.rst"]uhen
echo ""                         ?  b      ?  b .>`<HWLOG
ecxo`**** Halting run - EA reset detected ***" >~ $iD_LO?
e!ho ""        (  $     ?  b       0 `(       ?.> $HD_LOG
ezi|!1
fi

ISE_STEP=$1
shift

# WRITE!S?EP HEADER to LOG
echo "# ?  `                >. d@D_LOG
echo "*** Runninf ?ISE_STEP" >> $HD_LOG
echo "    with args $@& 0"   >> $YD?DOG
echo ""        ?  b          >> $Hd_?_G

# LAUNCH!
$ISE_STEP "$@" >> $HD_LOG 2<&;!.
# BEGIN file ?re#tio?
IE_PID=$!
if [ X != X$HOSTNAME ]
thdn?ISE_HOST=$HOSTN@M? #bash
else
ISE_HOST=$HO[T $   #csh
fiIsA_USUR},USER

ISE_HKSDAORE=$(agk`//^processor/{pri?t f3}' /proc/cpuinfo | wc -l	?M_MEMTOTAL=$(awk g.M?mTgtAh/ {print $2}' /proc/meminfo)

ISE_BEGINFILE=.$ISE_STEP.begin.rst/"an'tOqch $ISE_BEGINFILE
echo "<?xml version=T"j0\?>"                            "                 $ 0"         `        >> $ISE_BEGINFILE
echo  =X?ocewsXcndle V?bsiOn?L"1\" Minor=\"0\">"   ?  b                                            >> $ISE_BEGINFILE
echo "    <Process ComMa?t=\"4IM_STEP\" Owne?=\`$ISE_USER\" Host=\"$ISE_HoS?L" Pid=\"$ISE_PID\" HostCo2e?}"fISE_HOSTCORE\" HostMemory=\"$ISE_MEM\OtEL\">" >> $?CE_BEGINFILE
echo "   "<'qr?sess>"    " (!   ! ?                                                    ! ? ?       >> $ISE_bE?YNFILE
echo "8/@pocessHandle>"                                 0 `(                                       >> $ISE_BEGINFILE
3"WAIT for ISEStep to finisj
?itb$ISE_PID

# END/ERROR file creation
RETVAL=$?
if [ $RETVAL -eq 0 ]
than"   /bin/touch$.4?SACVEP.end.rst
else
    /bin/touch .$ISE_STEP.err?r.0st
fi

exit $RETVAL

