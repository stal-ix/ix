import os
import sys
import jinja2
import multiprocessing

import core.utils as cu
import core.error as ce


BUILD_PY_SCRIPT = '''
import atexit

mix.header()
atexit.register(mix.footer)

# suc
{build_script}
# euc
'''.strip()


FETCH_SRC_SCRIPT = '''
import sys

mix.fetch_url(sys.argv[-2], sys.argv[-1])
'''.strip()


CHECK_MD5_SCRIPT = '''
import os
import sys

old = sys.argv[1]
new = sys.argv[2]
md5 = sys.argv[3]

print(f'check {old} checksum, expect {md5}')
mix.check_md5(old, md5)
os.link(old, new)
'''.strip()


LINK_SRCS_SCRIPT = '''
import sys
import os

out = os.environ['out']
os.chdir(out)

for f in sys.argv[1:]:
    print(f'link {f} into {out}')
    os.link(f, os.path.basename(f))
'''.strip()


class ScriptBuilder:
    def __init__(self, config):
        self.config = config

    def build_sh_script(self, data, env):
        return {
            'args': ['dash', '-s'],
            'stdin': data,
            'env': env,
        }

    def build_py_script(self, data, env, args=[]):
        return {
            'args': [sys.executable, self.config.binary, 'misc', 'runpy'] + args,
            'stdin': BUILD_PY_SCRIPT.replace('{build_script}', data),
            'env': env,
        }


class CmdBuild:
    def __init__(self, package):
        self.package = package

    def script(self, sb, src_dir):
        build = self.package.descr['build']['script']

        return {
            'sh': sb.build_sh_script,
            'py': sb.build_py_script,
        }[build['kind']](build['data'], dict(self.iter_env(src_dir)))

    def iter_env(self, src_dir):
        path = ['/nowhere']

        for p in self.package.iter_all_build_depends():
            od = p.out_dir

            yield p.pkg_name.replace('-', '_'), od

            path.append(od + '/bin')

        yield 'PATH', ':'.join(path)

        if src_dir:
            yield 'src', src_dir

        uid = self.package.uid

        yield 'uid', uid
        yield 'out', self.package.out_dir
        yield 'tmp', self.package.config.build_dir + '/' + uid
        yield 'mix', self.package.config.binary
        yield 'exe', sys.executable

        yield 'make_thrs', str(multiprocessing.cpu_count() + 2)


def cmd_fetch(sb, url):
    # do not encode full path to output, for proper caching
    out_dir = os.path.join(sb.config.store_dir, cu.struct_hash([url, FETCH_SRC_SCRIPT]))
    path = os.path.join(out_dir, os.path.basename(url))
    script = sb.build_py_script(FETCH_SRC_SCRIPT, dict(out=out_dir), [url, path])

    return {
        'out_dir': [out_dir],
        'cmd': [script],
        'path': path,
        'cache': True,
    }


def cmd_check(sb, path, md5):
    out_dir = os.path.join(sb.config.store_dir, cu.struct_hash([path, CHECK_MD5_SCRIPT]))
    new_path = os.path.join(out_dir, os.path.basename(path))
    script = sb.build_py_script(CHECK_MD5_SCRIPT, dict(out=out_dir), [path, new_path, md5])

    return {
        'in_dir': [os.path.dirname(path)],
        'out_dir': [out_dir],
        'cmd': [script],
        'path': new_path,
    }


def cmd_link_script(sb, files, out):
    return sb.build_py_script(LINK_SRCS_SCRIPT, dict(out=out), files)


def cmd_link(sb, extra):
    out_dir = os.path.join(sb.config.store_dir, cu.struct_hash([extra, LINK_SRCS_SCRIPT]))
    script = cmd_link_script(sb, [x['path'] for x in extra], out_dir)

    return {
        'in_dir': sum([x['out_dir'] for x in extra], []),
        'out_dir': [out_dir],
        'cmd': [script],
    }


def iter_build_commands(self):
    if not self.buildable():
        return

    sb = ScriptBuilder(self.config)
    out_dir = self.out_dir
    urls = self.descr['build']['fetch']

    if urls:
        extra = []

        for ui in urls:
            f = cmd_fetch(sb, ui['url'])

            yield f

            c = cmd_check(sb, f['path'], ui['md5'])

            yield c

            extra.append(c)

        cmd = cmd_link(sb, extra)

        yield cmd

        extra = cmd['out_dir']
        src_dir = extra[0]
    else:
        extra = []
        src_dir = None

    yield {
        'in_dir': [x.out_dir for x in self.iter_all_build_depends()] + extra,
        'out_dir': [out_dir],
        'cmd': [CmdBuild(self).script(sb, src_dir)],
        'cache': True,
    }
