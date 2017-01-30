# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HumanRegistry.Repo.insert!(%HumanRegistry.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

HumanRegistry.Repo.insert!(%HumanRegistry.Humans{names: ["Ashkan Nasseri"], emails: ["ashkan@humansregistry.com"]})
