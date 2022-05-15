{% from "deploy/map.jinja" import lvm with context %}

install_lvm_manager:
  pkg.installed:
    - name: lvm2

/dev/sdb:
  blockdev.tuned:
    - read-write: True

device:
  lvm.pv_present:
    - name: {{ lvm.device  }}

vgs:
  lvm.vg_present:
    - name: {{ lvm.vgname }}
    - devices: {{ lvm.device }}

lvroot:
  lvm.lv_present:
    - vgname: {{ lvm.vgname }}
    - size: {{ lvm.size }}
