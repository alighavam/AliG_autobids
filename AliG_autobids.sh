# I am using Khan's lab tar2bids to dcm->bids my mri data. On CBS server you need to make 
# a new tmpdir for the program's cache. 
# Ali Ghavampour - Last days of 2024.
# Email: alighavam79@gmail.com
# A good guide by Marco Emanuele: https://diedrichsenlab.github.io/guides/09_autobids.html

# Usage:
# 1. Copy this file to the directory where you have the .tar files. The .tar files should be made with cfmm2tar tool from Khan's lab. Check out Marco's guide.
# 2. Open a terminal in the directory where you have the .tar files.
# 3. Then ensure the file is exutable with chmod +x AliG_autobids.sh
# 4. Run the script with: ./AliG_autobids.sh --command <your tar2bids command>
#       for example:  ./AliG_autobids.sh --command "singularity run /srv/containers/tar2bids_v0.2.5.sif -h heuristic_file.py -o ./BIDS ./bluh_bluh_usually_long_file_name.tar"
#       A quick help on the tar2bids inputs: heuristic_file.py is something tar2bids use to figure out what to put where. You should be fine with the heuristic.py files provided
#       by Khan's lab on their repo: tar2bids. The -o flag is the output directory you wanna save the BIDS formatted data (I guess just use ./BIDS). 
#       The last argument is the .tar file you want to convert to BIDS (tar file should be made by cfmm2tar).

# Check if the command argument is provided:
if [[ "$1" == "--command" ]]; then
    # Check if a command is supplied after --command
    if [[ -n "$2" ]]; then
        echo "Executing the command: $2"

        # Save the old tmpdir:
        original_tmpdir=$TMPDIR

        # Make a new tmpdir to avoid cache issues:
        mkdir ./tmpdir
        new_tmpdir="./tmpdir"
        export TMPDIR=$new_tmpdir
        echo "New TMPDIR set to: $TMPDIR"

        # Execute the command provided as input
        eval "$2"
        
        # Revert the TMPDIR back to the original value:
        export TMPDIR=$original_tmpdir
    else
        echo "Error: No command provided after --command."
        exit 1
    fi
else
    echo "Usage: ./AliG_autobids.sh --command \"singularity run /srv/containers/tar2bids_v0.2.5.sif -h heuristic_file.py -o ./BIDS ./bluh_bluh_usually_long_file_name.tar\""
    exit 1
fi

