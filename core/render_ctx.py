import os

import core.utils as cu
import core.error as ce
import core.parse_sh as cs


class FileLoader:
    def __init__(self, pkg):
        self.pkg = pkg

    def __getattr__(self, name):
        fname = name.replace('_', '.')

        return {
            'kind': fname.split('.')[-1],
            'data': self.pkg.template(os.path.join(os.path.dirname(self.pkg.name), fname)),
        }


def exec_mod(text, iface):
    g = {}

    exec(text, g)

    return g['package'](iface)


def compile_sh(script):
    return cs.parse(script)


def cononize(v):
    s = v.replace('\n', ' ').replace('\\', ' ').strip()

    while '  ' in s:
        s = s.replace('  ', ' ')

    return s


class RenderContext:
    def __init__(self, package):
        self.package = package

    def render(self):
        try:
            data = self.template(self.name)

            if data.strip().startswith('#'):
                return compile_sh(data)

            return exec_mod(data, self)
        except FileNotFoundError as e:
            raise ce.Error(f'can not load {self.name}', exception=e)
        except cs.Error as e:
            text = f'can not render {self.name}'
            context = f'{e.lineno}: {e.line}'

            raise ce.Error(text, context=context, exception=e.slave)

    def prepare_deps(self, v):
        return cononize(v)

    def dep_list(self, v, prefix):
        def iter_lines():
            for l in v.splitlines():
                l = l.strip()

                if l:
                    yield '# ' + prefix + ' ' + l

        return '\n'.join(iter_lines()).strip() + '\n'

    def fix_list(self, lst):
        return cononize(lst)

    def py_string_list(self, lst):
        def it():
            for x in cononize(lst).split(' '):
                x = x.strip()

                if x:
                    yield x

        return ', '.join(f"'{x}'" for x in it())

    @property
    def platform(self):
        return self.config.platform

    @property
    def config(self):
        return self.package.manager.config

    @property
    def files(self):
        return FileLoader(self)

    @property
    def name(self):
        return self.package.name

    @property
    def flags(self):
        return self.package.flags

    @property
    def os(self):
        return self.platform['target']['os']

    def if_linux(self, v):
        return self.if_os(v, 'linux')

    def if_darwin(self, v):
        return self.if_os(v, 'darwin')

    def if_os(self, v, os):
        if self.os == os:
            return v

        return ''

    def template(self, path):
        tmpl = self.package.manager.env.get_template(path)

        try:
            return self.strip_template(tmpl.render(mix=self))
        except Exception as e:
            raise ce.Error(f'can not render {path}', exception=e)

    def strip_template(self, v):
        vv = v.replace('\n\n\n', '\n\n')

        if vv == v:
            return v

        return self.strip_template(vv)
