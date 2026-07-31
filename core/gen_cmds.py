import os

import core.sign as cs


class ScriptBuilder:
    def __init__(self, package):
        self.package = package

    @property
    def config(self):
        return self.package.config

    def fix(self, rec):
        return cs.replace_sentinel(rec)

    def cmd(self, args, env={}):
        try:
            args['args']
            return args
        except TypeError:
            return self.build_cmd_script(args, '', env)

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

    def script(self, sb, src_dir):
        build = self.package.descr['bld']['script']

        return sb.build_cmd_script(
            build['exec'],
            build['data'],
            dict(self.iter_env(src_dir)),
        )

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
        'in_dir': [],
        'out_dir': [odir],
        'cmd': sb.config.ops.fetch(sb, url, path, cksum),
        'path': path,
        'pool': 'network',
        'isolate': False,
        'tmpfs': False,
        'tmp': '',
        'predict': [
            {
                'path': path,
                'sum': cksum,
            },
        ],
    }


def cmd_link(sb, extra):
    out_dir = os.path.join(sb.config.store_dir, cs.gen_udir('lnk'))
    files = [x['path'] for x in extra]
    script = sb.config.ops.link(sb, files, out_dir)

    return {
        'in_dir': sum([x['out_dir'] for x in extra], []),
        'out_dir': [out_dir],
        'cmd': script,
        'pool': 'misc',
        'isolate': False,
        'tmpfs': False,
        'tmp': '',
        'predict': [
            {'path': os.path.join(out_dir, os.path.basename(f)), 'sum': x['predict'][0]['sum']}
            for x, f in zip(extra, files)
        ],
    }


def reparent_predict(pred, out_dir):
    return [{
        'path': out_dir + '/' + rec['path'],
        'sum': rec['sum'],
    } for rec in pred]


def iter_build_commands(self):
    sb = ScriptBuilder(self)

    if urls := self.descr['bld']['fetch']:
        fetched = []

        for ui in urls:
            f = sb.fix(cmd_fetch(sb, ui['url'], ui['md5']))

            yield f

            fetched.append(f)

        if len(fetched) > 1:
            cmd = sb.fix(cmd_link(sb, fetched))

            yield cmd

            extra = cmd['out_dir']
        else:
            extra = fetched[0]['out_dir']

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
        'tmpfs': self.descr['tmpfs'],
        'isolate': self.descr['isolate'],
        'tmp': self.config.build_dir + '/' + self.uid,
    }

    if pred := self.descr['predict_outputs']:
        rec['predict'] = reparent_predict(pred, rec['out_dir'][0])

    yield sb.fix(rec)
