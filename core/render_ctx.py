import os

import core.utils as cu
import core.error as ce
import core.sh_cmd as cs


class FileLoader:
    def __init__(self, pkg):
        self._p = pkg

    def __getattr__(self, name):
        fname = name.replace('_', '.')

        return {
            'kind': fname.split('.')[-1],
            'data': self._p.template(fname),
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
            try:
                return exec_mod(self.template('package.py'), self)
            except FileNotFoundError:
                return compile_sh(self.template('package.sh'))
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

    def template(self, name):
        path = os.path.join(self.name, name)
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
