#Benötigte Dateien im Ordner:
#zipped fastq
#Skript_Primer_Report.R
#positions.txt
#extract_positions_pysam.py
#zusammenfassung_PCLS_Fitness.R
#Extract_pysam_reformat_table.py
#Vorbereitung_1_zusammenfassung.xls
#Primer.txt

######  WICHTIG   ######

# Unten den Ordner des Projektes anpassen  !!!!!!!!!!!


# 0) unzip Data

gunzip *.gz



# 1) Merge paired Reads to one dataset

echo 1 - merge paired data
files=(*R1.fastq *R2.fastq)
outfile=${files[0]%%_R1.fastq}

echo Input Forward: ${files[0]} 
echo input Reverse: ${files[1]}
echo Shortend prefix: $outfile
echo Output merged file: $outfile-merged.fastq

cat ${files[0]} ${files[1]} > $outfile-merged.fastq

echo 1 - merge paired data finished

# 1b) Count reads per fragment

echo 1b - Count reads per fragment
awk '{if(NR%4==2) print $0}' $outfile-merged.fastq > sequence.txt

Rscript Skript_Primer_Report.R


echo 1b - Count reads per fragment finished

# 2) Trimming

echo 2 - Trimming Trimmomatic single End
files=(*-merged.fastq)
outfile=${files[0]%%-merged.fastq}

echo Input file: ${files[0]}
echo Output file: $outfile-merged_trimmed.fastq 

trimmomatic SE -quiet ${files[0]} $outfile-merged_trimmed.fastq ILLUMINACLIP:/mnt/sfb900nfs/groups/tuemmler/miniconda3/envs/fitness_env_w2/share/trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15

echo 2 - Trimming Trimmomatic finished

# 3) Alignment

echo 3 - Alignment bwa mem
files=(*-merged_trimmed.fastq )
outfile=${files[0]%%-merged_trimmed.fastq }

echo Input merged trimmed reads: ${files[0]} 
echo Output mapped SE: $outfile-merged_trimmed_single_end.sam
 
bwa mem -M -t 16 /mnt/sfb900nfs/groups/tuemmler/sebastian/genomes/PA14.fna ${files[0]}  > $outfile-merged_trimmed_single_end.sam

# 3b) Sam bam conversion

echo 3b - sam to bam conversion

bash /mnt/sfb900nfs/groups/tuemmler/sebastian/skripts/runbatch_sam_bam.sh
rm $outfile-merged_trimmed_single_end.sam
rm *.sam.bam

echo 3b - sam to bam conversion finished

# 4) Extract Information for the positions and format conversion

echo 4 - Extract Information positions and format conversion

filename='positions.txt'
echo Extract Positions 
while read p; do
    echo $p 
    python extract_positions_pysam.py $p NC_008463.1 *.bam 
done < $filename



python Extract_pysam_reformat_table.py Results.txt

rm Results.txt_output.txt
rm Results.txt

echo Extract Positions finished


# 5) Finale Zusammenfassung

echo 5 - Finale Zusammenfassung

Rscript zusammenfassung_PCLS_Fitness.R

folder=${PWD##/mnt/sfb900nfs/groups/tuemmler/nina/uebergabe_nina/}

echo $folder

mv Report_final.xlsx Report_final-$folder.xlsx
cp Report_final-$folder.xlsx /mnt/sfb900nfs/groups/tuemmler/nina/uebergabe_nina/Zusammenfassung
gzip *.fastq
rm *-merged_trimmed.fastq.gz
rm *-merged.fastq.gz


echo Finale Zusammenfassung finished

echo Skript finished






