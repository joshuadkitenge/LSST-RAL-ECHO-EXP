#!/bin/bash


# This should already be set, but doesn't harm to make sure:
 export DYLD_LIBRARY_PATH=${LSST_LIBRARY_PATH}

# If developing your own gen3 obs_package, it helps to start with a clean
#DATA_REPO each time:
if [ -f GEN3_run/butler.yaml ]; then
    rm -rf GEN3_run
fi

# If DATA_REPO does not exist, create it and register your instrument.
if [ ! -f GEN3_run/butler.yaml ]; then
    butler create GEN3_run
    butler register-instrument GEN3_run/ lsst.obs.subaru.HyperSuprimeCam
fi

# Import the reference catalogues to the butler.
butler import GEN3_run/ ~/LSST-RAL-ECHO-EXP/lsst/DATA_gen3/ --export-file ~/LSST-RAL-ECHO-EXP/lsst/exports.yaml --skip-dimensions instrument,physical_filter,detector 



butler ingest-raws GEN3_run/ ~/LSST-RAL-ECHO-EXP/lsst/DATA_gen3/HSC/raw
butler define-visits GEN3_run/ HSC
butler write-curated-calibrations GEN3_run/ HSC

pipetask run  -b ~/LSST-RAL-ECHO-EXP/lsst/GEN3_run/ --input HSC/raw/all,refcats,HSC/calib --register-dataset-types -p ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#processCcd --instrument lsst.obs.subaru.HyperSuprimeCam  --output-run processCcdOutputs  -c isr:doBias=False -c isr:doBrighterFatter=False -c isr:doDark=False -c isr:doFlat=False -c isr:doDefect=False 

butler make-discrete-skymap GEN3_run/ HSC --collections processCcdOutputs

pipetask run  -b ~/LSST-RAL-ECHO-EXP/lsst/GEN3_run/ --input processCcdOutputs --input skymaps --input  HSC/raw/all,refcats,HSC/calib  --register-dataset-types -p ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#coaddition --instrument lsst.obs.subaru.HyperSuprimeCam  --output-run coadd -c makeWarp:doApplySkyCorr=False -c makeWarp:doApplyExternalSkyWcs=False -c makeWarp:doApplyExternalPhotoCalib=False

pipetask run  -b ~/LSST-RAL-ECHO-EXP/lsst/GEN3_run/ --input processCcdOutputs --input  HSC/raw/all,refcats,HSC/calib --input skymaps --input coadd --register-dataset-types --input  HSC/raw/all,refcats,HSC/calib  -p ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#multiband --instrument lsst.obs.subaru.HyperSuprimeCam --output-run multiband

#pipetask run  -b ~/LSST-RAL-ECHO-EXP/lsst/GEN3_run/ --input processCcdOutputs --input  HSC/raw/all,refcats,HSC/calib --input skymaps --input coadd --register-dataset-types --input  HSC/raw/all,refcats,HSC/calib  -p ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#detection --instrument lsst.obs.subaru.HyperSuprimeCam --output-run coaddPhot_dec

#pipetask run  -b ~/LSST-RAL-ECHO-EXP/lsst/GEN3_run/ --input processCcdOutputs  --input  HSC/raw/all,refcats,HSC/calib --input skymaps --input coadd --input coaddPhot_dec  --register-dataset-types -p ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#mergeDetections --instrument lsst.obs.subaru.HyperSuprimeCam --output-run coaddPhot_MD

#pipetask run  -b ~/LSST-RAL-ECHO-EXP/lsst/GEN3_run/ --input processCcdOutputs --input skymaps --input  HSC/raw/all,refcats,HSC/calib --input coadd --input coaddPhot_dec --input coaddPhot_MD  --register-dataset-types -p  ~/LSST-RAL-ECHO-EXP/lsst/DRP.yaml#deblend --instrument lsst.obs.subaru.HyperSuprimeCam --output-run coaddPhot_DB




