rm -rf ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test

echo "Deleted butler repo"

rm -rf ~/LSST-RAL-ECHO-EXP/lsst/test_S3_configs

echo "Deleted the config repo" 

mkdir ~/LSST-RAL-ECHO-EXP/lsst/test_S3_configs 

echo "Created the config repo"

cp ~/LSST-RAL-ECHO-EXP/lsst/S3_config_hub/gen3.sqlite3 ~/lsst/test_S3_configs/gen3.sqlite3

echo "Copyed registry file"

cp ~/LSST-RAL-ECHO-EXP/lsst/S3_config_hub/reg.yaml ~/lsst/test_S3_configs/reg.yaml

echo "Copyed registry config"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/create/ ; source runner.sh)

echo "Done: butler create "

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/register-instrument/ ; source runner.sh)

echo "Done: butler register-instruments"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/import/ ; source runner.sh)

echo "Done: butler import"

( cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/ingest-raws/ ;  source runner.sh)

echo "Done: butler ingest-raws"

( cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/define-visit/ ; source runner.sh)

echo "Done: butler define-visits"

( cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/write-curated-calibrations/ ; source runner.sh  )

echo "Done: butler write-curated-calibrations"

( cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/processccd/ ; source runner.sh)

echo "Done: ProcessCcdOutputs (pipetask)"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/make-discrete-skymap/ ; source runner.sh)

echo "Done: butler make-discrete-skymap"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/coaddtions/ ; source runner.sh)

echo "Done: coaddtions (pipetask)"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/detections/ ; source runner.sh)

echo "Done: detections (pipetask)"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/mergedetections/ ; source runner.sh)

echo "Done: mergedetections (pipetask)"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/cephfs_reglocal/deblend/ ; source runner.sh)

echo "Done: deblend (pipetask)"
