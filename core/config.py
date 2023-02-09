import os
import platform

import core.ops as co
import core.utils as cu


def multi_update(f, *args):
    for x in args:
        f = cu.dict_dict_update(f, x)

    return f


def calc_id(d):
    return cu.struct_hash(d)


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
        d['vendor'] = 'ix'

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
            'riscv64': 'TODO',
        }[d['gnu_arch']]

    if 'linux_arch' not in d:
        d['linux_arch'] = {
            'aarch64': 'arm64',
            'riscv64': 'riscv',
        }.get(d['gnu_arch'], d['gnu_arch'])

    if 'go_arch' not in d:
        d['go_arch'] = {
            'aarch64': 'arm64',
            'x86_64': 'amd64',
        }.get(d['gnu_arch'], d['gnu_arch'])

    if 'endian' not in d:
        d['endian'] = 'little'

    add_gnu(d)

    if 'id' not in d:
        d['id'] = calc_id(d)

    d['ptrlen'] = int(d['bits']) // 8

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
        return {'gnu_arch': 'x86_64', 'family': 'x86'}

    if n == 'arm64':
        return du(a('aarch64'), {'arch': 'arm64'})

    if n == 'aarch64':
        return {'gnu_arch': 'aarch64', 'family': 'arm'}

    if n == 'riscv64':
        return {'gnu_arch': 'riscv64', 'family': 'riscv'}

    if n == 'darwin-arm64':
        return du(a('darwin'), a('arm64'))

    if n == 'darwin-x86_64':
        return du(a('darwin'), a('x86_64'))

    if n == 'linux-x86_64':
        return du(a('linux'), a('x86_64'), {'hw_vendor': 'pc'})

    if n == 'linux-aarch64':
        return du(a('linux'), a('aarch64'), {'hw_vendor': 'pc'})

    if n == 'linux-riscv64':
        return du(a('linux'), a('riscv64'), {'hw_vendor': 'unknown'})

    raise Exception(f'unknown arch {n}')


def arch(n):
    return enrich(get_raw_arch(n))


class Config:
    def __init__(self, binary, where, root, verbose):
        self.binary = binary
        self.where = where
        self.ix_dir = root
        self.verbose = verbose
        # circular ref
        self.ops = co.construct(self)

    @property
    def store_dir(self):
        return os.path.join(self.ix_dir, 'store')

    @property
    def trash_dir(self):
        return os.path.join(self.ix_dir, 'trash')

    def ensure_trash_dir(self):
        res = self.trash_dir

        try:
            os.makedirs(res)
        except OSError:
            pass

        return res

    @property
    def realm_dir(self):
        return os.path.join(self.ix_dir, 'realm')

    @property
    def build_dir(self):
        return os.path.join(self.ix_dir, 'build')

    @property
    @cu.cached_method
    def host(self):
        return arch(f'{platform.system().lower()}-{platform.machine()}')

    def retarget(self, target):
        try:
            target[0]
            return arch(target)
        except KeyError:
            return target


def config_from(ctx):
    binary = ctx['binary']
    where = os.path.join(os.path.dirname(binary), 'pkgs')
    root = os.environ.get('IX_ROOT', '/ix')

    return Config(binary, where, root, os.environ.get('IX_VERBOSE', ''))
