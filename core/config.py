import os
import platform

import core.ops as co
import core.utils as cu
import core.error as ce


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
        g['three'] = f'{d["gnu_arch"]}-{d["gnu_vendor"]}-{d["os"]}'

    if 'four' not in g:
        g['four'] = f'{g["three"]}-{d["obj_fmt"]}'


def enrich(d):
    d = cu.copy_dict(d)

    if 'vendor' not in d:
        d['vendor'] = 'unknown'

    if 'gnu_vendor' not in d:
        d['gnu_vendor'] = d['vendor']

    if 'rust_vendor' not in d:
        d['rust_vendor'] = d['gnu_vendor']

    if 'gnu_arch' not in d:
        if x := d.get('arch'):
            d['gnu_arch'] = {'arm64': 'aarch64'}.get(x, x)

    if 'arch' not in d:
        d['arch'] = d['gnu_arch']

    if 'bits' not in d:
        kk = d.get('arch', '') + d.get('gnu_arch', '')

        if '64' in kk:
            d['bits'] = 64

        if '32' in kk:
            d['bits'] = 32

    if 'llmv_target' not in d:
        d['llvm_target'] = {
            'aarch64': 'AArch64',
            'x86_64': 'X86',
            'armv7': 'TODO',
            'riscv64': 'TODO',
            'wasm32': 'TODO',
            'wasm64': 'TODO',
        }[d['gnu_arch']]

    if 'linux_arch' not in d:
        d['linux_arch'] = {
            'aarch64': 'arm64',
            'riscv64': 'riscv',
            'armv7': 'arm',
        }.get(d['gnu_arch'], d['gnu_arch'])

    if 'go_arch' not in d:
        d['go_arch'] = {
            'aarch64': 'arm64',
            'x86_64': 'amd64',
        }.get(d['gnu_arch'], d['gnu_arch'])

    if 'endian' not in d:
        d['endian'] = 'little'

    if 'dl_suffix' not in d:
        if d.get('obj_fmt', '') == 'elf':
            d['dl_suffix'] = 'so'

    if 'clang_os' not in d:
        d['clang_os'] = d['os']

    add_gnu(d)

    if 'uname_m' not in d:
        d['uname_m'] = d['arch']

    if 'uname_s' not in d:
        d['uname_s'] = d['cmake_system_name']

    d['ptrlen'] = int(d['bits']) // 8

    if 'exe_suffix' not in d:
        d['exe_suffix'] = ''

    if 'id' not in d:
        d['id'] = calc_id(d)

    if 'rust_os' not in d:
        d['rust_os'] = d['os']

    if 'rust' not in d:
        if d['os'] == 'mingw32':
            d['rust'] = f'{d["gnu_arch"]}-pc-windows-gnullvm'
        else:
            d['rust'] = f'{d["gnu_arch"]}-{d["rust_vendor"]}-{d["rust_os"]}'

    return d


def get_raw_arch(n):
    a = get_raw_arch
    du = multi_update

    if '-' in n:
        return du(*[a(x) for x in n.split('-')])

    if n == 'wasi':
        return {
            'os': 'wasi',
            'kernel': 'wasi',
            'obj_fmt': 'wasm',
            'cmake_system_name': 'WASI', # wild guess
        }

    if n == 'linux':
        return {
            'os': 'linux',
            'kernel': 'linux',
            'obj_fmt': 'elf',
            'cmake_system_name': 'Linux',
            'rust_os': 'linux-musl',
        }

    if n == 'darwin':
        return {
            'clang_os': 'darwin11',
            'os': 'darwin',
            'kernel': 'xnu',
            'vendor': 'apple',
            'obj_fmt': 'mach-o',
            'cmake_system_name': 'Darwin',
            'dl_suffix': 'dylib',
            'symbol_prefix': '_',
        }

    if n == 'mingw_w64':
        return {
            'os': 'mingw32',
            'kernel': 'nt',
            'obj_fmt': 'coff',
            'cmake_system_name': 'Windows',
            'vendor': 'w64',
            'exe_suffix': '.exe',
        }

    if n == 'x86_64':
        return {
            'gnu_arch': 'x86_64',
            'family': 'x86',
        }

    if n == 'wasm32':
        return {
            'gnu_arch': 'wasm32',
            'family': 'wasm',
        }

    if n == 'wasm64':
        return {
            'gnu_arch': 'wasm64',
            'family': 'wasm',
        }

    if n == 'arm64':
        return du(a('darwin-aarch64'), {'arch': 'arm64'})

    if n == 'aarch64':
        return {'gnu_arch': 'aarch64', 'family': 'arm'}

    if n == 'armv7':
        return {
            'bits': 32,
            'gnu_arch': 'armv7',
            'family': 'arm',
        }

    if n == 'gnueabihf':
        return {
            'hard_float': True,
            'gnu': {
                'three': 'armv7-linux-gnueabihf',
            },
        }

    if n == 'riscv64':
        return {
            'gnu_arch': 'riscv64',
            'family': 'riscv',
        }

    if n == 'wasi32':
        return a('wasi-wasm32')

    if n == 'wasi64':
        return a('wasi-wasm64')

    if n == 'mingw64':
        return a('mingw_w64-x86_64')

    raise ce.Error(f'unknown target {n}')


def arch(n):
    return enrich(get_raw_arch(n.replace('mingw-w64', 'mingw_w64')))


class Config:
    def __init__(self, binary, overlays, root, verbose, seed):
        self.binary = binary
        self.overlays = overlays
        self.ix_dir = root
        self.verbose = verbose
        self.seed = seed
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
        except KeyError:
            return target

        return arch(target)


def find_pkg_dirs(binary):
    pkgs = os.path.join(os.path.dirname(binary), 'pkgs')
    path = os.environ.get('IX_PATH', '{builtin}')

    return list(path.replace('{builtin}', pkgs).split(':'))


def config_from(ctx):
    binary = ctx['binary']
    overlays = find_pkg_dirs(binary)
    root = os.environ.get('IX_ROOT', '/ix')
    verbose = os.environ.get('IX_VERBOSE', '')

    return Config(binary, overlays, root, verbose, ctx['seed'])
