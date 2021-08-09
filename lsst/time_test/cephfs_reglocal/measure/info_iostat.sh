#!/bin/sh

(timeout 18000 iostat 1) &> info_iostat.txt
