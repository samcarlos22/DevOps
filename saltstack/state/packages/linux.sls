install_pip:
  pkg.installed:
    - name: python-pip

install_pyinotify:
  pip.installed:
    - name: inotify
