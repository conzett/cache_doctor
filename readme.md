# rails-cache-utils
## Javascript and CSS helpers to prevent cache breaking

###Overview

Allows for conditional styles to be set via cookie data for cleaner presentation, for example hiding sign in and sign out links without having to render different templates, allowing for easier caching of templates.

Use css classes `signed-in-hidden` and `signed-in-visible` style will automatically be loaded based on cookies set via callbacks. Future support will include user based show/hide styles.

Currently only supports Warden based authentication solutions (like Devise) but that can be replaced with a custom initializer.

As this only uses conditional stylesheets for hiding, do not use to redact sensitive information.

### Installation

In your Gemfile:

`gem 'rails-cache-utils', github: 'conzett/rails-cache-utils'`

Add the javascript to your application.js file

`//=require rails-cache-utils`

WIP
