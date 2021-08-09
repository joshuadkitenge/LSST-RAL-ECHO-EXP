rclone delete remote:joshuakitenge_GEN3_run_time_test
s3cmd rb --recursive s3://joshuakitenge_GEN3_run_time_test
echo "Delete all contents in S3 bucket"

#rclone rmdir remote:joshuakitenge_GEN3_run_time_test

echo "Removed S3 bucket"

rm -rf ~/LSST-RAL-ECHO-EXP/lsst/test_S3_configs

echo "Deleted the config repo" 

rclone mkdir remote:joshuakitenge_GEN3_run_time_test

echo "Created the S3 bucket"

mkdir ~/LSST-RAL-ECHO-EXP/lsst/test_S3_configs 

echo "Created the config repo"

cp ~/LSST-RAL-ECHO-EXP/lsst/S3_config_hub/gen3.sqlite3 ~/lsst/test_S3_configs/gen3.sqlite3

echo "Copyed registry file"

cp ~/LSST-RAL-ECHO-EXP/lsst/S3_config_hub/reg.yaml ~/lsst/test_S3_configs/reg.yaml

echo "Copyed registry config"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/create/ ; source runner.sh)

echo "Done: butler create "

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/register-instrument/ ; source runner.sh)

echo "Done: butler register-instruments"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/import/ ; source runner.sh)

echo "Done: butler import"

( cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/ingest-raws/ ;  source runner.sh)

echo "Done: butler ingest-raws"

( cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/define-visit/ ; source runner.sh)

echo "Done: butler define-visits"

( cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/write-curated-calibrations/ ; source runner.sh  )

echo "Done: butler write-curated-calibrations"

( cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/processccd/ ; source runner.sh)

echo "Done: ProcessCcdOutputs (pipetask)"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/make-discrete-skymap/ ; source runner.sh)

echo "Done: butler make-discrete-skymap"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/coaddtions/ ; source runner.sh)

echo "Done: coaddtions (pipetask)"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/detections/ ; source runner.sh)

echo "Done: detections (pipetask)"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/mergedetections/ ; source runner.sh)

echo "Done: mergedetections (pipetask)"

(cd ~/LSST-RAL-ECHO-EXP/lsst/time_test/S3_cd/deblend/ ; source runner.sh)

echo "Done: deblend (pipetask)"
