#!/bin/bash

datePrint(){
    echo -e $@\\t $(eval $@)
}

datePrint "date"
datePrint "date \"+%Y\""
datePrint "date \"+%m\""
datePrint "date \"+%d\""
datePrint "date \"+%Y_%m_%d\""
datePrint "date \"+%H:%M:%S\""
datePrint "date \"+%H:%M:%S.%N\""