#(cd ~/lsst_stack/time_test/create/ && source runner.sh) && ( cd ~/lsst_stack/time_test/register-instrument/ && source runner.sh) &&  (cd ~/lsst_stack/time_test/import/ && source runner.sh) &

# ( cd ~/lsst_stack/time_test/ingest-raws/ ;  source runner.sh) && ( cd ~/lsst_stack/time_test/define-visit/ ; source runner.sh) && ( cd ~/lsst_stack/time_test/write-curated-calibrations/ ; source runner.sh  ) && ( cd ~/lsst_stack/time_test/processccd/ ; source runner.sh) && (cd ~/lsst_stack/time_test/make-discrete-skymap/ ; source runner.sh) &&  (cd ~/lsst_stack/time_test/coaddtions/ ; source runner.sh) && ( cd ~/lsst_stack/time_test/detections/ ; source runner.sh) && ( cd ~/lsst_stack/time_test/mergedetections/ ; source runner.sh) && ( cd ~/lsst_stack/time_test/deblend/ ; source runner.sh) &

#!/bin/sh

if [ -f ~/lsst/GEN3_run_time_test/butler.yaml ]; then
    rm -rf GEN3_run_time_test
fi

echo "Deleted DATA repo"

if [ ! -f ~/lsst/GEN3_run_time_test/butler.yaml ]; then
   #cd ~/lsst/time_test/create/ --options; source runner.sh --options; cd ~/lsst_stack/time_test/register-instrument/ --options;source runner.sh  --options
   (cd ~/lsst/time_test/Local/create/ ; source runner.sh) 
fi

echo "Done: butler create"

if [ -f ~/lsst/GEN3_run_time_test/butler.yaml ]; then
   (cd ~/lsst/time_test/Local/register-instrument/ ; source runner.sh)
fi

echo "Done: butler register-instruments"

(cd ~/lsst/time_test/Local_cd/import/ ; source runner.sh)

echo "Done: butler import"

( cd ~/lsst/time_test/Local_cd/ingest-raws/ ;  source runner.sh)

echo "Done: butler ingest-raws"

( cd ~/lsst/time_test/Local_cd/define-visit/ ; source runner.sh)

echo "Done: butler define-visits"

( cd ~/lsst/time_test/Local_cd/write-curated-calibrations/ ; source runner.sh  )

echo "Done: butler write-curated-calibrations"

( cd ~/lsst/time_test/Local_cd/processccd/ ; source runner.sh)

echo "Done: ProcessCcdOutputs (pipetask)"

(cd ~/lsst/time_test/Local_cd/make-discrete-skymap/ ; source runner.sh)

echo "Done: butler make-discrete-skymap"

(cd ~/lsst/time_test/Local_cd/coaddtions/ ; source runner.sh)

echo "Done: coaddtions (pipetask)"

(cd ~/lsst/time_test/Local_cd/detections/ ; source runner.sh)

echo "Done: detection (pipetask)"

(cd ~/lsst/time_test/Local_cd/mergedetections/ ; source runner.sh)

echo "Done: mergedetections (pipetask)"

(cd ~/lsst/time_test/Local_cd/deblend/ ; source runner.sh)

echo "Done: deblend (pipetask)"
