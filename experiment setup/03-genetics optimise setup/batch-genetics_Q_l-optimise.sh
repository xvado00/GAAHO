#!/bin/bash
agentrefs=(
	Q_l_optimise
)
populations=(
	63
)
epochs=(
	22
)
strategies=(
	0 #roulette
	1 #rank
	2 #tournament
)
crossoverednrs=(
	21
)
mutateprobs=(
	0.25
)
threads=24

#for _run in {00..09}
for _run in {00..00}
do 
	for _popsize in ${populations[@]}
	do
		for _epoch in ${epochs[@]}
		do
			for _strategy in ${strategies[@]}
			do
				for _crossoverednr in ${crossoverednrs[@]}
				do
					for _mumateprob in ${mutateprobs[@]}
					do
						for _agentref in ${agentrefs[@]}
						do
						python ./genetics.py -a ${_agentref} -l log_gen/Q_l_allweknowsofar.csv \
							-p ${_popsize} -e ${_epoch} -r ${_strategy} -c ${_crossoverednr} -m ${_mumateprob} \
							-i 100000 -s 2000 -t $threads -n 1 --debug --log --log_el --log_agent_failures\
							&>> "runtime_${_agentref}-${_run}-${_popsize}-${_epoch}-${_strategy}-${_crossoverednr}-${_mumateprob}.log"
						done
					done
				done
			done
		done
	done
done
