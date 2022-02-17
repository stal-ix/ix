import core.execute as ce
import core.manager as cm


class Ops:
    def __init__(self, cfg):
        self.cfg = cfg

    def execute_graph(self, graph):
        ce.execute(graph)

    def gc(self):
        cm.Manager(self.cfg).gc_cycle()
