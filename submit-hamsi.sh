#!/bin/bash
#SBATCH -M truba
#SBATCH -p hamsi
#SBATCH -A tbag78
#SBATCH -J testCrS2For3_3
#SBATCH -N 1
#SBATCH --ntasks=28
#SBATCH --time=0-01:00:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1
export OMPI_MCA_btl_openib_allow_ib=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

source /truba/sw/centos7.9/comp/intel/oneapi-2021.2/setvars.sh

module load centos7.9/lib/openmpi/4.1.1-intel-oneapi-2021.2
module load /truba/home/modarresi/to/VASP/intel
module load /truba/home/modarresi/to/VASP/openmpi
module load /truba/home/modarresi/to/VASP/bin/vasp_std
mpirun /truba/home/modarresi/to/VASP/bin/vasp_std /truba/home/modarresi/playground/test/to/SecondtestCrS2For3_3/POTCAR -s /truba/home/modarresi/playground/test/to/SecondtestCrS2For3_3/POSCAR -i /truba/home/modarresi/playground/test/to/SecondtestCrS2For3_3/INCAR -k /truba/home/modarresi/playground/test/to/SecondtestCrS2For3_3/KPOINTS -o /truba/home/modarresi/playground/test/to/SecondtestCrS2For3_3/output_test


exit

