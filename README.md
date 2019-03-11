## after-brunch
Want to run something on the command line everytime [brunch](http://brunch.io) compiles? Easy.

## This fork
...allows you to set an additional option to only run the task for production builds.

## Usage
Add `"after-brunch": "x.y.z"` to `package.json` of your brunch app.
Or `npm install after-brunch --save`.

Then in your `config.coffee` just add any commands to the afterBrunch array.
For example, you might want to use styledocco to create a live styleguide of your stylesheets.

```coffeescript
exports.config =
  …
  plugins:
    afterBrunch: {
      productionOnly: true,
      tasks: [
        'styledocco -n "My Project" css'
      ]
    }
```
