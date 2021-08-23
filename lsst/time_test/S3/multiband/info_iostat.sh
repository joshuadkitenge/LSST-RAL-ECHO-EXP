#!/bin/sh

(timeout 50000 iostat 1) &> info_iostat.txt
