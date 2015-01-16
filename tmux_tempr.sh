#!/bin/bash

TEMPC=(21 63 105 147 189 231 224 217 210 203 196)
TEMP=$(sensors | grep '^Physical id 0:' | sed 's/^[^+-]*[+-]\([0-9]\+\)\.[0-9]°C.*$/\1/')
TEMPI=$(( (TEMP-28)/4 ))
TEMPI=$(( TEMPI<0?0:TEMPI ))
TEMPI=$(( TEMPI>10?10:TEMPI ))
echo -n '#[fg=colour'${TEMPC[$TEMPI]}']'$TEMP'°C#[fg=colour118]'
