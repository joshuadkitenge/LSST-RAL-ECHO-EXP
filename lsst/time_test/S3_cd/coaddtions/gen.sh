pipetask run  -b s3://joshuakitenge_GEN3_run_time_test --input processCcdOutputs --input skymaps --input  HSC/raw/all,refcats,HSC/calib  --register-dataset-types -p ~/lsst/DRP.yaml#coaddition --instrument lsst.obs.subaru.HyperSuprimeCam --output-run coadd -c makeWarp:doApplySkyCorr=False -c makeWarp:doApplyExternalSkyWcs=False -c makeWarp:doApplyExternalPhotoCalib=False 

