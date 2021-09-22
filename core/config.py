import os
import platform

import core.utils as cu


ARCHES = {
    'darwin-arm64': {
        'arch': 'arm64',
        'gnu_arch': 'aarch64',
        'os': 'darwin',
        'vendor': 'apple',
        'bits': '64',
    },
    'linux-x86_64': {
        'arch': 'x86_64',
        'gnu_arch': 'x86_64',
        'os': 'linux',
        'vendor': 'linus',
        'bits': '64',
    },
}


class Config:
    def __init__(self, binary, where):
        self.binary = binary
        self.where = where
        self.mix_dir = os.path.expanduser('~/mix').replace('/mix/mix', '/mix')

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
            'target': ARCHES[platform.system().lower() + '-' + platform.machine()],
        }
