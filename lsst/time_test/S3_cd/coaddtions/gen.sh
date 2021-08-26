pipetask run  -b s3://joshuakitenge_GEN3_run_time_test --input processCcdOutputs --input skymaps --input  HSC/raw/all,refcats,HSC/calib  --register-dataset-types -p ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#coaddition --instrument lsst.obs.subaru.HyperSuprimeCam -j 8  --output-run coadd -c makeWarp:doApplySkyCorr=False -c makeWarp:doApplyExternalSkyWcs=False -c makeWarp:doApplyExternalPhotoCalib=False 



