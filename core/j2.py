import os
import base64
import jinja2


def b64(data):
    return base64.b64encode(data.encode()).decode()


@jinja2.pass_context
def j2_linux(ctx, v):
    return ctx.get('mix').if_linux(v)


@jinja2.pass_context
def j2_darwin(ctx, v):
    return ctx.get('mix').if_darwin(v)


class Env(jinja2.Environment, jinja2.BaseLoader):
    def __init__(self, where):
        jinja2.Environment.__init__(self, loader=self, auto_reload=False, keep_trailing_newline=True)
        self.where = where
        self.filters["linux"] = j2_linux
        self.filters["darwin"] = j2_darwin

    def get_source(self, env, name):
        if name.startswith('//'):
            return self.get_source(env, name[2:])

        if name.endswith('/base64'):
            d, n, f = self.get_source(env, name[:-7])

            return b64(d), n, f

        with open(os.path.join(self.where, name)) as f:
            return f.read().strip(), name, lambda: True

    def join_path(self, tmpl, parent):
        if tmpl.startswith('//'):
            return tmpl

        return os.path.join(os.path.dirname(parent), tmpl)
