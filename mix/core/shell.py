import os
import glob
import shutil

import core.shell_cmd as cs


def cmd_untar(env, path):
    cs.untar(path)


def cmd_fetchurl(env, url, out=None):
    if not out:
        out = os.path.basename(url)

    cs.fetchurl(url, out)


def cmd_echo(env, *args):
    print(' '.join(args))


def cmd_newdir(env, path):
    try:
        shutil.rmtree(path)
    except FileNotFoundError:
        pass

    os.makedirs(path)


def cmd_rm(env, path):
    shutil.rmtree(path)


def cmd_unlink(env, *args):
    for path in args:
        os.unlink(path)


def cmd_cd(env, path):
    os.chdir(path)


def cmd_mkdir(env, path):
    os.makedirs(path)


def cmd_mkcd(env, path):
    cmd_mkdir(env, path)
    cmd_cd(env, path)


def cmd_touch(env, path):
    with open(path, 'w') as f:
        pass


def cmd_set(env, name, *args):
    env[name] = args


def cmd_chmod(env, mode, *args):
    for a in args:
        os.chmod(a, int(mode, 8))


def cmd_install(env, fr, to):
    os.link(fr, to)


def cmd_ln(env, *args):
    if args[0] == '-s':
        fn, fr, to = os.symlink, args[1], args[2]
    else:
        fn, fr, to = os.link, args[0], args[1]

    fn(fr, to)


def cmd_env(env):
    for k, v in env.items():
        print(str(k) + '=' + str(v))


def interpret_sh(text, env):
    def expand_vars(t):
        for k, v in env.items():
            s = '$' + k

            if s in t:
                t = t.replace(s, v)

        if '$' in t:
            raise Exception('subst failed for ' + t)

        if '*' in t:
            yield from glob.glob(t)
        else:
            yield t

    def tokens(l):
        for t in l.split(' '):
            yield from expand_vars(t)

    for l in text.split('\n'):
        l = l.strip()

        if not l:
            continue

        if l[0] == '#':
            continue

        t = list(tokens(l))

        print('+ ' + ' '.join(t))

        globals()['cmd_' + t[0]](env, *t[1:])


def interpret_py(text, env):
    print('+ eval ' + text)

    exec(text, env, env)


def interpret(text, env):
    sh = True

    for part in text.split('---'):
        if sh:
            interpret_sh(part, env)
            sh = False
        else:
            interpret_py(part, env)
            sh = True
