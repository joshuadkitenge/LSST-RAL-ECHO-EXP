pipetask run  -b ~/cephfs_lsst/joshua-kitenge/GEN3_run_time_test --input HSC/raw/all,refcats,HSC/calib --register-dataset-types -p ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#processCcd --instrument lsst.obs.subaru.HyperSuprimeCam -j 8  --output-run processCcdOutputs -c isr:doBias=False -c isr:doBrighterFatter=False -c isr:doDark=False -c isr:doFlat=False -c isr:doDefect=False 

