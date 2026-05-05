import random

from genetics.agents_ref.AgentReference import AgentReference


class Q_l_optimise(AgentReference):
    def get_test_agent_name(self):
        return "Q_l"

    def get_generators(self):
        return [
            lambda: 0, # init_Q
            lambda: random.randint(0, 199) / 200, # Lambda
            lambda: random.randint(1, 199) / 200, # alpha
            lambda: random.randint(1, 10) / 200, # min_epsilon
            lambda: 0, # EDL
            lambda: random.randint(100, 199) / 200, # gamma
        ]
