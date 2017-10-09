use Mix.Config

config :basic_auth_scaffold, :uname_password,
  username: "mavis",
  password: "pwd"


config :basic_auth_scaffold, :token, token: "mytoken"

#
#     import_config "#{Mix.env}.exs"
