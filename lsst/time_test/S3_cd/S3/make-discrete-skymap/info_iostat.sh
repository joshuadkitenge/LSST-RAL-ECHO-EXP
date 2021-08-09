#!/bin/sh

(timeout 7200 iostat 1) &> info_iostat.txt
