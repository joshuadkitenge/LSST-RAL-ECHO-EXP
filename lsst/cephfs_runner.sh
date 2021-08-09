#!/bin/sh

if [ -f ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test/butler.yaml ]; then
    rm -rf ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test
fi

echo "Deleted DATA repo"

if [ ! -f ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test/butler.yaml ]; then
   
   (cd ~/lsst/time_test/cephfs/create/ ; source runner.sh) 
fi

echo "Done: butler create"

if [ -f ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test/butler.yaml ]; then
   (cd ~/lsst/time_test/cephfs/register-instrument/ ; source runner.sh)
   
fi

echo "Done: butler register-instruments"

(cd ~/lsst/time_test/cephfs/import/ ; source runner.sh)

echo "Done: butler import"

( cd ~/lsst/time_test/cephfs/ingest-raws/ ;  source runner.sh)

echo "Done: butler ingest-raws"

( cd ~/lsst/time_test/cephfs/define-visit/ ; source runner.sh)

echo "Done: butler define-visits"

( cd ~/lsst/time_test/cephfs/write-curated-calibrations/ ; source runner.sh  )

echo "Done: butler write-curated-calibrations"

( cd ~/lsst/time_test/cephfs/processccd/ ; source runner.sh)

echo "Done: ProcessCcdOutputs (pipetask)"

(cd ~/lsst/time_test/cephfs/make-discrete-skymap/ ; source runner.sh)

echo "Done: butler make-discrete-skymap"

(cd ~/lsst/time_test/cephfs/coaddtions/ ; source runner.sh)

echo "Done: coaddtions (pipetask)"

(cd ~/lsst/time_test/cephfs/detections/ ; source runner.sh)

echo "Done: detections (pipetask)"

(cd ~/lsst/time_test/cephfs/mergedetections/ ; source runner.sh)

echo "Done: mergedetections (pipetask)"

(cd ~/lsst/time_test/cephfs/deblend/ ; source runner.sh)

echo "Done: deblend (pipetask)"
