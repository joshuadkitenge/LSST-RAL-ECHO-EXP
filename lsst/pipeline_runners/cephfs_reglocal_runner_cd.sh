rm -rf ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test

echo "Deleted butler repo"

rm -rf ~/lsst/test_S3_configs

echo "Deleted the config repo" 

mkdir ~/lsst/test_S3_configs 

echo "Created the config repo"

cp ~/lsst/S3_config_hub/gen3.sqlite3 ~/lsst/test_S3_configs/gen3.sqlite3

echo "Copyed registry file"

cp ~/lsst/S3_config_hub/reg.yaml ~/lsst/test_S3_configs/reg.yaml

echo "Copyed registry config"

(cd ~/lsst/time_test/cephfs_reglocal_cd/create/ ; source runner.sh)

echo "Done: butler create "

(cd ~/lsst/time_test/cephfs_reglocal_cd/register-instrument/ ; source runner.sh)

echo "Done: butler register-instruments"

(cd ~/lsst/time_test/cephfs_reglocal_cd/import/ ; source runner.sh)

echo "Done: butler import"

( cd ~/lsst/time_test/cephfs_reglocal_cd/ingest-raws/ ;  source runner.sh)

echo "Done: butler ingest-raws"

( cd ~/lsst/time_test/cephfs_reglocal_cd/define-visit/ ; source runner.sh)

echo "Done: butler define-visits"

( cd ~/lsst/time_test/cephfs_reglocal_cd/write-curated-calibrations/ ; source runner.sh  )

echo "Done: butler write-curated-calibrations"

( cd ~/lsst/time_test/cephfs_reglocal_cd/processccd/ ; source runner.sh)

echo "Done: ProcessCcdOutputs (pipetask)"

(cd ~/lsst/time_test/cephfs_reglocal_cd/make-discrete-skymap/ ; source runner.sh)

echo "Done: butler make-discrete-skymap"

(cd ~/lsst/time_test/cephfs_reglocal_cd/coaddtions/ ; source runner.sh)

echo "Done: coaddtions (pipetask)"

(cd ~/lsst/time_test/cephfs_reglocal_cd/detections/ ; source runner.sh)

echo "Done: detections (pipetask)"

(cd ~/lsst/time_test/cephfs_reglocal_cd/mergedetections/ ; source runner.sh)

echo "Done: mergedetections (pipetask)"

(cd ~/lsst/time_test/cephfs_reglocal_cd/deblend/ ; source runner.sh)

echo "Done: deblend (pipetask)"
