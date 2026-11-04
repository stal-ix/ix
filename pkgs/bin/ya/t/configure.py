"""Use ix tools for both bootstrap stages, without downloaded tool binaries."""
import argparse
import json
import os
from pathlib import Path
import re
import shutil
import subprocess


parser = argparse.ArgumentParser()
parser.add_argument('--local-resources', action='store_true')
parser.add_argument('host_os')
parser.add_argument('host_arch')
parser.add_argument('target_os')
parser.add_argument('target_arch')
args = parser.parse_args()
host_os, host_arch = args.host_os, args.host_arch
target_os, target_arch = args.target_os, args.target_arch
clang = Path(os.environ['YA_CLANG_DIR'])
python = Path(shutil.which('python3')).resolve().parent.parent
version = re.search(r'clang version (\d+)', subprocess.check_output(
    [str(clang / 'bin/clang'), '--version'], text=True)).group(1)


def resource(module, entries, extra=''):
    lines = ['RESOURCES_LIBRARY()', extra]
    if args.local_resources:
        for name, directory in entries.items():
            lines.append(f'DECLARE_EXTERNAL_RESOURCE({name} file://{directory})')
    lines.append('END()')
    Path(module, 'ya.make').write_text('\n'.join(lines) + '\n')


# These are the sanitizer interface headers vendored by this source revision;
# their location is independent of the version of the compiler running here.
p = Path('library/cpp/sanitizer/include/ya.make')
p.write_text(p.read_text().replace('clang${COMPILER_VERSION}-rt/include', 'clang20-rt/include'))

resource('build/platform/clang', {f'CLANG{version}': clang, 'CLANG': clang})
resource('build/platform/lld', {'LLD_ROOT': clang},
         f'LDFLAGS(-fuse-ld=lld --ld-path={clang}/bin/ld.lld)')
resource('build/platform/python/ymake_python3', {'YMAKE_PYTHON3': python}, 'NO_YMAKE_PYTHON3()')

# ay uses the same public toolchain descriptor as ymake. Its resource roots
# point at immutable ix outputs; the final stage uses ya's system compiler.
p = Path('build/ya.conf.json')
config = json.loads(p.read_text())
platforms = [{'host': {'os': host_os.upper(), 'arch': host_arch},
              'target': {'os': os_name.upper(), 'arch': arch}, 'default': True}
             for os_name, arch in dict.fromkeys([(host_os, host_arch), (target_os, target_arch)])]
config['toolchain'] = {'ix': {
    'name': 'default',
    'platforms': platforms,
    'tools': {'c++': {'executable': str(clang / 'bin/clang++')}},
    'params': {
        'type': 'clang', 'version': version,
        'c_compiler': str(clang / 'bin/clang'),
        'cxx_compiler': str(clang / 'bin/clang++'),
        'ar': str(clang / 'bin/llvm-ar'),
        'nm': str(clang / 'bin/llvm-nm'),
        'objcopy': str(clang / 'bin/llvm-objcopy'),
        'objdump': str(clang / 'bin/llvm-objdump'),
        'strip': str(clang / 'bin/llvm-strip'),
        'platform': {name.upper(): ['build/platform/clang', 'build/platform/lld']
                     for name in (host_os, target_os)},
    },
}}
p.write_text(json.dumps(config, indent=2) + '\n')
