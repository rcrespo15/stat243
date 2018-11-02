srun -A ic_stat243 -p savio2  --nodes=5 -t 5:00:00 --pty bash
module load r r-packages
R CMD BATCH script.R
