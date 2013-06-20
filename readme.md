# rails-cache-utils
## Less logic in templates with JavaScript and conditional CSS classes

###Overview

Allows for conditional styles to be set via cookie data for cleaner
presentation, for example hiding sign-in and sign-out links without having to
 render different templates, or hiding edit links to content that is
 not yours, Ultimately allowing for more efficient caching.

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
that can be replaced with a custom initializer.

As this only uses conditional stylesheets for hiding, do not use to redact sensitive information.

### Installation

In your Gemfile:

`gem 'rails-cache-utils', github: 'conzett/rails-cache-utils'`

While it might work for your app to add the the javascript to your
application.js file:

`//=require rails-cache-utils`

It is better to include this rails-cache-utils.js at the
 top of your `<head>` to prevent a flash of un-styled content

`<%= javascript_include_tag 'rails-cache-utils' %>`

WIP
