# AliG_autobids
 my autboids shell script to use on CBS VDI. It just uses Khan's lab scripts but probably fixes a couple of probelms related to CBS server cache. You could just use Khan's lab tar2bids if you don't have those problems. Refer to this guide: https://diedrichsenlab.github.io/guides/09_autobids.html  

# Usage:
# 1. Copy this file to the directory where you have the .tar files. The .tar files should be made with cfmm2tar tool from Khan's lab. Check out Marco's guide.
# 2. Open a terminal in the directory where you have the .tar files.
# 3. Then ensure the file is exutable with chmod +x AliG_autobids.sh
# 4. Run the script with: ./AliG_autobids.sh --command <your tar2bids command>
#       for example:  ./AliG_autobids.sh --command "singularity run /srv/containers/tar2bids_v0.2.5.sif -h heuristic_file.py -o ./BIDS ./bluh_bluh_usually_long_file_name.tar"
#       A quick help on the tar2bids inputs: heuristic_file.py is something tar2bids use to figure out what to put where. You should be fine with the heuristic.py files provided
#       by Khan's lab on their repo: tar2bids. The -o flag is the output directory you wanna save the BIDS formatted data (I guess just use ./BIDS). 
#       The last argument is the .tar file you want to convert to BIDS (tar file should be made by cfmm2tar).
