#!/bin/bash

ls filename

if [ $? -eq '0' ]
then
echo yes
else
echo no
fi