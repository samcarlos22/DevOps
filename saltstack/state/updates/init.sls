{% from "updates/map.jinja" import updates with context %}

updates:
  {{ updates.module }}:
    - drivers: {{ updates.drivers }}
    - categories: {{ updates.categories | json_encode_list }}
