pipetask run  -b ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test --input processCcdOutputs  --input  HSC/raw/all,refcats,HSC/calib --input skymaps --input coadd --input coaddPhot_dec  --register-dataset-types -p ~/lsst/DRP.yaml:mergeDetections --instrument lsst.obs.subaru.HyperSuprimeCam --output-run coaddPhot_MD
