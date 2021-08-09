
if [ -f ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test/butler.yaml ]; then
    rm -rf ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test
fi

echo "Deleted DATA repo"

if [ ! -f ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test/butler.yaml ]; then
   
   (cd ~/lsst/time_test/cephfs/create/ ; source runner.sh) 
fi

echo "Done: butler create"

if [ -f ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test/butler.yamll ]; then
   (cd ~/lsst/time_test/cephfs_cd/register-instrument/ ; source runner.sh)
   
fi

echo "Done: butler register-instruments"

(cd ~/lsst/time_test/cephfs_cd/import/ ; source runner.sh)

echo "Done: butler import"

( cd ~/lsst/time_test/cephfs_cd/ingest-raws/ ;  source runner.sh)

echo "Done: butler ingest-raws"

( cd ~/lsst/time_test/cephfs_cd/define-visit/ ; source runner.sh)

echo "Done: butler define-visits"

( cd ~/lsst/time_test/cephfs_cd/write-curated-calibrations/ ; source runner.sh  )

echo "Done: butler write-curated-calibrations"

( cd ~/lsst/time_test/cephfs_cd/processccd/ ; source runner.sh)

echo "Done: ProcessCcdOutputs (pipetask)"

(cd ~/lsst/time_test/cephfs_cd/make-discrete-skymap/ ; source runner.sh)

echo "Done: butler make-discrete-skymap"

(cd ~/lsst/time_test/cephfs_cd/coaddtions/ ; source runner.sh)

echo "Done: coaddtions (pipetask)"

(cd ~/lsst/time_test/cephfs_cd/detections/ ; source runner.sh)

echo "Done: detections (pipetask)"

(cd ~/lsst/time_test/cephfs_cd/mergedetections/ ; source runner.sh)

echo "Done: mergedetections (pipetask)"

(cd ~/lsst/time_test/cephfs_cd/deblend/ ; source runner.sh)

echo "Done: deblend (pipetask)"