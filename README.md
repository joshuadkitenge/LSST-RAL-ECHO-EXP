# Processing survey images and testing the overall time using various endpoint storages
## Configuration
- **This benchmarking code must be cloned into your homespace**
- **This has now been updated to use mulitprocessing, to edit how many processes you have to change "-j 8" in the gen.sh scripts for all of pipetask operations (multiband, processccd and coaddtions)** 
- **Step 1 :** Setting up the latest lsst environment <br><br>
  - Installing the newinstall.sh and eups distrib <br><br>
     - The eups distirb is updated weekly and the newinstall scripts is update less frequently but if you notice that eups install doesn't fully excuted you'll need to redownload the latest version of the newinstall
     - Make an installation directory: <br>
       -  run: *mkdir -p lsst_stack*<br>
       -  run: *cd lsst_stack*<br><br>
     - Run newinstall.sh<br><br>
       - Make sure you get the latest tag (https://github.com/lsst/lsst/tags)<br>
       - run: *curl -OL https://raw.githubusercontent.com/lsst/lsst/w.2021.34/scripts/newinstall.sh*<br>
       - run: *unset LSST_HOME EUPS_PATH LSST_DEVEL EUPS_PKGROOT REPOSITORY_PATH*<br>
       - run: *bash newinstall.sh -ct*<br><br>
       - We recommend that you opt into the provided Miniconda Python environment (see https://pipelines.lsst.io/v/weekly/install/newinstall.html). Then load the LSST software environment into your shell:<br><br>
         - run: *source loadLSST.bash* # for bash <br>
         - run: *source loadLSST.csh* # for csh <br>
         - run: *source loadLSST.ksh* # for ksh <br>
         - run: *source loadLSST.zsh* # for zsh <br><br>
     - Install Science Pipelines packages<br><br>
         - The LSST Science Pipelines is distributed as the lsst_distrib EUPS package. Install the current version, w_latest:<br><br>
           - run: *eups distrib install -t w_latest lsst_distrib*<br>   
           - run: *curl -sSL https://raw.githubusercontent.com/lsst/shebangtron/master/shebangtron | python*<br>
           - run: *setup lsst_distrib*<br>
           - run: *setup lsst_apps*<br><br>
- **Step 2 :** Changing the configuration of obs_subaru and meas_base package <br><br>
  - Bright object mask error solution <br><br>
    - path to repo (Note: this is a guide to the path, your path is likely to be a tiny bit different (different numbers))cd ~/lsst_stack/stack/miniconda3-py38_4.9.2-0.6.0/Linux64/obs_subaru/22.0.1-20-g904645ea+7c6b33a4e9/config/ <br>
    - Within this repository there is the "measureCoaddSources.py" and "forcedPhotCoadd.py" <br>
    - Comment out these lines in both of the scripts above:<br><br>
      - config.measurement.plugins['base_PixelFlags'].masksFpCenter.append('BRIGHT_OBJECT')<br>
      - config.measurement.plugins['base_PixelFlags'].masksFpAnywhere.append('BRIGHT_OBJECT')<br><br>
  - Fixing the id factory "large exporsure ID "<br><br>
    - path to repo  (Note: this is a guide to the path, your path is likely to be a tiny bit different (different numbers)) cd lsst_stack/stack/miniconda3-py38_4.9.2-0.6.0/Linux64/meas_base/22.0.1-10-gba590ab+1f0801fda2/python/lsst/meas/base/ <br>
    - comment out this line: <br>
      - idFactory = lsst.afw.table.IdFactory.makeSource(expId, 64 - expBits) <br><br> 
    - Copy the import in the import section and the rest in the generateMeasCat <br>
    -   from lsst.obs.base import ExposureIdInfo <br>  
        exposureIdInfo = ExposureIdInfo.fromDataId(exposureDataId, "tract_patch_band")<br>
        idFactory = exposureIdInfo.makeSourceIdFactory()<br><br>
- **Step 3 :** Installing all of the profiling tools<br><br>
  - iostat: (disk profiling) <br>
    - run: *yum -y install sysstat*<br><br>
  - IFDATA: (network profiling)<br>
    - run: *sudo yum install moreutils* <br><br>
- **Step 4 :** installing and configurating the s3 tools <br><br>
  - Rclone <br><br>
    - Installation:<br>
      - run: *curl https://rclone.org/install.sh | sudo bash* <br>
    - Configuration:<br>
      - run: rclone config <br>
        - Type of storage to configure = "s3" <br>
          Choose your S3 provider = "Ceph"<br>
          AWS Access Key ID = "access_key"<br>
          AWS Secret Access Key ="secret_access_key"<br>
          Endpoint for S3 API ="s3.echo.stfc.ac.uk"<br>
          All of the other configs settings can be set to default<br><br>
  - S3cmd<br><br>
    - Installation:<br>
      - run: *yum install s3cmd*<br>
    - Configuration:<br>
      - s3cmd's default configuration files is located at ~/.s3cfg. To set up s3cmd to use Echo replace the contents of the file with:<br>
        -  [default] <br>
           access_key = <br>
           secret_key =<br>
           host_base = s3.echo.stfc.ac.uk<br>
           host_bucket = s3.echo.stfc.ac.uk/%(bucket)<br>
        - Filling the access key and secret key fields with your Echo S3 credentials. Ensure this file is only readable by your user if you are on a shared system.<br><br>
- **Step 5 :** CephFS configuration <br><br>
  - Mount your CephFS instance in your home space (e.g. ~/cephfs_lsst) <br>
  - make sure you call it "cephfs_lsst"<br><br>
## Downloading the raw HSC Data
- **you have to been in the lSST conda environment to do this step (look at the beginning of running the test)**
- **Step 1:** run: *git lfs install* (in the sourced conda environment )<br><br>
- **Step 2:** Downloading the sample data<br><br>
  - *cd ~/LSST-RAL-ECHO-EXP/lsst*<br>
  - *git clone https://github.com/lsst/testdata_ci_hsc*<br><br>

- **Step 3:** Moving the data so it works with the testing<br><br>
  - run: setup lsst_distrib
  - run: setup lsst_apps
  - run: *butler ingest-raws ~/LSST-RAL-ECHO-EXP/lsst/DATA_gen3 ~/LSST-RAL-ECHO-EXP/lsst/testdata_ci_hsc/raw* <br><br>
  
# Running the test
- Before running the test you have source the lsst environment<br><br>
  - run: *cd ~/lsst_stack*<br>
  - run: *source loadLSST.bash* <br>
  - run: *setup lsst_distrib*<br>
  - run: *setup lsst_apps*<br>
  - run: *export S3_ENDPOINT_URL=**S3_endpoint*** (only needed if you are going to test S3 storage) <br><br>
  
- To run all of them:<br><br>
  - *cd ~/LSST-RAL-ECHO-EXP/lsst/pipeline_runners* <br> 
  - run: *source all_runner.sh*<br><br>
- To run one of them source the approperiate script in the pipeline_runner <br><br>
  - run: *source <>_runner.sh*<br><br>

# Analysing the data 
- Before running the test you have source the lsst environment<br>
- The data can be found in the time_test directory under its respective endpoint storages and command line tasks/ pipetasks <br>
- The notebook directory has examples of how I analysed the data, feel free to use this or create your own anaylsis code <br><br>  
  


     


