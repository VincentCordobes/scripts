#!/bin/bash

cd ~/.weechat/xfer

result=*SearchBot_results_for*
# rm $result

weechat

unzip -p $result | nvim "+set bt=nofile" -

weechat

open .
