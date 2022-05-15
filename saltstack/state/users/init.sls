{% from "users/map.jinja" import users with context %}

users:
  {{ users.module }}:
    - name: {{ users.name }}
    - fullname: {{ users.fullname }}
    - groups: {{ users.groups | json_encode_list }}

