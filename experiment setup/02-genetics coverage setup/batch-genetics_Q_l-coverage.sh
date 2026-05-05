#!/bin/bash
agentrefs=(
	Q_l_coverage
)
refmachines=(
	BF,5
)
populations=(
	63
)
epochs=(
	22
)
#This searches:
# 1*63+(22-1)*(63-21)
# = 945 randomly generated configs
# can generate a config multiple times
strategies=(
	0 #roulette
	1 #rank
	2 #tournament
)
selectednrs=(
	21
)
mutateprobs=(
	0.25
)
threads=16

for _run in {00..32}
do 
	for _popsize in ${populations[@]}
	do
		for _epoch in ${epochs[@]}
		do
			for _strategy in ${strategies[@]}
			do
				for _selectednr in ${selectednrs[@]}
				do
					for _mumateprob in ${mutateprobs[@]}
					do
						for _agentref in ${agentrefs[@]}
						do
							for _refmach in ${refmachines[@]}
							do
							python ./genetics.py -a ${_agentref} -u ${_refmach} -l log-gen/Q_l_sweep.csv \
								-p ${_popsize} -e ${_epoch} -r ${_strategy} -c ${_selectednr} -m ${_mumateprob} \
								-i 100000 -s 2000 -t $threads -n 1 --debug --log --log_el \
								&>> "runtime_${_agentref}-${_refmach}-${_run}-${_popsize}-${_epoch}-${_strategy}-${_selectednr}-${_mumateprob}.log"
							done
						done
					done
				done
			done
		done
	done
done
