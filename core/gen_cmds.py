import os
import sys
import jinja2
import multiprocessing

import core.sh_cmd as cs
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

md5 = sys.argv[-1]
out = sys.argv[-2]

def fetch():
    for url in sys.argv[1:-2]:
        try:
            mix.fetch_url(url, out)

            return True
        except Exception as e:
            print(f'fetch failed: {e}')

try:
    if not fetch():
        raise Exception(f'all attemps failed')

    mix.check_md5(out, md5)
except Exception as e:
    print(f'can not fetch {out}: {e}')
    sys.exit(1)
'''.strip()


LINK_SRCS_SCRIPT = '''
import sys
import os

os.chdir(os.environ['out'])

for f in sys.argv[1:]:
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

    @property
    def config(self):
        return self.package.config

    @property
    def name(self):
        return self.package.name

    @property
    def uid(self):
        return self.package.uid

    @property
    @cu.cached_method
    def tmp_dir(self):
        return self.config.build_dir + '/tmp-' + self.uid

    def script(self, sb, src_dir):
        def iter_env():
            yield from self.iter_env()

            if src_dir:
                yield 'src', src_dir

            yield 'uid', self.uid
            yield 'out', self.package.out_dir
            yield 'tmp', self.tmp_dir
            yield 'mix', self.config.binary
            yield 'exe', sys.executable

            yield 'make_thrs', str(multiprocessing.cpu_count() + 2)

        build = self.package.descr['build']['script']

        return {
            'sh': sb.build_sh_script,
            'py': sb.build_py_script,
        }[build['kind']](build['data'], dict(iter_env()))

    def iter_env(self):
        path = ['/nowhere']

        for p in self.package.iter_all_build_depends():
            od = p.out_dir

            yield p.name.replace('-', '_').replace('/', '_'), od

            path.append(od + '/bin')

        yield 'PATH', ':'.join(path)


def cmd_fetch_script(sb, urls, out, md5):
    path = os.path.join(sb.config.store_dir, cu.struct_hash([urls, md5, out]), out)

    def iter_env():
        yield 'out', os.path.dirname(path)

    return sb.build_py_script(FETCH_SRC_SCRIPT, dict(iter_env()), urls + [path, md5])


def cmd_fetch(sb, ui):
    md5 = ui.get('md5', '')
    url = ui['url']
    urls = ['https://storage.yandexcloud.net/mix-cache/cache/src/' + md5, url]
    script = cmd_fetch_script(sb, urls, os.path.basename(url), md5)
    path = script['args'][-2]

    return {
        'out_dir': [os.path.dirname(path)],
        'cmd': [script],
        'path': path,
    }


def cmd_link_script(sb, files, out):
    return sb.build_py_script(LINK_SRCS_SCRIPT, dict(out=out), files)


def cmd_link(sb, extra):
    out_dir = os.path.join(sb.config.store_dir, cu.struct_hash(extra))
    script = cmd_link_script(sb, [x['path'] for x in extra], out_dir)

    return {
        'in_dir': sum([x['out_dir'] for x in extra], []),
        'out_dir': [out_dir],
        'cmd': [script],
    }


def cmd_empty(sb, out):
    script = sb.build_py_script('', dict(out=out))

    return {
        'out_dir': [script['env']['out']],
        'cmd': [script],
    }


def iter_build_commands(self):
    sb = ScriptBuilder(self.config)
    cb = CmdBuild(self)

    if not self.buildable():
        yield cmd_empty(sb, cb.package.out_dir)

        return

    urls = self.descr['build'].get('fetch', [])

    if urls:
        extra = [cmd_fetch(sb, ui) for ui in urls]

        yield from extra

        cmd = cmd_link(sb, extra)

        yield cmd

        extra = cmd['out_dir']
        src_dir = extra[0]
    else:
        extra = []
        src_dir = None

    yield {
        'in_dir': [x.out_dir for x in self.iter_all_build_depends()] + extra,
        'out_dir': [self.out_dir],
        'cmd': [cb.script(sb, src_dir)],
    }
