import os
import sys
import json
import jinja2
import itertools
import multiprocessing

import core.utils as cu
import core.error as ce


BUILD_PY_SCRIPT = '''
import os
import sys
import atexit
import shutil

def prepare_dir(d):
    try:
        shutil.rmtree(d)
    except FileNotFoundError:
        pass

    os.makedirs(d)

def header():
    if out := os.environ.get('out'):
        prepare_dir(out)

    if tmp := os.environ.get('tmp'):
        prepare_dir(tmp)
        os.chdir(tmp)

def footer():
    if tmp := os.environ.get('tmp'):
        if sys.exc_info()[0]:
            shutil.rmtree(tmp)

header()
atexit.register(footer)

# suc
{build_script}
# euc
'''.strip()


class ScriptBuilder:
    def __init__(self, package):
        self.package = package

    @property
    def config(self):
        return self.package.config

    def build_cmd_script(self, args, stdin, env):
        return {
            'args': args,
            'stdin': stdin,
            'env': env,
        }

    def build_sh_script(self, data, env):
        return self.build_cmd_script(['sh', '-s'], data, env)

    def build_py_script(self, data, env, args=[]):
        stdin = BUILD_PY_SCRIPT.replace('{build_script}', data)
        runpy = self.config.ops.runpy(args)

        return self.build_cmd_script(runpy, stdin, env)


def rev_dirs(l):
    return ':'.join(x.out_dir for x in reversed(l))


class CmdBuild:
    def __init__(self, package):
        self.package = package

    def script(self, sb, src_dir):
        build = self.package.descr['bld']['script']

        return {
            'sh': sb.build_sh_script,
            'py': sb.build_py_script,
        }[build['kind']](build['data'], dict(self.iter_env(src_dir)))

    def iter_env(self, src_dir):
        path = ['/nowhere']

        h_lib = []
        t_lib = []
        h_bin = []

        for pkg in self.package.iter_tagged_build_depends():
            p = pkg['p']
            k = pkg['kind']

            if 'lib' in k:
                if 'target' in k:
                    t_lib.append(p)
                else:
                    h_lib.append(p)
            else:
                h_bin.append(p)

            yield p.uniq_id, p.out_dir

        yield 'IX_B_DIR', rev_dirs(h_bin)
        yield 'IX_H_DIR', rev_dirs(h_lib)
        yield 'IX_T_DIR', rev_dirs(t_lib)

        yield 'PATH', ':'.join(p.out_dir + '/bin' for p in h_bin)

        if src_dir:
            yield 'src', src_dir

        uid = self.package.uid

        yield 'uid', uid
        yield 'out', self.package.out_dir
        yield 'tmp', self.package.config.build_dir + '/' + uid

        yield 'make_thrs', str(multiprocessing.cpu_count() - 2)


UID = '#uid_placeholder#'


def gen_udir(suffix):
    return UID + '-' + cu.canon_name(suffix)


def cmd_fetch(sb, url, md5):
    # do not encode full path to output, for proper caching
    name = os.path.basename(url)
    odir = os.path.join(sb.config.store_dir, gen_udir(f'url-{name}'))
    path = os.path.join(odir, name)

    return {
        'out_dir': [odir],
        'cmd': sb.config.ops.fetch(sb, url, path, md5),
        'path': path,
        'cache': True,
        'pool': 'other',
        'important': {
            'name': name,
            'md5': md5,
        }
    }


def cmd_check(sb, path, md5):
    out_dir = os.path.join(sb.config.store_dir, gen_udir('chk'))
    new_path = os.path.join(out_dir, os.path.basename(path))

    if 'sem:' in md5:
        extra = [sb.package.find_tool('bin/semver').out_dir]

        script = [
            # TODO(pg): fix
            sb.build_cmd_script(['/bin/rm', '-rf', out_dir], '', {}),
            sb.build_cmd_script(['/bin/mkdir', out_dir], '', {}),
            sb.build_cmd_script([extra[0] + '/bin/semver', path, md5[4:]], '', {}),
            sb.build_cmd_script(['/bin/ln', path, new_path], '', {}),
        ]
    else:
        extra = []
        script = [sb.config.ops.cksum(sb, path, new_path, md5)]

    return {
        'in_dir': [os.path.dirname(path)] + extra,
        'out_dir': [out_dir],
        'cmd': script,
        'path': new_path,
        'pool': 'other',
    }


def cmd_link_script(sb, files, out):
    return sb.config.ops.link(sb, files, out)


def cmd_link(sb, extra):
    out_dir = os.path.join(sb.config.store_dir, gen_udir('lnk'))
    script = cmd_link_script(sb, [x['path'] for x in extra], out_dir)

    return {
        'in_dir': sum([x['out_dir'] for x in extra], []),
        'out_dir': [out_dir],
        'cmd': [script],
        'pool': 'other',
    }


def replace_dict(d, f, t):
    return json.loads(json.dumps(d).replace(f, t))


def replace_sentinel(x):
    imp = x.get('important', x)
    uid = cu.struct_hash(replace_dict(imp, UID, ''))

    return replace_dict(x, UID, uid)


def iter_build_commands(self):
    sb = ScriptBuilder(self)
    urls = self.descr['bld']['fetch']

    if urls:
        extra = []

        for ui in urls:
            f = replace_sentinel(cmd_fetch(sb, ui['url'], ui['md5']))

            yield f

            c = replace_sentinel(cmd_check(sb, f['path'], ui['md5']))

            yield c

            extra.append(c)

        cmd = replace_sentinel(cmd_link(sb, extra))

        yield cmd

        extra = cmd['out_dir']
        src_dir = extra[0]
    else:
        extra = []
        src_dir = None

    yield replace_sentinel({
        'uid': UID,
        'in_dir': self.iter_build_dirs() + extra,
        'out_dir': [self.out_dir],
        'cmd': [CmdBuild(self).script(sb, src_dir)],
        'cache': True,
        'pool': 'cpu',
    })
