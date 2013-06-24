# CacheDoctor
## Rack middleware for minor cache doctoring

###Overview

CacheDoctor allows you to redact small bits of HTML from your existing cache
 documents prior to sending the response, using a set list of CSS classes.
 This is performed on the server rather than with JavaScript so it is safe to
  use for removing small bits of sensitive information or more mundane things
   like sign-in links, without breaking up large existing cache fragments.

The following classes are available:
- `visible-signed-out`
- `visible-signed-in`
- `hidden-signed-out`
- `hidden-signed-in`
- `visible-user`
- `hidden-user`

When using the `visible-user` and `hidden-user` classes you must additionally
 provide the user id in a `data-` attribute for the user:

    <div class="hidden-user" data-user-id="<%= @post.user_id %>">
        This content will be hidden from the poster
    </div>

Currently only supports Warden based authentication solutions (like Devise) but
that can be replaced with a custom initializer (coming soon).

### Installation

In your Gemfile:

`gem 'cache-doctor', github: 'conzett/cache-doctor'`

WIP
