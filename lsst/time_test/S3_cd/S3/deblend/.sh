#!/bin/sh

(for i in {1..1000}
do
  iostat 1
done) &> info_iostat.txt
