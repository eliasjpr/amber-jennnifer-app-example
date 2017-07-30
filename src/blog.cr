require "jennifer/adapter/postgres" # for postgres
require "jennifer"
require "amber"
require "./controllers/**"
require "./mailers/**"
require "./models/**"
require "./views/**"
require "../config/*"

Amber::Server.instance.run
