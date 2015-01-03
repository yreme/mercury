<<<<<<< HEAD
# Mercury Editor

[![Build Status](https://secure.travis-ci.org/jejacks0n/mercury.png?branch=master)](http://travis-ci.org/jejacks0n/mercury)
[![Dependency Status](https://gemnasium.com/jejacks0n/mercury.png)](https://gemnasium.com/jejacks0n/mercury)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/jejacks0n/mercury)

此代码所预期的功能是，对整个页面都可用进行编辑。这个是核心，对任何html添加这个功能， 就可以博取众长。  

Mercury Editor is a fully featured editor much like TinyMCE or CKEditor, but with a different usage paradigm.  It
expects that an `entire page is something that can be editable`, and `allows different types of editable regions to be
specified`.  It displays a single toolbar for every region on the page, and uses the HTML5 contentEditable features on
block elements, instead of iframes, which allows for CSS to be applied in ways that many other editors can't handle.

Mercury has been written using CoffeeScript and jQuery for the Javascript portions, and is written on top of Rails 3.2.


## Developer Note

I've started a [new version of Mercury Editor](https://github.com/jejacks0n/mercury/tree/mercury2) with many
improvements. I've learned a lot in the past few years, and I've also learned how Mercury could be improved from
comments, feature requests, feedback etc.

The new project will take the place of this one, and the Rails portions will be moved to a new repo and will become more
full featured -- to serve as an example of how it can be used.  I will do what's reasonable to make this easy for folks
(eg. moving master -> mercury1, and mercury2 -> master), but I don't get paid for this and I use this project as a sort
of proving ground for various concepts and techniques, so I'd like to keep it fun and not get bogged down in version
stuff. This means it's your responsibility to manage the transition or stick with the current version (which is no
longer maintained by me).

There will be a purging of pull requests and issues when the transition takes place -- probably a few months from now.


## Awesomeness

Ryan Bates has created an awesome [RailsCast](http://railscasts.com/episodes/296-mercury-editor) that walks you through
getting Mercury Editor installed, setup and working in a Rails application.  Check it out!

Mercury has been added as a Featured Project on Pivotal Tracker!  If you're interested in what's planned, check out the
[Mercury Tracker Project](https://www.pivotaltracker.com/projects/295823).
=======
Mercury Editor 2
================

![logo](https://pbs.twimg.com/media/BK_SVKdCYAAFXT1.jpg:large)

[![Build Status](https://travis-ci.org/jejacks0n/mercury.png?branch=mercury2)](https://travis-ci.org/jejacks0n/mercury)

Mercury Editor is a web based WYSIWYG editor, and takes a different approach than any editor out there. It provides a full framework in which you can more easily create complex regions and interfaces. In Mercury Editor, regions dictate it's toolbars, buttons, and context for highlighting buttons. This simplifies the configuration, and provides more flexibility in terms of defining your own custom functionality that doesn't fit into the standard Mercury Editor features.

Mercury Editor also provides a comprehensive plugin architecture. Plugins makes additional functionality easier to write, test, and maintain -- and allows for a more consistent way to provide it to others.


## Developer Notice

This branch represents the future version of Mercury Editor. This iteration of Mercury Editor (Mercury2) separates the Rails portions from the Javascript portions of the project. Rails is still used for development (for a server, coffeescript, sass, build process etc.) but the Rails Engine has been moved to [mercury-rails](https://github.com/jejacks0n/mercury-rails) -- this enables more functionality, and to serve as an example of how to implement functionality like snippets and image uploading/resizing. If you're interested in integrating Mercury2 with your own platform, this is the best place to start.
>>>>>>> 95e6decf9fd1b2a7f705e45b64c210e86cd2c885


## Browser Support

<<<<<<< HEAD
Mercury has been written for the future, and thus doesn't support legacy browsers or browsers that don't follow the W3C
specifications for content editing.  Any browser will be supported if they support the W3C specification in the future,
but there aren't plans currently for adding support for alternate implementations at this time.

Supported Browsers:

- Internet Explorer 10+
- Chrome 10+
- Firefox 4+
- Safari 5+
- Opera 11.64+
- Mobile Safari (iOS 5+)


## A Demo

Feel free to check out [the demo](http://jejacks0n.github.com/mercury/).  We'll be adding a full walkthrough that goes
into detail for each of the major features.  If you would like to see how Mercury was implemented in the demo check the
[gh-pages](https://github.com/jejacks0n/mercury/tree/gh-pages) branch, it's a useful resource to see how you can
integrate the Mercury bundle into a non-rails project since it's a static site.


## The Story

I was looking for a fully featured editor that didn't use iframes to edit the content, and there weren't any decent
ones.  My primary goal was to have areas that were editable, but that also allowed CSS to flow naturally.  A few have
cropped up since then (Aloha Editor for instance), and as good as they are, none had all the features I was looking for.

Mercury was written to be as simple as possible, while also providing an advanced feature set.  Instead of complex
configuration, we chose a mix of configuration and code simplicity, which should give you a much better chance at
customizing Mercury to suit your exact needs.  This doesn't mean there's not configuration, and what's there provides
much of what you'll need, but efforts were taken to keep it simple and powerful.

Even though it's a great editor, Mercury Editor may not be the best for your needs (based on browser support,
functionality, etc.) so here's a list of some other editors that you might want to check out:

- [Aloha Editor](http://www.aloha-editor.org/)
- [jHtmlArea](http://jhtmlarea.codeplex.com/)
- [MarkItUp](http://markitup.jaysalvat.com/home/)
- [TinyMCE](http://tinymce.moxiecode.com/)
- [CKEditor](http://ckeditor.com/)
- [NicEdit](http://nicedit.com/)
- [Raptor Editor](http://www.raptor-editor.com/)


## Features

The feature list is actually pretty long, so here's a short list that should be highlighted.

- Previewing: Preview content while you're working to see exactly how it'll look.
- Link Tools: Insert and edit links, including TOC/Bookmark links.
- Media Tools: Insert and edit images, youtube videos, and vimeo videos.
- Image Uploading: Drag images from your desktop and they'll be automatically uploaded and inserted.
- Table Editing: Advanced table editing and creation, including support for multiple column and rows spans.
- Snippets: Insert and edit predefined and reusable bits of markup/code using drag and drop.
- Custom Regions: We provide Full HTML, Markdown, Snippet, Image, and Simple region types by default.
- I18n: Built in low profile translation and internationalization system.


## Installation

### For Rails

Include the gem in your Gemfile and bundle to install the gem.

    gem 'mercury-rails'

You can also get the configuration file and overrides by running the install generator.

    rails generate mercury:install

This generator puts a mercury configuration file into your project in /app/assets/javascripts/mercury.js.  This file
also functions as a manifest using sprockets `require` to include dependencies.  The install generator can optionally
install the layout and css files.

#### Image Processing / Uploading

Mercury has a basic facility for allowing image uploads, and we provide a generator that can act as a starting point for
your own back end integration.  To install run the generator.

    rails generate mercury:install:images

For Mongoid + MongoDB, you can use the `--orm=mongoid` option on the generator to get the appropriate model added to
your app.  This generator also puts paperclip (and mongoid_paperclip if needed) into your Gemfile, so make sure to
`bundle` or make your own adjustments.

If you're using ActiveRecord, make sure to migrate your database.  You can also disable this feature entirely in the
mercury configuration if you don't plan on allowing image uploading.

#### Authentication

Mercury provides a generator for giving you a basic authentication implementation.  You can run this generator and write
your own logic into the authentication file it provides.

    rails generate mercury:install:authentication

This provides a simple method for restricting the actions in the default MercuryController to only users who have the
required privileges.  Since this can vary largely from application to application, it's a basic approach that assumes
you'll write in what you want.

### For Non-Rails Environments

[Download the zip file](https://github.com/downloads/jejacks0n/mercury/mercury-v0.9.0.zip), and then follow the
installation instructions on the [wiki article](https://github.com/jejacks0n/mercury/wiki/Using-Mercury-without-Rails).
=======
Mercury has been written for the future, and thus doesn't support legacy browsers or browsers that don't follow the W3C specifications for content editing. Any browser will be supported if they support the W3C specification in the future, but there aren't plans currently for adding support for alternate implementations at this time.

Supported Browsers:

- Chrome 27
- Firefox 22 (currently in beta)
- Opera 12
- Safari 6.0.4
- Mobile Safari
- IE10? (need a VM with Win7/IE10 to check -- can't install my DVD copy on my Macbook Pro because it doesn't have a DVD drive)
>>>>>>> 95e6decf9fd1b2a7f705e45b64c210e86cd2c885


## Usage

<<<<<<< HEAD
There's a glob route that captures everything beginning with `/editor`, so for instance to edit an `/about_us` page, you
should access it at the `/editor/about_us` path.

For performance reasons you may also want to notify Mercury when the page is ready to be initialized.  To do this just
trigger the initialize:frame event from within your normal application layouts.  You can do this when the DOM is ready
to be interacted with (eg. dom:loaded, document.ready), or at the bottom of your body tag.  It's recommended that you do
this because it gives you some load performance improvements, but it's not required.

    jQuery(parent).trigger('initialize:frame');

Mercury has an expectation that content regions will be on the page (not required, but probably useful).  To define
content regions that Mercury will make editable you need to add a `data-mercury` attribute to an element.  This
attribute is used to specify the region type.  Mercury provides some default region types, but you can also create your
own.  Region types are outlined below, and the available values for the `data-mercury` attribute are:

- full
- simple
- markdown
- snippets
- image (should only be applied to img tags)

It's important for saving that an id attribute *always* be set on regions, so you should always include one.

    <div id="primary" data-mercury="full">
      default content
    </div>

For more advanced ways to integrate Mercury Editor with your Rails application (such as not using the /editor routing prefix) check out this
[wiki article](https://github.com/jejacks0n/mercury/wiki/Rails-Integration-Techniques).

### Using Mercury without Rails

If you're looking to use Mercury without Rails, you should start by checking this
[wiki article](https://github.com/jejacks0n/mercury/wiki/Using-Mercury-without-Rails).


## Region Types

### Full Region

Full regions are for full HTML markup and utilize the HTML5 contentEditable feature.  These are the core of what
Mercury does, and provide the most flexibility and visual representation of what the content will look like when saved.

### Simple Region

Simple regions are designed for plain text.  Newlines and markup are not allowed.  Simple Regions are appropriate for
titles, headlines, or any area where you want the content to be editable but not the style.

### Markdown Region

Markdown regions are based on Markdown syntax (specifically the github flavored version), and aren't as full featured as
the full region type -- primarily because Markdown is meant to be simple.  To keep it simple you can't do things like
set colors etc.  This region type is useful if you want to keep the markup clean and simple.

### Snippets Region

Snippet regions only allow snippets and don't have a concept of content editing within them.  Snippets can be the way to
go with complex markup and functionality, and are basically chunks of reusable markup that can be defined by a developer
and placed into content regions later.  More on this below.

### Image Region

The image region type should only be applied to an image tag.  It results in the image being drag-and-drop replacable.
This differs from the image handling in full regions, in that no content is in the area.  This works well for logos
and images you want to display with careful layout, and do not need any content functionality.


## Loading / Ready State

When Mercury loads it will fire an event telling the document that it's initialized, available and ready.  You can do
several things once Mercury is loaded, and we expose as many ways to do this as possible.  You can bind to the event
using jQuery, Prototype, or Mercury directly.  Or if you'd prefer you can just create a method and Mercury will call
that when it's ready.

#### jQuery

    jQuery(window).on('mercury:ready', function() { Mercury.saveUrl = '/content'; });

#### Mercury

    if (parent.Mercury) {
      parent.Mercury.on('ready', function() { Mercury.saveUrl = '/content'; });
    }

#### Function Declaration

    function onMercuryReady() { Mercury.saveUrl = '/content'; }

#### Prototype

    Event.observe(window, 'mercury:ready', function() { Mercury.saveUrl = '/content'; });


## Snippets

Snippets are reusable and configurable chunks of markup.  They can be defined by developers, and then placed anywhere in
content regions that support them.  When you drag a snippet into a region you'll be prompted to enter options, and after
entering options the snippet will be rendered into the page as a preview.  Snippets can be dragged around (in
snippets regions), edited or removed.

Mercury does very little to save content and snippets for you, but it does provide the ability to load snippets from
your own storage implementation.  Here's an example of loading existing snippet options back into Mercury using jQuery.

    jQuery(window).on('mercury:ready', function() {
      Mercury.Snippet.load({
        snippet_1: {name: 'example', options: {'favorite_beer': "Bells Hopslam", 'first_name': "Jeremy"}}
      });
    });

Snippet contents (when saved) are removed from the content.  Their options and their placement does come through in the
content however, and you're responsible for rendering your own snippet content when the page is being rendered.  You can
read more on the [wiki article about snippets](https://github.com/jejacks0n/mercury/wiki/Snippets).


## Reinitializing Regions

If you're using things like history.pushState, pjax, or just simply dynamically replacing / loading new content into
your pages, you can reinitialize regions afterwards by using:

    Mercury.trigger('reinitialize')

This will find any new regions and initialize them, leaving the existing ones intact.  There's more details that you'll
need to understand before taking advantage of all the possible features, but this will likely work for most cases.

In more advanced cases, you may want to load new snippets, and potentially prompt to save the contents before loading
the new content -- so content isn't lost.  The handling of these aspects is up to you, as Mercury can't know if an ajax
request will try to dynamically replace or load new content.


## Saving Content / Rendering Content

Note: Mercury doesn't implement saving or rendering of content.  We leave this part up to you because it can vary in so
many ways.  You may want to implement content versioning, use a nosql data store like mongo etc. and we don't want to
force our opinions.

Mercury will submit JSON or form values back to the server on save, and this can be adjusted in the configuration.  By
default it will use JSON, that JSON looks like:

    {
      "region_name": {
        "type": "full",
        "value": "[contents with a snippet]",
        "snippets": {
          "snippet_1": {
            "name": "example",
            "options": {
              "options[favorite_beer]": "Bells Hopslam",
              "options[first_name]": "Jeremy"
            }
          }
        }
      }
    }

Where it gets saved to is also up to you.  By default it submits a post to the current url, but you can adjust this by
setting Mercury.saveUrl, or passing it into the Mercury.PageEditor constructor.  How you do this is dependent on how
you're using loading mercury (via the loader, or by using the route method).  In both situations setting Mercury.saveUrl
is the most consistent.

    jQuery(window).on('mercury:ready', function() {
      Mercury.saveUrl = '/contents';
    });

Assuming you have a ContentsController and a RESTful route, this will make it through to the create action.  Where you
can store the content in whatever way you think is appropriate for your project.

Rendering content is up to you as well.. Now that you have content saved, you can add that content back to your pages,
and there's a lot of ways you could approach this.  In the past I've used Nokogiri to find and replace the contents of
regions, and do some additional handling for putting snippets back into the content.  You could also use regular
expressions to do this, which is probably faster, but maybe not as safe.

I'm interested in what solutions people are looking for and end up using for this, so feel free to shoot me a line if
you write something (eg. a middleware layer, an nginx module, or just something simple to get the job done).


## Images

The toolbar images have been created by the awesome [Mode Set](http://modeset.com/) guys (using
[GLYPHICONS](http://www.glyphicons.com/)).  They follow a simplistic design aesthetic to minimize the complexity of
creating / finding your own.  You're welcome to contribute your own to the PSD that can be found within the project so
others can potentially build from or use your own contributions.


## Internationalization / Translations

Mercury has support for the following locales.  If you'd like to contribute one, the easiest way is to fork the project,
create a locale file with your translation, and submit a pull request -- that way you get full credit for your
contributions.

Some [examples are here](https://github.com/jejacks0n/mercury/tree/master/app/assets/javascripts/mercury/locales),
and there's more on the [wiki page](https://github.com/jejacks0n/mercury/wiki/Localization-&-Translations).
=======
**NOTE:** this is likely to change and be expanded on.

If you're using Mercury2 with Rails, you should check out the [mercury-rails](https://github.com/jejacks0n/mercury-rails) project. You should ignore these steps and use the ones provided there.

If you want to use the raw assets grab them from [the distro](https://github.com/jejacks0n/mercury/tree/mercury2/distro), or download the [current version]() (not available yet) as a compressed package. Older versions are available as [compressed packages]() (not available yet) as well.

### Installation

Start by loading the general dependencies (changing paths as needed). The only required dependency is jQuery (1.8+), and in this example we'll use jQuery 2.0.

```html
<link href="mercury.bundle.css" media="screen" rel="stylesheet" type="text/css">
<script src="dependencies/jquery-2.0.0.js" type="text/javascript"></script>
<script src="dependencies/liquidmetal-1.2.1.js" type="text/javascript"></script> <!-- optional, used for filtering lists -->
<script src="mercury.min.js" type="text/javascript"></script>
```

It's worth noting that if you don't use the css bundle, you'll need to update the css to point to the correct font path and have those servable as well.

Mercury2 Regions are broken out from the main javascript file, which allows you to have whatever you want while not having regions you don't want. Each region can have it's own dependencies which are documented at the top of each region javascript. Regions include their own dependencies as well, so if you don't want a region you don't have to worry about it's dependencies.

Let's say we want to use the HTML and Markdown regions.

```html
<script src="regions/markdown.min.js" type="text/javascript"></script>
<script src="regions/html.min.js" type="text/javascript"></script>
```


### Initializing

You can initialize Mercury2 any time after the DOM is ready. You can use the jQuery dom loaded callback, or initialize it at the bottom of the document. The `Mercury.init` method takes options that are passed directly to the interface class that you've configured (Mercury.FrameInterface by default).

```javascript
jQuery(function() {
  Mercury.init();
})
```


## Examples

The configuration is a good place to start reading about various options and other useful tidbits. The configuration is at the top of the main `mercury.js` or `mercury.min.js` file, and has default configurations for all the standard regions as well -- you can [read more about the configuration options here](https://github.com/jejacks0n/mercury/blob/mercury2/lib/javascripts/mercury/config.coffee).

There's [several examples](https://github.com/jejacks0n/mercury/tree/mercury2/examples) of how to integrate more complex features directly in the project, and the [gallery region](https://github.com/jejacks0n/mercury/blob/mercury2/lib/javascripts/mercury/regions/gallery.coffee) is a good place to start reading if you're planning on writing custom regions.

There's an example for how to [sandbox using an iframe](https://github.com/jejacks0n/mercury/blob/mercury2/examples/frame.haml) and for more complex integrations check the [developer interface example](https://github.com/jejacks0n/mercury/blob/mercury2/examples/assets/developer_interface.coffee) which outlines many of the events and API, and if you're planning on adding functionality there's some examples of [how to add your own toolbars and actions, or write simple plugins](https://github.com/jejacks0n/mercury/blob/mercury2/examples/assets/functionality_adding.coffee).

An example of server integration is available in the [mercury-rails](https://github.com/jejacks0n/mercury-rails) project, which outlines all of the features that are needed by the server to fully work with the default regions.


## Standard Events

Since Mercury2 has a basic framework this list only includes the core events. Additional events could be added by plugins, custom regions, and views.

To bind to global events use `Mercury.on` or `Mercury.one`, eg. `Mercury.on('focus', function() { alert('Mercury was focused') })`. If you're binding to view, model, or snippet events you should use the `instance.on` method to bind to events. All region events are triggered both on the region instance, and globally as `region:[eventname]` with the first argument being the region instance -- this allows you to bind to region events for all regions should you need to.

### Public Events
- **focus** - focuses mercury, which will refocus the last region to have focus
- **blur** - blurs mercury
- **save** - initializes the save process (eg. calls Mercury.interface.save)
- **initialize** - tells mercury that the document is ready to be initialized (build interface/find regions)
- **reinitialize** - tells mercury that new regions might have been added and to find them
- **toggle** - toggles the interface
- **show** - shows the interface (does nothing if the interface is showing)
- **hide** - hides the interface (does nothing if the interface is hidden)
- **mode** - toggles a given mode (modes: preview -- eg. Mercury.trigger('mode', 'preview'))
- **action** - provides an action for Mercury -- typically processed by the focused region

### Global Events
- **configure** - triggered on Mercury.init and Mercury.configure
- **released** - triggered on Mercury.release
- **save:complete** - triggered on successful save ajax request

### Model Events
- **init** - triggered when a model is initialized
- **save** - triggered when the model save ajax request is successful
- **error** - triggered when the model save ajax request fails

### Snippet Events
- **rendered** - triggered when a snippet is rendered (can happen on undo/redo actions)

### View Events
- **build** - triggered when building / initializing

### Region Events
- **action** - triggered when an action is handled (global: region:action)
- **update** - triggered whenever a possible change could be made within in a region (includes focus - global: region:update)
- **preview** - triggered when the region is going into or coming out of preview mode (global: region:preview)
- **release** - triggered when the region is being released (global: region:release)
- **focus** - triggered when the region is focused (call instance.focus to manually focus a region - global: region:focus)
- **blur** - triggered then the region is blurred (call instance.blur to manually blur a region - global: region:blur)


## Sandboxing & The Shadow Dom

Mercury2 allows sandboxing content within an iframe or it can load directly on the page you're editing. This has been a complication in the past, so this version simplifies that while also retaining the ability to sandbox itself to mimimize conflicts with javascript libraries and css.

The iframe support has also been simplified and expects that you pass an iframe (or selector) when initializing using the FrameInterface. This allows you to determine what url is loaded, and simplifies the save process.

Mercury2 also now has support for moving it's interface into a [Shadow DOM](http://glazkov.com/2011/01/14/what-the-heck-is-shadow-dom), which removes the interface from the dom on the page that you're editing, which helps to alleviate conflicts on the page with other javascript and css, but isn't as reliable as using an iframe nor as widely supported.


## Fonts & Graphics

Mercury2 uses two custom fonts for all graphic elements in the interface. This allows for retina support, makes it easier to package, and allows it to be more customizable long term.

The primary toolbar icons and general interface graphics are in the `mercury-icons` font, which is generated using fontcustom and svg images -- several of the glyphs came from the awesome [IcoMoon project](http://icomoon.io/app/) (by [Keyamoon](https://twitter.com/keyamoon)).

The toolbar icons (bold, italics, etc.) are in the `mercury-toolbars` font, which was built using [fontstruct.com](http://fontstruct.com/). [The original font](http://fontstruct.com/fontstructions/show/797530) can be cloned and edited as needed. Fontstruct is used for this font because it allows for small pixel fonts but also allows for more advanced shapes that scale nicely.

Other graphics (there are only a few) are small images that have been base64 encoded and embedded into the css to simplify installation. You can change these images by overriding the classes where they're used and providing your own.


## I18n / Translations

Mercury2 has support for the following locales.  If you'd like to contribute one, the easiest way is to fork the project, create a locale file with your translation, and submit a pull request -- that way you get full credit for your contributions.
>>>>>>> 95e6decf9fd1b2a7f705e45b64c210e86cd2c885

Translations and contributors:
- Arabic ([mohamagdy](https://github.com/mohamagdy))
- Danish ([martinjlowm](https://github.com/martinjlowm))
- German ([poke](https://github.com/poke))
- Spanish ([javiercr](https://github.com/javiercr))
- French ([adamantx](https://github.com/adamantx))
<<<<<<< HEAD
- Italian ([gcastagneti](https://github.com/gcastagnet))
=======
- Italian ([gcastagneti](https://github.com/gcastagnet) / [eymengunay](https://github.com/eymengunay))
>>>>>>> 95e6decf9fd1b2a7f705e45b64c210e86cd2c885
- Korean ([dorajistyle](https://github.com/dorajistyle))
- Dutch ([kieranklaassen](https://github.com/kieranklaassen))
- Polish ([cintrzyk](https://github.com/cintrzyk))
- Portuguese ([yakko](https://github.com/yakko))
- Swedish ([stefanm](https://github.com/stefanm))
- Simplified Chinese ([董劭田 DONG Shaotian](https://github.com/richarddong))
- Hungarian ([egivandor](https://github.com/egivandor))
- Russian ([ilyacherevkov](https://github.com/ilyacherevkov))

<<<<<<< HEAD
To add translations to your installation you'll first need to turn it on in the configuration and set the prefered
locale to one of those that's listed above (eg. `fr-CA`, or `pt-BR`).  All you have to do after that is include the
locale you want to use.  You can do this in the configuration file directly using a sprockets `require` statement.
Examples are provided.


## Project Details

### WYSIWYG Editors Suck

They just do.  Which as I've learned, is primarily due to the browser implementations.  Don't get me wrong, what the
browsers have implemented is amazing, because it's hard stuff, plain and simple.  But if you're expecting a WYSIWYG
editor to solve all your content problems you're wrong.  A better perception is that it will solve many of them, but
shifts some into a new area.

With that being said, Mercury tries to solve many of those issues and succeeds to a great degree, but it seems to be
nearly impossible (impractical at least) to address everything, and the browsers don't expose enough to fix some things.
This is true for every editor that I've looked into as well, and will likely just take time as the browser vendors begin
to prioritize and fix these issues.

It's important to understand this, and the details are more suited for long nerdy blog posts, so they won't be covered
here.

### The Code and Why

#### CoffeeScript

Mercury has been written entirely in CoffeeScript because it simplifies a lot of the patterns that are used, and allows
for very readable code.  The goal was to provide good readable code that could be adjusted based on need, instead of a
complex configuration that makes the code harder to understand and tweak.

#### jQuery

jQuery was used as the javascript library, but is primarily used for the selectors, traversing, and manipulating the
DOM.  Chaining is kept to a minimum for readability, and even though much of Mercury could've been written as jQuery
plugins, it was not.

#### Rails

With the asset handling that comes bundled with Rails 3.1+, Rails Engines, and the gem tools, there really wasn't any
other option.  The javascript from Mercury can be used by any back end system, and isn't limited to Rails.  Many of the
features do require a back end however, and those features would have to be written in whatever language you wanted
support for.

The coffeescript files can be found in the repo, and I would be fully supportive of anyone who wanted to add support for
different back end frameworks or languages.  There's a server specification in the wiki that will help as well.

#### Specs / Integration Tests

Mercury is fully tested using Jasmine (via Teabag) and Cucumber.  You can clone the project to run the full suite.

    rake teabag
    rake cucumber

The default rake task does both of these in order.
=======

## Modules

A little complex, but worth documenting so it can be utilized well. Mercury ships with the concept of modules, and the first time I saw this concept was in Spine.js. Modules are bits of code (an object), that can be mixed into another object, class, the prototype of an object/class, or can be included in a single instance.

Any class that inherits from (aka extends) Mercury.Module will get a few methods/properties. The `extend`, `include` methods, and the ability to specify a `mixins` array.

When you `extend` a class it will add class level methods, and when you `include` a module it will add it to the classes prototype (so every instance of that class ever) and this may or may not be desired so you can also specify the `mixins` array as a class or instance property. If you use the mixins array, the modules will be "included" during instantiation, and will not be added to the object prototype.

Note: The objects that you pass to these methods are usually defined elsewhere, but for brevity this example just shows a simple object.

```coffeescript
class Animal extends Mercury.Module
  @extend foo: ->
  @include bar: ->
```

The Animal class will have a `foo` class method, and a `bar` "instance" method. Anything inheriting from Animal will also have these methods.

```coffeescript
class Dog extends Animal
  @include baz: ->
  mixins: [qux: ->]
```

Dog will have the same `foo` and `bar` methods as Animal, but it will also have the `baz` method.. and so will anything inheriting from Animal because the prototype is shared. This is where the mixins array comes in. Dog will have an instance method `qux`, but it won't make it onto the prototype, and so, is restricted to any instance of the Dog class.

Check [module.coffee](https://github.com/jejacks0n/mercury/blob/mercury2/lib/javascripts/mercury/core/module.coffee) for more comments and some code. And the various modules in [lib/mercury/views/modules](https://github.com/jejacks0n/mercury/tree/mercury2/lib/javascripts/mercury/views/modules), for several examples of how modules can be defined and used.


## Dependencies

Mercury2 was built using jQuery 1.9.1/2.0, but attempts to minimize reliance on jQuery as much as is feasible.

Each region can also have it's own dependencies, which is entirely up to the author. If you're writing a custom region it's expected to document the dependencies and version information.


## Contributing

Awesome! Please [check here](https://github.com/jejacks0n/mercury/blob/mercury2/CONTRIBUTING.md).


## Known issues

### Webkit

- Dropping files at the cursor position doesn't work.
- When using the shadow dom the jQuery 'focusout' event doesn't fire so focus can be restored to a region when in a dialog / modal.

### iOS

- Fixed positioning doesn't work correctly, so it's advised to use the floating interface. This also sometimes effects dialogs.
- iOS reports that it supports the shadow dom, but it doesn't.

### Gecko

- Dropping files doesn't display cursor position, and thus dropping at that place isn't applicable.

### Opera

- onBeforeUnload doesn't work properly (isn't able to ask before navigation after changes have been made).
- Outline styles obscure the mercury interface (problem with z-index+position:fixed+outline css)


## Consulting

I'm available for hire. If you need help implementing, enhancing, or integrating Mercury Editor this might be a worth while option. I don't always have time for freelance/consulting work, so I recommend [Mode Set](http://modeset.com), a small consultancy with amazing folks where I work -- many of the developers there are familiar with Mercury, and it's easier for me to dedicate my days to your issues rather than my evenings.
>>>>>>> 95e6decf9fd1b2a7f705e45b64c210e86cd2c885


## License

<<<<<<< HEAD
Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)

Copyright 2012 [Jeremy Jackson](https://github.com/jejacks0n)

Icons from [GLYPHICONS](http://www.glyphicons.com/)
=======
Licensed under the [MIT License](http://opensource.org/licenses/mit-license.php)

Copyright 2012 [Jeremy Jackson](https://github.com/jejacks0n)


## Enjoy =)
>>>>>>> 95e6decf9fd1b2a7f705e45b64c210e86cd2c885
