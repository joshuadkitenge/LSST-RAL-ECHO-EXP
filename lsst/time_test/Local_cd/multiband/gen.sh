pipetask run  -b ~/LSST-RAL-ECHO-EXP/lsst/GEN3_run_time_test  --input processCcdOutputs --input skymaps --input  HSC/raw/all,refcats,HSC/calib --input coadd  --register-dataset-types -p ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#multiband --instrument lsst.obs.subaru.HyperSuprimeCam -j 8  --output-run Multiband
