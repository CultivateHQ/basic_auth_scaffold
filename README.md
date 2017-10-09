# BasicAuthScaffold

Sets up some basic Auth routes for checking changes to [Basic Auth](https://github.com/CultivateHQ/basic_auth).

My default, `mix.exs` configures the plugin to be loaded from a sibling directory from where you run this.

Routes are

* localhost:4500 - credentials from config
* localhost:4501 - credentials authenticated with a callback function
* localhost:4502 - not even basic auth, but demonstrating check from a single `authenticate` request header.
