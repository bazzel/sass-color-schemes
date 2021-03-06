# Sass-color-schemes

This [Compass](compass-style.org) extension makes it easy to use color schemes in your web pages by providing a collection of colors based on one (base-) color which is supplemented with additional colors to make the best visual impression.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sass-color-schemes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sass-color-schemes

## Usage

Import it into your main stylesheet:

    @import 'sass-color-schemes';

### Color functions

Sass-color-schemes has 4 functions that all return an array of 5 color values (of 5 `null`'s). Each function uses variables, such as `$base-color`, `$variation`, etc. for calculating the proper values.

See [`$sass-color-schemes` variable](#sass-color-schemes-variable) for a description of the different types.

#### scs-primary-colors

Returns an array of 5 colors, in which the first element is the base color and the rest are different shades of the base color. You need the Sass' `nth` function to access a specific color:

```
$color-primary-0: nth(scs-primary-colors(), 1);
$color-primary-1: nth(scs-primary-colors(), 2);
// ... etc.

.title {
  color: $color-primary-0;
}

.subtitle {
  color: $color-primary-1;
}

```

#### scs-complement-colors

Returns an array of 5 colors, in which the first element is the complementary color of base color and the rest are different shades of this complementary color. You need the Sass' `nth` function to access a specific color:


```
$color-complement-0: nth(scs-complement-colors(), 1);
$color-complement-1: nth(scs-complement-colors(), 2);
// ... etc.

.call-to-action {
  background-color: $color-complement-0;
}

```

**Note:** The `scs-complement-colors` function only returns an array of colors when the `$complement` variable is set to `true` or the `$scheme` variable is set to `triad`. Otherwise an array with 5 `null`'s is returned.

#### scs-secondary-1-colors and scs-secondary-2-colors

Some color schemes contain 2 additional colors. These functions each returns an array of 5 colors with, again, 5 different shades of a color. You need the Sass' `nth` function to access a specific color:

```
$color-secondary-1-0: nth(scs-secondary-1-colors(), 1);
$color-secondary-1-1: nth(scs-secondary-1-colors(), 2);
// ... etc.

$color-secondary-2-0: nth(scs-secondary-2-colors(), 1);
$color-secondary-2-1: nth(scs-secondary-2-colors(), 2);
// ... etc.

```
**Note:** The `scs-secondary-1-colors` and `scs-secondary-2-colors` functions only returns an array of colors when the `$scheme` variable is set to `adjacent`, `tetrad` or `triad`. Otherwise an array with 5 `null`'s is returned.

### `$sass-color-schemes` variable

You can (and might want to) configure sass-color-schemes to customize the color scheme. For this you need to define the `$sass-color-schemes` map variable, which contains one or more of the following keys:

* [base-color](#base-color-key)
* [scheme](#scheme-key)
* [complement](#complement-key)
* [angle](#angle-key)
* [variation](#variation-key)
* [mode](#mode-key)

```
$sass-color-schemes: (
  base-color: red,
  scheme: 'monochromatic',
  // ... etc.
);

```

#### `base-color` key

The color used as a base color to calculate the shades and all other colors. This can be any [Sass color](http://sass-lang.com/documentation/Sass/Script/Value/Color.html).

Defaults to `#ff0000` (red).

```
$sass-color-schemes: (
  base-color: red,
  // ... etc.
);

$sass-color-schemes: (
  base-color: hsl(0deg, 100%, 50%),
  // ... etc.
);

$sass-color-schemes: (
  base-color: #ff0000,
  // ... etc.
);
```

#### `scheme` key

Sass-color-schemes supports 4 different color schemes:

* **monochromatic** - all the colors (tints, tones, and shades) of a single hue
* **adjacent** - groups of colors that are adjacent to each other on the color wheel
* **triad** - three colors equally spaced around the color wheel
* **tetrad** - four colors arranged into two complementary color pairs

Defaults to `'monochromatic'`.

```
$sass-color-schemes: (
  scheme: 'monochromatic',
  // ... etc.
);

$sass-color-schemes: (
  scheme: 'tetrad',
  // ... etc.
);
```

#### `complement` key

If set to `true`, the `scs-complement-colors` function returns shades of the complementary color of the `$base-color`.

Defaults to `true`.

```
$sass-color-schemes: (
  complement: false,
  // ... etc.
);

```

#### `angle` key

The angle applied to the `$base-color` to calculate other colors in all schemes, expect `monochromatic`. This can be any value and can be set in degrees (deg) or radian (rad) units as well.

Defaults to `30deg`.

```
$sass-color-schemes: (
  angle: 30,
  // ... etc.
);

$sass-color-schemes: (
  angle: 30deg,
  // ... etc.
);

$sass-color-schemes: (
  angle: 0.5236rad,
  // ... etc.
);
```

#### `variation` key

This will vary the tints, tones and shades of the colors returned by all functions. Currently Sass-color-schemes supports 24 variations:

* lightest pale pastel
* very light pale pastel
* lighter pale pastel
* pale pastel
* darker pale pastel
* dark pale pastel
* greyish darkest
* greyish medium light
* bright pastel
* very light pastel
* lighter pastel
* pastel
* darker pastel
* dark pastel
* greyish dark
* greyish lighter
* shiny
* full colors
* darker colors
* darker neon
* dark
* deep colors
* greyish medium dark
* greyish lightest

Defaults to `default`.

```
$sass-color-schemes: (
  variation: 'darker pale pastel',
  // ... etc.
);

$sass-color-schemes: (
  variation: 'shiny',
  // ... etc.
);

```

#### `mode` key

You can choose between:

* [RGB](http://en.wikipedia.org/wiki/RGB_color_model) (a.k.a. the light model)
* [RYB](http://en.wikipedia.org/wiki/RYB_color_model)

These modes are used internally when calculating colors. RYB is primarily used in art and design education.

Defaults to `ryb`.

```
$sass-color-schemes: (
  mode: 'rgb',
  // ... etc.
);

```

### Test your color scheme

The `scs-test` mixin adds a bar to the top of your page displaying all the colors that your color scheme provides:

```
$sass-color-schemes: (
  base-color: #2980B9,
  variation:  'tetrad'
);

@include scs-test;
```

![image](img/scss-test.png)

`scs-test` accepts the following arguments:

#### `$height`

The height of the colored bar.

Defaults to `2em`.

#### `$selector`

The selector that will contain the colored bar.

Defaults to `body::after`.


### Full example

```
$sass-color-schemes: (
  base-color:         #6893A6,
  variation:          'shiny',
  scheme:             'adjacent',
  angle:              25
);

$color-primary-0:     nth(scs-primary-colors(), 1);
$color-primary-1:     nth(scs-primary-colors(), 2);
$color-primary-2:     nth(scs-primary-colors(), 3);
$color-primary-3:     nth(scs-primary-colors(), 4);
$color-primary-4:     nth(scs-primary-colors(), 5);

$color-complement-0:  nth(scs-complement-colors(), 1);
$color-complement-1:  nth(scs-complement-colors(), 2);
$color-complement-2:  nth(scs-complement-colors(), 3);
$color-complement-3:  nth(scs-complement-colors(), 4);
$color-complement-4:  nth(scs-complement-colors(), 5);

$color-secondary-1-0: nth(scs-secondary-1-colors(), 1);
$color-secondary-1-1: nth(scs-secondary-1-colors(), 2);
$color-secondary-1-2: nth(scs-secondary-1-colors(), 3);
$color-secondary-1-3: nth(scs-secondary-1-colors(), 4);
$color-secondary-1-4: nth(scs-secondary-1-colors(), 5);

$color-secondary-2-0: nth(scs-secondary-2-colors(), 1);
$color-secondary-2-1: nth(scs-secondary-2-colors(), 2);
$color-secondary-2-2: nth(scs-secondary-2-colors(), 3);
$color-secondary-2-3: nth(scs-secondary-2-colors(), 4);
$color-secondary-2-4: nth(scs-secondary-2-colors(), 5);


```

## Contributing

1. Fork it (https://github.com/bazzel/sass-color-schemes/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
