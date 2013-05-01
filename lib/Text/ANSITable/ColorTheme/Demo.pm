package Text::ANSITable::ColorTheme::Demo;

use 5.010;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rand_rgb_color mix_2_rgb_colors);

# VERSION

our %color_themes = (

    demo_random_border_color => {
        summary => 'Demoes coderef in item color',
        description => <<'_',

Accept arguments C<border1> and C<border2> to set range of random colors.
Otherwise full range (000000-ffffff) is used.

Also accepts C<border1_bg> and C<border2_bg> to set random background RGB
colors.

_
        colors => {
            border => sub {
                my ($self, %args) = @_;
                my $rgbf1 = $self->{color_theme_args}{border1};
                my $rgbf2 = $self->{color_theme_args}{border2};
                my $rgbf = rand_rgb_color($rgbf1, $rgbf2);
                my $rgbb1 = $self->{color_theme_args}{border1_bg};
                my $rgbb2 = $self->{color_theme_args}{border2_bg};
                my $rgbb;
                if ($rgbb1 && $rgbb2) {
                    $rgbb = rand_rgb_color($rgbb1, $rgbb2);
                }
                [$rgbf, $rgbb];
            },
        },
    },

);

1;
# ABSTRACT: Demo color themes

