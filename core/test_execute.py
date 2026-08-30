import asyncio
import os
import tempfile
import unittest
from unittest import mock

import core.error as ce
import core.execute as execute


class KeepGoingTests(unittest.TestCase):
    def test_exact_env_value(self):
        for value, want in (
            (None, False),
            ('', False),
            ('no', False),
            ('YES', False),
            ('yes', True),
        ):
            env = {} if value is None else {'IX_KEEP_GOING': value}

            with self.subTest(value=value), mock.patch.dict(os.environ, env, clear=True):
                self.assertEqual(execute.keep_going_enabled(), want)

    def test_independent_branch_continues_and_dependency_is_skipped(self):
        with tempfile.TemporaryDirectory() as root:
            bad = self.node(root, 'bad')
            child = self.node(root, 'child', [bad['out_dir'][0]])
            good = self.node(root, 'good')
            ran = []

            class FakeExecutor(execute.Executor):
                def __init__(self):
                    self.s = {'misc': asyncio.Semaphore(3)}
                    self.o = execute.group_by_out([bad, child, good])
                    self.l = []
                    self.keep_going = True

                def execute_node(self, node):
                    name = os.path.basename(node['out_dir'][0])
                    ran.append(name)

                    if name == 'bad':
                        raise ce.Error('bad failed')

            async def run():
                executor = FakeExecutor()

                with self.assertRaisesRegex(ce.Error, 'one or more nodes failed'):
                    await executor.visit_all([
                        child['out_dir'][0] + '/touch',
                        good['out_dir'][0] + '/touch',
                    ])

            asyncio.run(run())

            self.assertIn('bad', ran)
            self.assertIn('good', ran)
            self.assertNotIn('child', ran)

    @staticmethod
    def node(root, name, inputs=()):
        return {
            'in_dir': list(inputs),
            'out_dir': [os.path.join(root, name)],
            'cmd': [],
            'pool': 'misc',
            'tmp': '',
        }


if __name__ == '__main__':
    unittest.main()
