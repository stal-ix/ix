import os
import platform

import core.utils as cu


def multi_update(f, *args):
    for x in args:
        f = cu.dict_dict_update(f, x)

    return f


def add_gnu(d):
    if 'gnu' not in d:
        d['gnu'] = {}

    g = d['gnu']

    if 'three' not in g:
        g['three'] = f'{d["gnu_arch"]}-{d["hw_vendor"]}-{d["os"]}'

    if 'four' not in g:
        g['four'] = f'{g["three"]}-{d["obj_fmt"]}'


def enrich(d):
    d = cu.copy_dict(d)

    if 'vendor' not in d:
        d['vendor'] = 'mix'

    if 'gnu_arch' not in d:
        if x := d.get('arch'):
            d['gnu_arch'] = {'arm64': 'aarch64'}.get(x, x)

    if 'arch' not in d:
        d['arch'] = d['gnu_arch']

    if 'bits' not in d:
        if '64' in d.get('arch', '') + d.get('gnu_arch', ''):
            d['bits'] = 64

    if 'llmv_target' not in d:
        d['llvm_target'] = {
            'aarch64': 'AArch64',
            'x86_64': 'X86',
        }[d['gnu_arch']]

    add_gnu(d)

    return d


def get_raw_arch(n):
    a = get_raw_arch
    du = multi_update

    if n == 'linux':
        return {
            'os': 'linux',
            'kernel': 'linux',
            'obj_fmt': 'elf',
        }

    if n == 'darwin':
        return {
            'os': 'darwin',
            'kernel': 'xnu',
            'vendor': 'apple',
            'hw_vendor': 'apple',
            'obj_fmt': 'mach-o',
        }

    if n == 'x86_64':
        return {'arch': 'x86_64'}

    if n == 'arm64':
        return {'arch': 'arm64'}

    if n == 'aarch':
        return {'gnu_arch': 'aarch64'}

    if n == 'darwin-arm64':
        return du(a('darwin'), a('arm64'))

    if n == 'linux-x86_64':
        return du(a('linux'), a('x86_64'), {'hw_vendor': 'pc'})


def arch(n):
    return enrich(get_raw_arch(n))


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
        host = arch(f'{platform.system().lower()}-{platform.machine()}')

        return {
            'host': host,
            'target': host,
        }
