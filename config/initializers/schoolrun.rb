# load application specific custom setttings

  APP_CONFIG = YAML.load_file(Rails.root.join('config', 'config.yml'))[Rails.env]




