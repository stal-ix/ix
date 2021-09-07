import os
import platform

import core.utils as cu


class Config:
    def __init__(self, binary, where):
        self.binary = binary
        self.where = where
        self.mix_dir = os.path.expanduser('~/mix')

    @property
    def store_dir(self):
        return os.path.join(self.mix_dir, 'store')

    @property
    def realm_dir(self):
        return os.path.join(self.mix_dir, 'realm')

    @property
    def build_dir(self):
        return os.path.join(self.mix_dir, 'build')

    @property
    @cu.cached_method
    def platform(self):
        return {
            'target': {
                'arch': platform.machine(),
                'gnu_arch': 'aarch64',
                'os': 'darwin',
                'vendor': 'apple',
                'bits': '64',
            },
        }
