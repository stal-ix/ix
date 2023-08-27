import os
import sys
import json
import jinja2
import itertools

import core.sign as cs
import core.utils as cu
import core.error as ce


class ScriptBuilder:
    def __init__(self, package):
        self.package = package

    @property
    def config(self):
        return self.package.config

    def fix(self, rec):
        return cs.replace_sentinel(self.config.ops.fix(self, rec))

    def cmd(self, args):
        try:
            args['args']
            return args
        except TypeError:
            return self.build_cmd_script(args, '', {})

    def cmds(self, cmds):
        return [self.cmd(x) for x in cmds]

    def build_cmd_script(self, args, stdin, env):
        return {
            'args': args,
            'stdin': stdin,
            'env': env,
        }


def rev_dirs(l):
    return ':'.join(x.out_dir for x in reversed(l))


class CmdBuild:
    def __init__(self, package):
        self.package = package

    def parse_exec(self, line):
        for x in line.split():
            if x == 'runpy':
                yield from self.package.config.ops.runpy()
            else:
                yield x

    def script(self, sb, src_dir):
        build = self.package.descr['bld']['script']

        return sb.build_cmd_script(list(self.parse_exec(build['exec'])), build['data'], dict(self.iter_env(src_dir)))

    def iter_env(self, src_dir):
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


def cmd_fetch(sb, url, cksum):
    name = os.path.basename(url)
    odir = os.path.join(sb.config.store_dir, cs.gen_udir(f'url-{name}'))
    path = os.path.join(odir, name)

    return {
        'out_dir': [odir],
        'cmd': sb.config.ops.fetch(sb, url, path, cksum),
        'path': path,
        'pool': 'network',
        'predict': [
            {
                'path': path,
                'sum': cksum,
            },
        ],
    }


def cmd_check(sb, path, cksum):
    out_dir = os.path.join(sb.config.store_dir, cs.gen_udir('chk'))
    new_path = os.path.join(out_dir, os.path.basename(path))
    script = sb.config.ops.cksum(sb, path, new_path, cksum)

    return {
        'in_dir': [os.path.dirname(path)],
        'out_dir': [out_dir],
        'cmd': script,
        'path': new_path,
        'pool': 'misc',
    }


def cmd_link(sb, extra):
    out_dir = os.path.join(sb.config.store_dir, cs.gen_udir('lnk'))
    script = sb.config.ops.link(sb, [x['path'] for x in extra], out_dir)

    return {
        'in_dir': sum([x['out_dir'] for x in extra], []),
        'out_dir': [out_dir],
        'cmd': script,
        'pool': 'misc',
    }


def reparent_predict(pred, out_dir):
    return [{
        'path': out_dir + '/' + rec['path'],
        'sum': rec['sum'],
    } for rec in pred]


def iter_build_commands(self):
    sb = ScriptBuilder(self)

    if urls := self.descr['bld']['fetch']:
        extra = []

        for ui in urls:
            f = sb.fix(cmd_fetch(sb, ui['url'], ui['md5']))

            yield f

            c = sb.fix(cmd_check(sb, f['path'], ui['md5']))

            yield c

            extra.append(c)

        cmd = sb.fix(cmd_link(sb, extra))

        yield cmd

        extra = cmd['out_dir']
        src_dir = extra[0]
    else:
        extra = []
        src_dir = None

    rec = {
        'uid': self.uid,
        'in_dir': self.iter_build_dirs() + extra,
        'out_dir': [self.out_dir],
        'cmd': [CmdBuild(self).script(sb, src_dir)],
        'pool': 'network' if self.descr['net'] else self.descr['task_pool'],
    }

    if pred := self.descr['predict_outputs']:
        rec['predict'] = reparent_predict(pred, rec['out_dir'][0])

    yield sb.fix(rec)
