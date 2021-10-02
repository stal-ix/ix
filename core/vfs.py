import os


class VFS:
    def __init__(self, root):
        self.root = root

        with open(os.path.join(root, 'mount.py'), 'r') as f:
            self.mod = exec(f.read(), self.__dict__)

    def serve(self, path):
        return self.mod['serve'](path)


class FS:
    def __init__(self, root):
        self.root = root

    def serve(self, path):
        try:
            with open(os.path.join(self.root, path), 'r') as f:
                return f.read()
        except FileNotFoundError as e:
            a, sep, c = path.partition('/')

            if sep:
                return vfs(os.path.join(self.root, a)).serve(c)

            raise e


def vfs(root):
    try:
        return VFS(root)
    except FileNotFoundError:
        return FS(root)
