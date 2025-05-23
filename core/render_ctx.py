import os
import json
import shutil
import functools

import core.utils as cu
import core.error as ce


def preproc(d):
    for x in d.split('\n'):
        x = x.strip()

        if not x:
            continue

        if x[0] == '#':
            continue

        yield x


def cononize(v):
    return cu.replace_all(' '.join(preproc(v)), '  ', ' ')


def parse_urls(urls):
    cur = {}

    for l in cononize(urls).split(' '):
        if '://' in l:
            cur['url'] = l
        else:
            if ':' not in l:
                l = 'sha:' + l

            cur['md5'] = l

        if len(cur) == 2:
            yield cur
            cur = {}


@functools.lru_cache
def ix_which(cmd, path):
    if ret := shutil.which(cmd, path=path):
        # print(ret)

        return ret


class RenderContext:
    def __init__(self, package):
        self.package = package

    def render(self):
        res, flags = self.template(self.package.name)

        return json.loads(res), flags

    def fix_list(self, lst):
        return cononize(lst)

    def parse_list(self, lst):
        for x in self.fix_list(lst).split(' '):
            if x:
                yield x

    def string_to_json(self, s):
        return json.dumps(s)

    def urls_to_json(self, urls):
        return json.dumps(list(parse_urls(urls)))

    def list_to_json(self, lst):
        return json.dumps(list(preproc(lst)))

    def load_file(self, name):
        n = os.path.join(os.path.dirname(self.package.name), name)

        return self.package.manager.fs.source(n)[0]

    def intro(self, p):
        return self.package.load_package(p, self.package.flags)

    def error(self, msg):
        raise ce.Error(msg)

    def template(self, path):
        pkg = self.package

        tmpl = pkg.manager.env.get_template(path)
        kind = pkg.flags['kind']

        hp = pkg.host
        tp = pkg.flags['target']
        bp = pkg.config.ops.boot_path()

        args = pkg.config.ops.flags()

        args = cu.dict_dict_update(args, {
            'ix': self,
            'ix_extract': ' '.join(pkg.config.ops.extract()),
            'ix_boot_path': bp,
            'ix_boot_tool': lambda x: ix_which(x, bp),
            'host': hp,
            'tool': pkg.name.startswith('bld/'),
            'boot': pkg.name.startswith('bld/boot/'),
            'name': pkg.name,
            'basename': os.path.basename(pkg.norm_name),
            'uniq_id': pkg.uniq_id,
            'native': hp['id'] == tp['id'],
            'ix_trash_dir': self.package.manager.config.trash_dir,
            'ix_dir': self.package.manager.config.ix_dir,
            'isfile': os.path.isfile,
            'intro': self.intro,
            'default_allocator': 'gperftools',
            'default_clang': '19',
            kind: True,
            tp['os']: True,
            tp['arch']: True,
        })

        args = cu.dict_dict_update(args, pkg.flags)

        if args['boot']:
            args['setx'] = '1'

        try:
            return self.strip_template(tmpl.render(args)), args
        except Exception as e:
            raise ce.Error(f'can not render {path}', exception=e)

    def strip_template(self, v):
        return cu.replace_all(v, '\n\n\n', '\n\n')
