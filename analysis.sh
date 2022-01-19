#1) Create folder for every sample
while read line; do mkdir -p "${line%/*}"; done < samples.txt

#2) Daten in den Ordner verschieben

filename='samples.txt'
while read line; do
    #echo $line 
    cp $line* $line/
done < $filename

#3) scripte in Ordner Verschieben

filename='samples.txt'
while read line; do
    #echo $line 
    cp  -r skripte/. $line/
done < $filename

#4) Start analysis

filename='samples.txt'
while read line; do
    #echo $line 
	cd  $line/
	sbatch run_fitness_SLURM.sh
	cd ../
done < $filename
