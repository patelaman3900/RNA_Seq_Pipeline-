################################### This script is for SRA toolkit use ###################################

#----------------------------------------------------------------
#To install & create env
conda create -n sratoolkit -c bioconda -c conda-forge sra-tools
#Activate env
conda activate sratoolkit
#Confirm Installation
fastq-dump --version
#----------------------------------------------------------------

######STEP: 1 Downloading the SRA files
#Best & Fastest
prefetch SRR062634
    #To custom directory
prefetch SRR062634 --output-directory /path/to/save/
    #Download multiple SRR IDs from a text file
    #Create a .txt file:
SRR062634
SRR19681164
SRR038620
prefetch --option-file srr_list.txt
    #Using wget function (Replcae SRRXXX with SRA id)
wget -c "https://www.ebi.ac.uk/ena/portal/api/filereport?accession=SRRXXXXXXX&result=read_run&fields=fastq_ftp"
    #FASTQ file download 
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR062/SRR062634/SRR062634_1.fastq.gz
wget -c ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR062/SRR062634/SRR062634_2.fastq.gz


#Direct download (old,slower)
   #Single end FASTQ
fastq-dump SRR062634
   #Paired-end FASTQ
fastq-dump --split-files SRR062634
   #Save output to folder
fastq-dump --outdir ./fastq --split-files SRR062634



######STEP: 2 FASTQ extraction if downloaded indirectly(fastest)
    #convert .lite to .sra 
mv file_name.lite filename.sra
    #convert .sra to FASTQ
fasterq-dump SRR062634
    #Output paired FASTQ files
fasterq-dump -O ./fastq SRR062634
    #Increase speed (use multiple threads)
fasterq-dump -e 8 -p SRR062634
#Paired-end file
fasterq-dump SRR19681164.sra --split-files -O ./fastq
    #Avoid temporary disk issues
fasterq-dump --temp /mnt/d/tmp -O ./fastq SRR062634





