pipetask run  -b s3://joshuakitenge_GEN3_run_time_test --input processCcdOutputs --input skymaps --input coadd --input coaddPhot_dec --input coaddPhot_MD  --register-dataset-types -p  ~/lsst/DRP.yaml#deblend --instrument lsst.obs.subaru.HyperSuprimeCam --output-run coaddPhot_DB
