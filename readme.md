# CacheDoctor
## Rack middleware for minor cache doctoring

###Overview

CacheDoctor allows you to redact small bits of HTML from your existing cache
 documents prior to sending the response, using a set list of data- attributes.
 This is performed on the server rather than with JavaScript so it is safe to
  use for removing small bits of sensitive information or more mundane things
   like sign-in links, without breaking up large existing cache fragments.

The following attributes are available:
- `data-signed-in="visible"`
- `data-signed-in="hidden"`
- `data-signed-out="visible"`
- `data-signed-out="hidden"`
- `data-visible-for="user_id"`
- `data-hidden-for="user_id"`

####Examples

    <div data-signed-in="visible">
        This content is only visible if you are signed in
    </div>

    <div data-visible-for="<%= @post.user_id %>">
        This content is only visible to the posts user
    </div>

Currently only supports Warden based authentication solutions (like Devise) but
that can be replaced with a custom initializer (coming soon).

### Installation

In your Gemfile:

`gem 'cache_doctor', github: 'conzett/cache_doctor'`

###Roadmap

This gem is very much a work in progress:

- ~~Identity based show/hide~~
- Specs
- Handle flash messages
