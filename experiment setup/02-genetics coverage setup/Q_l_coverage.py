import random

from genetics.agents_ref.AgentReference import AgentReference


class Q_l_coverage(AgentReference):
    def get_test_agent_name(self):
        return "Q_l"

    def get_generators(self):
        return [
            lambda: 0, # init_Q
            lambda: random.choice([0.0,0.1,0.3,0.5,0.7,0.9,0.95,0.99,0.995]), # Lambda
            lambda: random.choice([0.3,0.5,0.7]), # alpha
            lambda: random.choice([0.005,0.01,0.02,0.03,0.04]), # min_epsilon
            lambda: 0, # EDL
            lambda: random.choice([0.6,0.7,0.8,0.9,0.95,0.99,0.995]), # gamma
        ]
